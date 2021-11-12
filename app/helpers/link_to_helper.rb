module LinkToHelper
  def active_link_to(object, path, options = {})
    options[:class] ||= ""
    options[:class] += " nav-link fw-bold"
    if current_page?(path)
      options[:style] = "color: #{object.hex_code}; border-bottom: 2px solid #{object.hex_code};"
    else
      options[:onMouseOver] = "this.style.color='#{object.hex_code}'"
      options[:onMouseOut] = "this.style.color=''"
    end
    link_to object.name, path, options
  end

  def normal_link_to(object, path, options = {})
    options[:class] ||= ""
    options[:class] += " nav-link"
    link_to object.name, path, options
  end
end
