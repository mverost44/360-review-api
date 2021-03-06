class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :vehicle
      t.string :shovel
      t.string :payment
      t.integer :respectful
      t.integer :punctual
      t.integer :honest
      t.integer :attitude
      t.integer :teamPlayer
      t.integer :trustworthy
      t.integer :openToFeedback
      t.integer :communication
      t.text :comments

      t.timestamps
    end
  end
end
