class AddTopicJoinTable < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :tag_topic_id
      t.integer :short_url_id
    end
  end
end
