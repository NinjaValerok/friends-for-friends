class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :nick_name
      t.string :phone
      t.string :avatar
    end
    add_index :users, :nick_name, unique: true
    add_index :users, :phone, unique: true
  end
end
