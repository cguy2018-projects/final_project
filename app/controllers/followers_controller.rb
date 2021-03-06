class FollowersController < ApplicationController
  def index
    @followers = Follower.all

    render("followers/index.html.erb")
  end

  def show
    @follower = Follower.find(params[:id])

    render("followers/show.html.erb")
  end

  def new
    @follower = Follower.new

    render("followers/new.html.erb")
  end

  def create
    @follower = Follower.new

    @follower.user_id = params[:user_id]

    save_status = @follower.save

    if save_status == true
      redirect_to("/followers/#{@follower.id}", :notice => "Follower created successfully.")
    else
      render("followers/new.html.erb")
    end
  end

  def edit
    @follower = Follower.find(params[:id])

    render("followers/edit.html.erb")
  end

  def update
    @follower = Follower.find(params[:id])

    @follower.user_id = params[:user_id]

    save_status = @follower.save

    if save_status == true
      redirect_to("/followers/#{@follower.id}", :notice => "Follower updated successfully.")
    else
      render("followers/edit.html.erb")
    end
  end

  def destroy
    @follower = Follower.find(params[:id])

    @follower.destroy

    if URI(request.referer).path == "/followers/#{@follower.id}"
      redirect_to("/", :notice => "Follower deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Follower deleted.")
    end
  end
end
