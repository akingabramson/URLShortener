class UpdateAuthorAndCreatorId < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.rename :author_id, :user_id
    end

    change_table :short_urls do |t|
      t.rename :creator_id, :user_id
    end

    change_table :tag_topics do |t|
      t.rename :topic, :tag_topic
    end
  end
end
