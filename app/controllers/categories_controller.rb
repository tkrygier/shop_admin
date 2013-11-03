class CategoriesController < ApplicationController

  def index
    if user_signed_in?
      redirect_to :controller => 'admin/categories', :action => 'index'
    end
    @categories = Category.all
  end

  def show
    if user_signed_in?
      redirect_to :controller => 'admin/categories', :action => 'show'
    end
    @categories = Category.all
    @category = Category.find(params[:id])
    @products = Product.all
    @products_cat = Product.select { |p|  p.category_id == @category.id }
  end

end
