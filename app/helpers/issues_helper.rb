module IssuesHelper
  def issue_status_class(issue)
    base = 'issue--'

    status = issue.completed_at ? 'completed' : 'open'

    base + status
  end
end
