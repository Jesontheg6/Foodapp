class UsersController < ApplicationController

	def new
  	@user = User.new
  end


  def create
  	@user = User.new(user_params)
    if @user.save 
    	session[:user_id] = @user.id
    	redirect_to "/feed", notice: "User successfully created"
    	else
       render 'new'
    end 
  end 

  def edit
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])
    if @user.update(birthday: user_params[:birthday], country: user_params[:country])
      redirect_to "/users/show"
    else 
      flash[:danger] = 'Error submtting info'
      render :edit
    end
  end

  def forget
  	@user = User.find(params[:id])
  	if @user.update(password: user_params(:password))
  		redirect_to "/users/feed"
  		flash[:notice] = "Password has been updated"
  	else
  		flash[:danger] = 'Error submtting info'
  	end 
  end 
 

  def confirm_email
  	

  end


  def user_params
    params.require(:user).permit(:name, :birthday, :email, :country, :gender, :password, :password_confirmation)
  end




end 
