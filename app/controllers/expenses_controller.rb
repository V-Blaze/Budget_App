class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def new
    @expense = Expense.new
    @categories = Category.created_by_current_user(current_user)
  end

  def index
    @expenses = Expense.joins(:categories).where(categories: { id: params[:category_id] }).order(created_at: :desc)
    @category = Category.find(params[:category_id])
  end

  def create
    params = expense_params
    @expense = Expense.new(name: params[:name], amount: params[:amount])
    @expense.author = current_user
    @categories_id = params[:ids]

    @categories_id.each do |id|
      category = Category.find(id) unless id == ''
      @expense.categories.push(category) unless category.nil?
    end

    return :new unless @expense.categories.any?

    if @expense.save
      redirect_to category_expenses_path(@expense.categories.first.id), notice: 'Expenses added successfully'
    else
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, ids: [])
  end

  def create_general_category
    @general = current_user.categories.where(name: 'General').first

    if @general.nil?
      @general = Category.create(name: 'General',
                                 icon: 'https://cdn-icons-png.flaticon.com/512/3418/3418001.png', author: current_user)
    end

    @general
  end
end
