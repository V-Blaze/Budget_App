class CategoriesController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @category = Category.new
    end

    def index
        @categories = Category.created_by_current_user(current_user)
    end

    def create
        @category = Category.new(category_params)
        @category.user = current_user

        if @category.save
            redirect_to categories_path, notice: 'Category created successfully'
        else
            render :new
        end
    end

    private

    def category_params
        params.require(:category).permit(:name, :icon)
    end
end
