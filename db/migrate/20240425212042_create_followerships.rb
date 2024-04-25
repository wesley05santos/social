class CreateFollowerships < ActiveRecord::Migration[7.1]
  def change
    create_table :followerships, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :following, null: false, foreign_key: { to_table: :users }, type: :uuid

      t.timestamps
    end
  end
end
