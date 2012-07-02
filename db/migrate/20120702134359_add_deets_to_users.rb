class AddDeetsToUsers < ActiveRecord::Migration
  def change
    add_column :spree_users, :user_name, :string
    add_column :spree_users, :user_lastname, :string
    add_column :spree_users, :company_name, :string
    add_column :spree_users, :address, :string
    add_column :spree_users, :phone, :string
    add_column :spree_users, :verified, :boolean
  end
end
