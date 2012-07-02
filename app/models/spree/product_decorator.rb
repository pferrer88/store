Spree::Product.class_eval do
  default_scope order("created_at DESC")
end