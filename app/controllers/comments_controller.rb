class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    @prototype = Prototype.find(params[:prototype_id])
    # @comment = @prototype.comments.new(comment_params)不要
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
    #   # @comments = @prototype.comments不要
      render "prototypes/show" 
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
