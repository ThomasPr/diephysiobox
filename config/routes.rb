Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#show', id: 'home'
  get '/home', to: redirect('/')
  get 'sitemap.xml', to: 'home#sitemap', format: 'xml', as: :sitemap

  get 'athletik/kurse', to: 'events#show'

  get  'kontakt', to: 'kontakt#new'
  post 'kontakt', to: 'kontakt#create'

  get "/*id" => 'pages#show', as: :page, format: false

end
