class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @links = @category.links
  end
end
