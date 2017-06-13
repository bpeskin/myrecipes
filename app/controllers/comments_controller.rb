class CommentsController < ApplicationController
	before_action :require_user
	
	def create
		@recipe = Recipe.find(params[:recipe_id])
		@comment = @recipe.comments.build(comment_params)
		@comment.chef = current_chef
		if @comment.save
			ActionCable.server.broadcast "comments", render(partial: 'comments/comment', object: @comment)
			# flash[:success] = "Comment was created successfully"
			# redirect_to recipe_path(@recipe)
		else
			flash[:danger] = "There was a problem creating the comment"
			redirect_to :back
		end
	end

  def destroy
    @recipe = Recipe.find_by(params[:recipe_id])
    @comment = @recipe.comments.find_by(params[:id])
    @comment.destroy
    redirect_to recipe_path(@recipe)
    flash[:success] = "Your comment was successfully deleted"
  end

	private

		def comment_params
			params.require(:comment).permit(:description)
		end
		
end