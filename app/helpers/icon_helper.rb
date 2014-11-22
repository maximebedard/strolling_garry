module IconHelper

  def icon_to(icon, url, text_method = "", html_options = {})
    link_to "<i class='#{icon}'></i> #{text_method}".html_safe, url, html_options
  end

end
