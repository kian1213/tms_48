class Subject < ActiveRecord::Base
  has_many :course_subjects
  has_many :courses, through: :course_subjects
  has_many :activities, as: :target
  has_many :tasks

  accepts_nested_attributes_for :tasks, reject_if:
    lambda {|a| a[:title].blank?}, allow_destroy: true
end