Rails.application.routes.draw do
  get 'home/index'

  namespace :admin do
    root :to => "posts#index"
    resources :posts, :tags, :composers
  end

  get 'admin/auth' => 'admin/auth#index'
  post 'admin/auth' => 'admin/auth#create'
  get 'posts' => 'posts#index'
  get 'posts/read/:id' => 'posts#read'
  post  'posts/read/:id' => 'posts#comment'

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

  get 'composers' => 'composers#index'
  get 'composers/read/:id' => 'composers#read'

  root 'home#index'
end
