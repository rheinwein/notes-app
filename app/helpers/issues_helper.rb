module IssuesHelper
  def issue_status_class(issue)
    base = 'issue--'
    status = 'open'

    if issue.completed_at
      status = 'completed'
    end

    return base + status
  end
end
