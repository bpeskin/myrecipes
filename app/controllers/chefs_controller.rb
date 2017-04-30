class ChefsController < ApplicationController

	def new
		@chef = Chef.new
	end

	def index
		@Chefs = Chef.all
	end

	def create
		@chef = Chef.new(chef_params)
		if @chef.save
			flash[:success] = "#{@chef.chefname}, Welcome to MyRecipes App!"
			redirect_to chef_path(@chef)
		else
			render 'new'
		end
	end

	def show
		@chef = Chef.find(params[:id])
	end

	def edit
		@chef = Chef.find(params[:id])
	end

	def update
		@chef = Chef.find(params[:id])
		if @chef.update(chef_params)
			flash[:success] = "Your account was updated successfully"
			redirect_to chef_path(@chef)
		else
			render 'edit'
		end
	end

	private

		def chef_params
			params.require(:chef).permit(:chefname, :email, :password, :password_confirmation)
		end

end