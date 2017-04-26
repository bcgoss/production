class Task < ApplicationRecord
  belongs_to :list
  has_many :task_resources
  has_many :resources, through: :task_resources

  validates_presence_of :name, :description, :estimate, :completed
end
