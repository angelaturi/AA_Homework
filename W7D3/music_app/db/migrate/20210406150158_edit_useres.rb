class EditUseres < ActiveRecord::Migration[5.2]
  def change
    rename_table :useres, :users
  end
end
