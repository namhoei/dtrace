Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  scope '/api' do
    get '/fleet' => 'api#fleet'
    get '/outbound' => 'api#outbound'
    get '/slowsql' => 'api#slowsql'
    get '/nsql' => 'api#nsql'
    get '/bulksql' => 'api#bulksql'
    get '/serial' => 'api#serial'
    get '/concurrent' => 'api#concurrent'
    get '/timeout' => 'api#timeout'
    get '/dblock' => 'api#dblock'
  end
end
