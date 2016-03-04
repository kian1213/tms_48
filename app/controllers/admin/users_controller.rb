class Admin::UsersController < AdminController
  def index
    @supervisors = User.supervisor
    @trainees = User.trainee
  end

  def show
    @user = User.find params[:id]
    @user_tasks = UserTask.where("user_id = ?", params[:id])
    @user_task = UserTask.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = t ".success"
      redirect_to admin_users_path
    else
      render "new"
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]

    if @user.update_attributes user_params
      flash[:success] = t ".success"
      redirect_to admin_users_path
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find params[:id]

    @user.destroy
    flash[:success] = t ".destroy"
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit :first_name, :last_name, :email,
      :password, :password_confirmation, :user_type, :admin, :avatar
  end
end