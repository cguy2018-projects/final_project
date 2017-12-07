class UsersController < ApplicationController

  def index
    @users = User.all

    render("users/index.html.erb")
    
    #@bookmarks = Bookmark.where({ :user_id => current_user.id })
    
    #Can also use this syntax below instead
    # @bookmarks = current_user.bookmarks

  end
  
  def show
    @users = User.find(params[:id])
    @items = Item.where({:user_id => current_user.id })

    render("/users/show.html.erb")
  end
  
  def new
    @user = User.new
    
    render("users/new.html.erb")
  end
  
  def create
  
    @user = User.new
    
    @user.id = params[:id]
    @user.username = params[:username]
    
    @user.save
    
  end
  
end