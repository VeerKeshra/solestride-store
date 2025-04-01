# app/controllers/admin/variants_controller.rb
class Admin::VariantsController < ApplicationController
  before_action :set_product
  before_action :set_variant, only: [ :edit, :update, :destroy ]
  before_action :require_admin

  def new
    @variant = @product.variants.build
  end

  def create
    @variant = @product.variants.build(variant_params)
    if @variant.save
      redirect_to admin_product_path(@product), notice: "Variant added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @variant.update(variant_params)
      redirect_to admin_product_path(@product), notice: "Variant updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @variant.destroy
    redirect_to admin_product_path(@product), notice: "Variant deleted."
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_variant
    @variant = @product.variants.find(params[:id])
  end

  def variant_params
    params.require(:variant).permit(:size, :color, :stock_quantity)
  end
end
