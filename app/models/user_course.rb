class UserCourse < ActiveRecord::Base
  has_many :user_subjects, dependent: :destroy
  belongs_to :course
  belongs_to :user
end