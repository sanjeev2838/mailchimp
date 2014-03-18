Mailchimp::Application.routes.draw do
  devise_for :users
  get "dashboard/index"
  get "home/index"
  root 'home#index'
  match 'home/subscribe' => 'home#subscribe' , via:[:post]
end
