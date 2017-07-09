class AddDeviseToUsers < ActiveRecord::Migration[5.0]
  def change
    ## Database authenticatable
    add_column :users, :email, :string
    add_column :users, :encrypted_password, :string

    ## Rememberable
    add_column :users, :remember_created_at, :datetime
    
    ## Trackable
    add_column :users, :sign_in_count, :integer, :default => 0
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string

    add_index :users, :email, unique: true
  end
end

