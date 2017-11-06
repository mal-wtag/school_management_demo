class UsersController < ApplicationController
  before_action :set_user, only:[:show,:edit,:update,:destroy]

  def index
    @users=User.all
  end

  def show
  end

  def new
    @user=User.new
  end

  def edit
  end

  def create
    @user= User.new(user_params)
    if @user.save
      flash[:success]="User created"
      redirect_to @user
    else
      render 'new'
    end

  end

  def update
    if User.update(user_params)
      flash[:success]="User updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:danger]="User destroyed"
    redirect_to users_url
  end

  private

    def set_user
      @user=User.find_by(id: params[:id])
    end

    def user_params
      params.require(:user).permit(:name,:phone,:roll,:address)
    end



end

