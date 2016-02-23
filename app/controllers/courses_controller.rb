class CoursesController < ApplicationController
  load_and_authorize_resource
  before_action :load_all_subjects, on: [:new, :edit]

  def create
    if @course.save course_params
      flash[:notice] = t ".success"
      redirect_to current_user
    else
      render "new"
    end
  end

  def update
    if @course.update_attributes course_params
      flash[:notice] = t ".success"
      redirect_to current_user
    else
      render "edit"
    end
  end

  def destroy
    @course.destroy
    flash[:notice] = t ".success"
    redirect_to current_user
  end

  private

  def course_params
    params.require(:course).permit :user_id, :title, :description, :start_date, :end_date,
      :status, course_subjects_attributes: [:id, :course_id, :subject_id, :_destroy]
  end

  def load_all_subjects
    @subjects = Subject.all
  end
end