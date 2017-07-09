class CreateFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds do |t|
      t.text :message
      t.string :external_id
      t.string :provider
      t.string :type
      t.string :author_uid
      t.string :provider_type
      t.datetime :provider_created_at
      t.datetime :provider_updated_at
      t.references :author, index: true, foreign_key: { to_table: :users }
      t.datetime :created_at
    end
  end
end
