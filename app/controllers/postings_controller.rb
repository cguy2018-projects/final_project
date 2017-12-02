class PostingsController < ApplicationController
  def index
    @postings = Posting.all

    render("postings/index.html.erb")
  end

  def show
    @posting = Posting.find(params[:id])

    render("postings/show.html.erb")
  end

  def new
    @posting = Posting.new

    render("postings/new.html.erb")
  end

  def create
    @posting = Posting.new

    @posting.user_id = params[:user_id]
    @posting.item_id = params[:item_id]

    save_status = @posting.save

    if save_status == true
      redirect_to("/postings/#{@posting.id}", :notice => "Posting created successfully.")
    else
      render("postings/new.html.erb")
    end
  end

  def edit
    @posting = Posting.find(params[:id])

    render("postings/edit.html.erb")
  end

  def update
    @posting = Posting.find(params[:id])

    @posting.user_id = params[:user_id]
    @posting.item_id = params[:item_id]

    save_status = @posting.save

    if save_status == true
      redirect_to("/postings/#{@posting.id}", :notice => "Posting updated successfully.")
    else
      render("postings/edit.html.erb")
    end
  end

  def destroy
    @posting = Posting.find(params[:id])

    @posting.destroy

    if URI(request.referer).path == "/postings/#{@posting.id}"
      redirect_to("/", :notice => "Posting deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Posting deleted.")
    end
  end
end
