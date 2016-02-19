class Course < ActiveRecord::Base
  has_many :supervisor_courses
  has_many :users, through: :supervisor_courses
  has_many :course_subjects
  has_many :subjects, through: :course_subjects
  has_many :user_courses
end