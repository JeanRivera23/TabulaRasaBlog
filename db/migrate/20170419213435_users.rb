class Users < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |table|
      table.string :fname
      table.string :lname
      table.string :password
    end
  end
end
