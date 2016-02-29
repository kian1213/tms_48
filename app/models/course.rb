class Course < ActiveRecord::Base
  has_many :supervisor_courses
  has_many :users, through: :supervisor_courses
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects
  has_many :user_courses

  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true

  accepts_nested_attributes_for :course_subjects, reject_if:
    lambda {|a| a[:subject_id].blank?}, allow_destroy: true

  accepts_nested_attributes_for :supervisor_courses, reject_if:
    lambda {|a| a[:user_id].blank?}, allow_destroy: true

  before_save :get_last_user_course_id
  after_update :create_user_subjects

  private

  def get_last_user_course_id
    @prev_user_course_id =  UserCourse.last.id
  end

  def create_user_subjects
    new_user_courses = UserCourse.where("id > ?", @prev_user_course_id)

    if new_user_courses.any?
      new_user_courses.map{|user_course|
        user_course.course.course_subjects.each do|course|
          UserSubject.create(
            user_course_id: user_course.id,
            user_id: user_course.user_id,
            subject_id: course.subject_id,
            status: "Not Finish"
            )
        end
      }
    end
  end
end