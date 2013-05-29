class AddShortUrlTable < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.string :short_url
      t.integer :creator_id
      t.integer :long_url_id
    end
  end
end
