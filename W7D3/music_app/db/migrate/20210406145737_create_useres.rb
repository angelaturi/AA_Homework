class CreateUseres < ActiveRecord::Migration[5.2]
  def change
    create_table :useres do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false

      t.timestamps
    end

    add_index :useres, :session_token, unique: true
    add_index :useres, :email, unique: true
  end
end
