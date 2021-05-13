class CommentsController < ApplicationController
  before_action :authenticate_user!,only:[:new,:edit,:destroy]


  def create
    @prototype=Prototype.find(params[:prototype_id])
    @comments=@prototype.comments.includes(:user)
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(params[:prototype_id])
    else
      render "prototypes/show" 
    end
  end










  private

  def comment_params
  params.require(:comment).permit(:text).merge(user_id: current_user.id,prototype_id:params[:prototype_id])
  
  end


end
