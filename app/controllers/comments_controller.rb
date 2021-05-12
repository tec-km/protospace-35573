class CommentsController < ApplicationController
  before_action :authenticate_user!,only:[:new,:edit,:destroy]


  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototypes_index_path
    else
      render "prototypes/show" 
    end
  end










  private

  def comment_params
  params.require(:comment).permit(:text).merge(user_id: current_user.id,prototype_id:params[:prototype_id])
  
  end


end
