class Child < ApplicationRecord
  has_many :chores
  has_many :tasks, through: :chores

  validates_presence_of :first_name
  validates_presence_of :last_name

  scope :alphabetical, -> { order('last_name, first_name') }
  scope :active, -> { where(active: true) }

  def name
    return first_name + " " + last_name
  end 

  def points_earned
    self.chores.done.inject(0){|sum,chore| sum += chore.task.points}
  end   
end
