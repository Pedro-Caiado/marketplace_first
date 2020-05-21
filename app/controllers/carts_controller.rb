class CartsController < ApplicationController
  def add
    @product = Product.find(params['format'])

    if current_user.carts.opened.present?
      current_user.carts.opened.last.products << @product
    else
      cart = current_user.carts.create
      cart.products << @product
    end

    redirect_to root_path
  end

  def remove
    @product = Product.find(params['format'])
    @products_equals = current_user.carts.opened.last.products.select{|product| product.id == @product.id}.to_a

    if current_user.carts.opened.present?
      products = @products_equals
      products.pop
      products << current_user.carts.opened.last.products.reject{|product| product.id == @product.id}
      current_user.carts.opened.last.products = []
      current_user.carts.opened.last.products << products
    end

    redirect_to cart_path(current_user.carts.opened.last)
  end

  def finish
    @cart = Cart.find(params['format'])

    if @cart.finish!
      flash[:notice] = 'Sucessfull Purchase'
      redirect_to root_path
    else
      redirect_to cart_path(current_user.carts.opened.last)
    end
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def index
    @carts = current_user.carts
  end
end
