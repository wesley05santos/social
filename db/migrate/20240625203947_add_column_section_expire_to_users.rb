class AddColumnSectionExpireToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :section_expire, :timestamp
  end
end
