class AddLongUrlTable < ActiveRecord::Migration
  def change
    create_table :long_urls do |t|
      t.string :long_url
      t.string :title
    end
  end
end
