class CommentsController < ApplicationController
    before_action :find_post
    
    def create  
      @comment = @post.comments.build(comment_params)
      @comment.user_id = current_user.id
    
      if @comment.save
        flash[:success] = "Comment created!"
        redirect_to post_path(@post)
      else
        flash[:alert] = "Error! Check the comment form."
        render root_path
      end
    end
    
    def edit
      if @comment.user != current_user
      sign_out current_user
      redirect_to root_path
      end
    end
    
    def update
      if @comment.user == current_user
      	if @comment.update(comment_params)
      		flash[:notice] = "comment updated successfully."
      		redirect_to @comment.post
      	else
      		flash[:alert] = "Unable to update comment."
      		render :edit
      	end
      else
      	sign_out current_user
      	redirect_to root_path
      end
    end
    

    def destroy  
      @comment = @post.comments.find(params[:id])
    
      @comment.destroy
      flash[:success] = "Comment deleted :("
      redirect_to root_path
    end    
    
    private
      
      def comment_params  
        params.require(:comment).permit(:content)
      end
      
      def find_post  
        @post = Post.find(params[:post_id])
      end   

end