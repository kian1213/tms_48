class Task < ActiveRecord::Base
  has_many :user_tasks
  belongs_to :subject
  belongs_to :course
end