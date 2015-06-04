class Deck < ActiveRecord::Base
  #belongs_to :teacher,polymorphic: :playable
  #belongs_to :student,polymorphic: :playable
  #belongs_to :user
  has_many :cards
  belongs_to :user
end