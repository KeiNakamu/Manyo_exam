class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :user_admin, only: %i[ index ]
  before_action :ensure_correct_user, only: %i[ show ]
  skip_before_action :login_required, only: %i[ new create ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
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
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), notice: "User was successfully created."
    else
      render :new
    end
    
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "ユーザーの内容を更新しました"
    else
      flash.now[:danger] = "ユーザーを更新できませんでした"
      render :edit
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def ensure_correct_user
    @user = User.find(params[:id])
      unless @user == current_user
      redirect_to tasks_path, notice: "他人のページへはいけません"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
    end

    def user_admin
      @users = User.all
      if  current_user.admin == false
          redirect_to root_path
      else
          render action: "index"
      end
    end
end
