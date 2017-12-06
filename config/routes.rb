Rails.application.routes.draw do
  #Routes for home
  get"/", :controller => "items", :action => "index"
  
  # Routes for the Follower resource:
  # CREATE
  get "/followers/new", :controller => "followers", :action => "new"
  post "/create_follower", :controller => "followers", :action => "create"

  # READ
  get "/followers", :controller => "followers", :action => "index"
  get "/followers/:id", :controller => "followers", :action => "show"

  # UPDATE
  get "/followers/:id/edit", :controller => "followers", :action => "edit"
  post "/update_follower/:id", :controller => "followers", :action => "update"

  # DELETE
  get "/delete_follower/:id", :controller => "followers", :action => "destroy"
  #------------------------------

  # Routes for the Item resource:
  # CREATE
  get "/items/new", :controller => "items", :action => "new"
  post "/create_item", :controller => "items", :action => "create"

  # READ
  get "/items", :controller => "items", :action => "index"
  get "/items/:id", :controller => "items", :action => "show"

  # UPDATE
  get "/items/:id/edit", :controller => "items", :action => "edit"
  post "/update_item/:id", :controller => "items", :action => "update"

  # DELETE
  get "/delete_item/:id", :controller => "items", :action => "destroy"
  #------------------------------

  # Routes for the Like resource:
  # CREATE
  get "/likes/new", :controller => "likes", :action => "new"
  post "/create_like", :controller => "likes", :action => "create"

  # READ
  get "/likes", :controller => "likes", :action => "index"
  get "/likes/:id", :controller => "likes", :action => "show"

  # UPDATE
  get "/likes/:id/edit", :controller => "likes", :action => "edit"
  post "/update_like/:id", :controller => "likes", :action => "update"

  # DELETE
  get "/delete_like/:id", :controller => "likes", :action => "destroy"
  #------------------------------

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
