require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest

	 def setup
  	@chef = Chef.create!(chefname: "Brett", email: "brett@example.com")
		@recipe = Recipe.create(name: "vegetable saute", description: "great vegetable saute", chef: @chef)
		@recipe2 = @chef.recipes.build(name: "chicken saute", description: "great chicken dish")
		@recipe2.save
  end

  test "reject an invalid signup" do
  	get edit_chef(@chef)
  	assert_template 'chefs/edit'
  	patch chef_path(@chef), params: { chef: { chefname: "", email: "" } }
  	assert_template 'chefs/edit'
  	assert_select 'h2.panel-title'
  	assert_select 'div.panel-body'
  end

  test "accept valid signup" do
  	get edit_chef_path
  	assert_template 'chefs/edit'
  	patch chefs_path, params: { chef: { chefname: "brett1", email: "brett1@example.com" } }
  	assert_redirected_to @chef
  	assert_not flash.empty?
  	@chef.reload
  	assert_match "brett1", @chef.chefname
  	assert_match "brett1@example.com", @chef.email
  end

end
