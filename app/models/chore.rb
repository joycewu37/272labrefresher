class Chore < ApplicationRecord
  belongs_to :child
  belongs_to :task

  validates_date :due_on
end
