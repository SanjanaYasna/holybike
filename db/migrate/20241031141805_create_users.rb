class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :identifier
      t.string :fname
      t.string :lname
      t.string :email 
      t.string :phone
      t.string :pword
      t.timestamps
    end
  end
end
