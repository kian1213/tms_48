class UsersController < ApplicationController
  load_and_authorize_resource

  before_action :get_user_courses_and_tasks, only: [:show]
  before_action :get_trainees

  private

  def get_user_courses_and_tasks
    @user_courses = @user.user_courses
    @active_user_course = @user_courses.find_by course_id: Course.active.first.id
    @user_tasks = UserTask.where("user_id = ?", params[:id])
  end

  def get_trainees
    @users = User.trainee
  end
end