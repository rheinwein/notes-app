class IssuesController < ApplicationController
  before_action :authenticate!

  add_flash_types :new_issue_id

  def index
    @issue_filter_tabs = [
      ['All', nil, Issue.count],
      ['Open', 'open', Issue.incomplete.count],
      ['Closed', 'closed', Issue.completed.count]
    ]

    case params[:filter]
    when nil
      @issues = [Issue.incomplete, Issue.completed].flatten
    when 'open'
      @issues = Issue.incomplete
    when 'closed'
      @issues = Issue.completed
    else
      @issues = []
    end
  end

  def create
    i = Issue.new(issue_params)
    i.user = current_user

    if i.save
      flash[:new_issue_id] = i.id
      redirect_to issues_path
    else
      redirect_to issues_path, alert: "Error: #{i.errors.full_messages.join(', ')}"
    end
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def complete
    i = Issue.find(params[:issue_id])
    i.completed_at = params[:issue][:completed_at]
    i.completed_by = current_user.id
    i.save!

    # create a comment logging the completion of this issue
    Comment.create!(user: current_user, issue: i, type: :completed, text: params[:complete_comment] || '')

    redirect_to params[:issue][:return_to]
  end

  private

  def issue_params
    params.require(:issue).permit(:text, :location_id)
  end
end
