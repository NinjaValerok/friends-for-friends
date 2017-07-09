class CreateFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds do |t|
      t.text :message
      t.string :external_id
      t.string :provider
      t.datetime :update
    end
  end
end
