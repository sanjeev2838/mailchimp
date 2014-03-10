Mailchimp::Application.routes.draw do
  get "home/index"
  root 'home#index'
  match 'home/subscribe' => 'home#subscribe' , via:[:post]
end
