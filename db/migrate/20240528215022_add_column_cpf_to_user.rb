class AddColumnCpfToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :cpf, :string
  end
end
