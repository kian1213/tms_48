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
end