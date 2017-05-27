module ApplicationHelper

  def navigation_bar
    if request.fullpath.include?('admin')
      return 'layouts/admin_navigation'
    else
      return 'layouts/user_navigation'
    end
  end
end
