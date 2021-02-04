class Task < ApplicationRecord
    has_many :chores
    has_many :children, through: :chores

    validates_presence_of :name
end
