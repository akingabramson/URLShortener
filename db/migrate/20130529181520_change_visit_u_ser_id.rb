class ChangeVisitUSerId < ActiveRecord::Migration
  def change
    change_table :visits do |t|
      t.rename :visitor_id, :user_id
    end

    change_table :comments do |t|
      t.rename :parent_link_id, :short_url_id
    end

  end
end
