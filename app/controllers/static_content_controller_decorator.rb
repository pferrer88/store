Spree::StaticContentController.class_eval do
	def show
    path = case params[:path]
    when Array
			params[:path].join("/")
    when String
      params[:path]
    when nil
      request.path
    end

    unless @page = Spree::Page.visible.by_slug(path).first
      render_404
    end
  end
end