class Posts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |table|
      table.string :title
      table.string :content
      table.integer :user_id
    end
  end
end
