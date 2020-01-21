Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/eat', to: 'nppbot#eat'
  get '/request_headers', to: 'nppbot#show_request_headers'
  get '/request_body', to: 'nppbot#request_body'
  get '/response_headers', to: 'nppbot#response_headers'
  get '/response_body', to: 'nppbot#show_response_body'
  get '/sent_request', to: 'nppbot#sent_request'
end
