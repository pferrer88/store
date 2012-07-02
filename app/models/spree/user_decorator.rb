Spree::User.class_eval do
  attr_accessible :email, :password, :password_confirmation, :remember_me, :persistence_token, :login, :role_ids, :user_name, :last_name, :verified, :address, :phone, :company_name
end