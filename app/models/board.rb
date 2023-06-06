class Board < ApplicationRecord
  attr_accessor :width, :height, :number_of_mines

  validates :email, presence: true
  validates :name, uniqueness: true, presence: true
end
