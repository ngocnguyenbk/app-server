module ActiveHelper
  def active_link_to(text, path, options = {})
    options[:class] ||= ""
    options[:class] += " nav-link"
    options[:class] += " active" if current_page?(path)
    link_to text, path, options
  end
end
