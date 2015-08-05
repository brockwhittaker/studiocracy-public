class PostsController < ApplicationController
	
	def show
		@post = Post.find(params[:id])
        @comments = @post.comment_threads.sort_by {|comment| comment.votecount }.reverse
        if current_user
        	@new_comment = Comment.build_from(@post, current_user.id, "")
        end
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.create(post_params)
		# Split the tags string and create the tags
		tags_array = tags_params[:tags].split(',')
		tags_array.each { |tag|
			@tag = @post.tags.create({:tag_name => tag})
		}
		if @post.save
			redirect_to post_path(@post), :notice => "Post was created successfully."
		else
			render :new
		end
	end

	def destroy
		@post = post.find(params[:id])
		@post.destroy
		#redirect_to posts_path(@posts)
		flash.notice = "post '#{@post.title}' Destroyed!"

	end
	def edit
		@post = post.find(params[:id])
	end
	def update
		@post = post.find(params[:id])
		@post.update(post_params)

		flash.notice = "post '#{@post.title}' Updated!"

		#redirect_to post_path(@post)
	end

	private
	def post_params
		params.require(:post).permit(:title, :content_md, :image, :user_id, :year_created, :medium, :dimension_height, :dimension_width, :measurement, :weight_in_pounds, :price, :quantity)
	end

	def tags_params
		params.permit(:tags)
	end

end
