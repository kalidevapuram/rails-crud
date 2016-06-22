class UsersController < ApplicationController
  def index
  	@user = User.all


    # Why are you destroying session here ?
  	session.destroy
  	puts @user.inspect
  


  end
  def new
  

  	# @user = User.all
  	# @user = User.create( first_name: params[:first_name], 
  	# 	last_name: params[:last_name],
  	# 	email: params[:email],
  	# 	password: params[:password])
  	# puts @user
  




    # So here technically you should have to render "new"
    # If you call your method the same as the name of the file you are trying to render
    # and the file is within the users folder within the views folder. It will look 
    # for that file automatically render it 
  	render "new"
  

  end
  def create
  	@user = User.create user_params
  	
  	if @user
  		redirect_to "/users"
  	else
  		redirect_to "users/new"
  	end
  end
  def show
  	# fail
  	puts params[:id]
  	@user = User.find_by_id(params[:id])
  	puts "#****** #{@user}"
  end

  def edit
  	@user = User.find_by_id(params[:id])
  end

  def update
  	@user = User.find_by_id(params[:id]).update user_params
  	redirect_to "/users"
  end

  def destroy
  	@user = User.delete(params[:id])
  	redirect_to "/users"
  end

  private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end

end
