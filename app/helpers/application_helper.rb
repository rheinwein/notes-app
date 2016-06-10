module ApplicationHelper
  def flash_class(type)
    base = %w(alert)

    case type
    when 'notice'
      base << 'alert-info'
    when 'success'
      base << 'alert-success'
    when 'alert'
      base << 'alert-danger'
    end

    return base.join(" ")
  end

  def current_action
    "#{params[:controller]}##{params[:action]}"
  end

  def window_title
    case current_action
    when 'issues#index'
      'Overview'

    when 'issues#show'
      truncate(@issue.text, length: 60)

    when 'admin/users#new'
      'Create a new user'

    when 'admin/users#edit'
      "Edit user #{@user.id}"

    when 'admin/dashboard#show'
      'Dashboard'
    end
  end
end
