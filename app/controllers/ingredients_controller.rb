class IngredientsController < ApplicationController

	before_action :set_ingredient, only: [:edit, :update, :show]
	before_action :require_admin, except: [:show, :index] 

	def new
		@ingredient = Ingredient.new
	end

	def show
		@ingredient_recipes = @ingredient.recipes.paginate(page: params[:page], per_page: 5)
	end

	def create
    @ingredient = Ingredient.new(ingredient_params)
		if @ingredient.save
			flash[:success] = "You have successfully created the ingredient"
			redirect_to ingredient_path(@ingredient)
		else
			flash[:danger] = "There was a problem with creating the ingredient"
			render 'new'
		end
		
	end

	def edit
		
	end

	def update
		if @ingredient.update(ingredient_params)
			flash[:success] = "You have successfully edited the ingredient"
			redirect_to ingredient_path(@ingredient)
		else
			flash[:danger] = "There was a problem with editing the ingredient"
			render 'edit'
		end
	end

	def index
    @ingredients = Ingredient.paginate(page: params[:page], per_page: 5)
	end

	private

		def ingredient_params
			params.require(:ingredient).permit(:name)
		end

		def set_ingredient
			@ingredient = Ingredient.find(params[:id])
		end

		def require_admin
			if !logged_in? || (logged_in? && !current_chef.admin?)
				flash[:danger] = "Only admin users can perform that action"
				redirect_to ingredients_path
			end
		end

end