class Chore < ApplicationRecord
  belongs_to :child
  belongs_to :task

  validates_date :due_on

  scope :by_task, -> { joins(:task).order('name') }
  scope :chronological, -> { joins(:task).order('due_on, completed') }
  scope :pending, -> { where(completed: false) }
  scope :done, -> { where(completed: true) }
  scope :upcoming, -> { where('due_on >= ?', Time.now.to_date) }
  scope :past, -> { where('due_on < ?', Time.now.to_date) }

  def status
    return "Completed" if completed
    return "Pending"
  end
end
