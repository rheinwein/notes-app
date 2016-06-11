class CommentsController < ApplicationController
  before_action :authenticate!

  def create
    c = Comment.new(comment_params)
    c.user = current_user
    c.issue_id = params[:issue_id]

    if c.text == ''
      redirect_to issue_path(c.issue), alert: "Error: Comment can't be empty.."
      return
    end

    if c.save
      flash[:new_comment_id] = c.id
      redirect_to issue_path(c.issue, anchor: c.anchor)
    else
      redirect_to issue_path(c.issue), anchor: c.anchor, alert: "Error: #{c.errors.full_messages.join(', ')}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
