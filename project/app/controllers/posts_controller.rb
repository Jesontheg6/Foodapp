class PostsController < ApplicationController

def new
	@post = Post.new
end 

def create
		@post = current_user.posts.new(post_params)
		if @post.save
		  flash[:notice] = "your time is saved successfully"
		  redirect_to "/posts/feed"
		else 
			flash[:notice] = "You have not logged in yet"
			redirect_to	"/login"
		end
	end 

	def destroy

    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
    	format.html { redirect_to root_path, notice: "Project was successfully destroy. "}
    	format.json { render json: { id: params[:id]} }
    end
  end 

  def show_location
   @post = Post.find(params[:id])
  end 

  def show_user_profilr
  	@post =  Post.find(params[:id])
  end 


  def show
    @post = Post.all
  end 
  	
private

	def post_params
	  params.require(:post).permit(:review ,:ratings, :longitude, :latitude)
	end 
end
