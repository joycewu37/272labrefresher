class Chore < ApplicationRecord
  belongs_to :child
  belongs_to :task

  validates_date :due_on

  scope :by_task, -> { joins(:task).order('name') } 
end
