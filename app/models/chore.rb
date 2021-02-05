class Chore < ApplicationRecord
  belongs_to :child
  belongs_to :task

  validates_date :due_on

  scope :by_task, -> { joins(:task).order('name') }
  scope :chronological, -> { joins(:task).order('due_on, completed') }
  scope :pending, -> { where(completed: false) }
end
