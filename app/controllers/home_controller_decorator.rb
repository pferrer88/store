Spree::HomeController.class_eval do

  def index
    @searcher = Spree::Config.searcher_class.new(params)
    @products = @searcher.retrieve_products
    @new = Spree::Product.limit(3)
    respond_with(@products, @new)
    
    
    
  end

end