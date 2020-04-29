Rails.application.routes.draw do
  get 'home/index'

  namespace :admin do
    resources :posts
  end

  get 'admin/auth' => 'admin/auth#index'
  get 'posts' => 'posts#index'
  get 'posts/read/:id' => 'posts#read'
  get 'topics' => 'topics#index'
  get 'topics/read/:id' => 'topics#read'

  get 'auth/login' => 'auth#login'
  get 'auth/signup' => 'auth#signup'
  post 'auth/signup' => 'auth#create'
  post 'auth/login' => 'auth#signin'
  get 'auth/logout' => 'auth#logout'

  get 'forum' => 'thread#index'
  get 'forum/read/:id' => 'thread#read'
  get 'forum/create' => 'thread#create_form'
  post 'forum/create' => 'thread#create'
  post 'forum/read/:id' => 'thread#comment'

  root 'home#index'
end
