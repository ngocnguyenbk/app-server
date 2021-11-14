module ApplicationHelper
  def container_type
    containers = ["admin/articles"]
    containers.include?(params[:controller]) ? "container-fluid" : "container"
  end
end
