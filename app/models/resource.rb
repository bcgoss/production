class Resource < ApplicationRecord
  has_many :task_resources
  has_many :tasks, through: :task_resources
  validates_presence_of :name, :description, :link
end
