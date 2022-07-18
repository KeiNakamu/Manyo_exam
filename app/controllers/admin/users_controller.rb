class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :admin_user

  def index
    @users = User.select(:id, :name, :email, :admin).order("created_at ASC").page(params[:page]).per(7)
  end

  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_path(@user), notice: "User was successfully created."
    else
      render :new
    end
    
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "ユーザーの内容を更新しました"
    else
      flash.now[:danger] = "ユーザーを更新できませんでした"
      render :edit
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    if @user.destroy
      redirect_to admin_users_path, success: 'ユーザーを削除しました'
    else
      redirect_to admin_users_path, notice: '管理者は必ず一人はいなければいけません!'
    end
  end


  private
  def set_user
    @user = User.find(params[:id])
  end

  def admin_user
    unless current_user.admin?
    redirect_to root_path, notice: "管理者以外はアクセスできません"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation, :admin)
  end

  def admin_destroy
    if @user == current_user
      redirect_to admin_users_path, notice: "自分自身を削除することは出来ません。"
    end
  end
end
