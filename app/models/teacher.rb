class Teacher<User
  has_many :decks, as: :playable
  # has_one :deck
end