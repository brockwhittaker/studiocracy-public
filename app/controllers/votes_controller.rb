class VotesController < ApplicationController
	before_action :authenticate_user!

	def like
		@post = Post.find(params[:id])
		@post.liked_by current_user
		redirect_to :back
	end

	def unlike
		@post = Post.find(params[:id])
		@post.unliked_by current_user
		redirect_to :back
	end

	def dislike
		@post = Post.find(params[:id])
		@post.disliked_by current_user
		redirect_to :back
	end

	def undislike
		@post = Post.find(params[:id])
		@post.undisliked_by current_user
		redirect_to :back
	end
end