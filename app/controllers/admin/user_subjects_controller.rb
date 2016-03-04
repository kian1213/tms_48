class Admin::UserSubjectsController < AdminController
  def update
    @user_subject = UserSubject.find params[:id]

    if @user_subject.update_attributes user_subject_params
      flash[:success] = t ".success"
      redirect_to admin_user_path user_subject_params[:user_id]
    else
      flash[:success] = t ".success"
      redirect_to admin_user_path user_subject_params[:user_id]
    end
  end

  private

  def user_subject_params
    params.require(:user_subject).permit :status, :user_id
  end
end