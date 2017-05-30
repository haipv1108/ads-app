module ApplicationHelper

  def admin_navigation?
    return true if request.fullpath.include?('admin')
  end
end
