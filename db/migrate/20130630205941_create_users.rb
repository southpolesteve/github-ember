class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :provider
      t.string :uid
      t.string :avatar
      t.string :github_token
      t.string :github_login

      t.timestamps
    end
  end
end
