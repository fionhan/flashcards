class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :country
      t.string :student_no
      t.string :teacher_no
      t.string :type
      t.timestamps
    end

    create_table :decks do |t|
      t.string :name
      #t.belongs_to :user
      #it does not need polymorphyc association because student and teacher are stored in one table
      #their ids are not same to each other!!
      t.string :playable_type
      t.integer :playable_id
      t.timestamps
    end

    create_table :cards do |t|
      t.string :front
      t.string :back
      t.belongs_to :deck
      t.timestamps
    end
  end
end
