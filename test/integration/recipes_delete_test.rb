require 'test_helper'

class RecipesDeleteTest < ActionDispatch::IntegrationTest

	def setup
		@chef = Chef.create!(chefname: "Brett", email: "brett@example.com", password: "password", password_confirmation: "password")
		@recipe = Recipe.create(name: "vegetable saute", description: "great vegetable saute", chef: @chef)
		@recipe2 = @chef.recipes.build(name: "chicken saute", description: "great chicken dish")
		@recipe2.save
	end

	test "successfully delete a recipe" do
		get recipe_path(@recipe)
		assert_template 'recipes/show'
		assert_select 'a[href=?]', recipe_path(@recipe), text: "Delete recipe"
		assert_difference 'Recipe.count', -1 do
			delete recipe_path(@recipe)
		end
		assert_redirected_to recipes_path
		assert_not flash.empty?
	end

end
