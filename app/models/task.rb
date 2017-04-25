class Task < ApplicationRecord
  belongs_to :list
  has_many :task_resources
  has_many :resources, through: :task_resources
end
