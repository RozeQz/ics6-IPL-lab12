class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :username
      t.string :password_digest
      t.datetime :last_login_at

      t.timestamps
    end
  end
end
