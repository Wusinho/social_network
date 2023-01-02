class AddSignedIn < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_signed_in, :boolean, default: false
  end
end
