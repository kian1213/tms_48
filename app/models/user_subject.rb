class UserSubject < ActiveRecord::Base
  has_many :user_tasks, dependent: :destroy
  belongs_to :user_course
  belongs_to :user
  belongs_to :subject
end