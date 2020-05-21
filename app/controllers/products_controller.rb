class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /products
  # GET /products.json
  def index
    @products = Product.all.order("created_at desc")
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    if user_signed_in?
      @product = current_user.products.new
    else
      redirect_to new_user_session_path
    end
  end

  # GET /products/1/edit
  def edit
  end

  def create
    @product = current_user.products.create(product_params)

    if @product.save
      flash[:notice] = 'Product was successfully created.'
      redirect_to products_path
    else
      flash[:notice] = 'Try it again'
      render 'new'
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product.update(product_params)

    if @product.save
      flash[:notice] = 'Product was successfully Edited'
      redirect_to products_path
    else
      flash[:notice] = 'Try it again'
      render 'edit'
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:brand, :model, :description, :condition, :finish, :title, :price, :image)
  end
end