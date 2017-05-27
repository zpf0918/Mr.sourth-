module ProductsHelper

  def render_product_status(product)
    if product.is_hidden
         "(已下架)"
    else
         "(已上架)"
     end
  end

end
