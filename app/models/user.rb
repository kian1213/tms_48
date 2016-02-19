class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :supervisor_courses
  has_many :courses, through: :supervisor_courses
  has_many :activities, as: :target
  has_many :user_courses
  has_many :user_subjects
  has_many :user_tasks
end
