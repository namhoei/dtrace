class ApiController < ApplicationController
  include Dry::Monads::List::Mixin
  include Dry::Monads::Task::Mixin

  def fleet
    # mainapp -> http -> grpc
    render json: {tracing: 'fleet'}
  end

  def outbound
    conn = Faraday.new(url: "https://www.google.com/") do |c|
      c.use OpenCensus::Trace::Integrations::FaradayMiddleware,
        span_name: "outbound request"
      c.adapter Faraday.default_adapter
    end
    conn.get "/"

    OpenCensus::Trace.in_span "custom span" do
      sleep rand
    end

    render json: {tracing: 'outbound request'}
  end

  def slowsql
    p Trade.where({Series_title_2: 'CASEIN'})
    # count = Geo.where({geo_count: 117}).count

    render json: {tracing: 'slow sql'}
  end

  def nsql
    Survey.where({Industry_code_NZSIOC: '99999'}).to_a.each do |survey|
      p Survey.find(survey.id).to_json
    end

    render json: {tracing: 'n+1 sql'}
  end

  def bulksql
    s = Survey.where({Industry_code_NZSIOC: '99999'})
    # think query with another table
    p Survey.where({id: s.to_a}).to_json

    render json: {tracing: 'bulk sql'}
  end

  def serial
    (1..10).each do |i|
      OpenCensus::Trace.in_span "send email" do
        sleep 1
        p i
      end
    end

    render json: {tracing: 'serial'}
  end

  def concurrent
    span_context = OpenCensus::Trace.span_context

    list = (1..10).reduce(List::Task[]) do |list, i|
      task = Task[:io] do
        OpenCensus::Trace.span_context = span_context

        OpenCensus::Trace.in_span "send email" do
          sleep 1
          p i
        end
      end

      list + List::Task[task]
    end

    list.typed(Task).traverse.value!

    render json: {tracing: 'concurrent'}
  end

  def timeout
    url = URI.parse("http://httpstat.us/200?sleep=8000")
    http = Net::HTTP.new(url.host, url.port)
    http.read_timeout = 10

    http.start() do |http|
      http.get(url.request_uri)
    end

    render json: {tracing: 'timeout'}
  end

  def dblock
    render json: {tracing: 'dblock'}
  end
end
