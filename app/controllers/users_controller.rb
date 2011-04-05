class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy
  before_filter :new_create_user, :only => [:new, :create]

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    #if signed_in?
    #  redirect_to root_url
    #end
    @user = User.new
    @title = "Sign up"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

  def edit
    @title = "Edit user"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    if !user.admin? && user.id != (params[:id])
      user.destroy
      flash[:success] = "User deleted."
      redirect_to users_path
    else
      flash[:error] = "You can't delete yourself."
      redirect_to users_path
    end
    #User.find(params[:id]).destroy
    #flash[:success] = "User deleted."
    #redirect_to users_path
  end

  private

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      if !current_user.nil? #DEBUG
        redirect_to(root_path) unless current_user.admin?
      else
        redirect_to(signin_path)
      end
    end

    def new_create_user
      redirect_to(root_path) unless !signed_in?
    end

end
