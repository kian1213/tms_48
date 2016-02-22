class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum user_type: {admin: 0, supervisor: 1, trainee: 2}

  mount_uploader :avatar, AvatarUploader
  has_many :supervisor_courses
  has_many :courses, through: :supervisor_courses
  has_many :courses
  has_many :activities, as: :target
  has_many :user_courses
  has_many :user_subjects
  has_many :user_tasks

  def full_name
    [first_name, last_name].join(" ")
  end
end