module ApplicationHelper

  def logo
  #<!--<%= logo = image_tag("logo.png", :alt => "Sample App", :class => "") %>-->
  #  <%= link_to "Logo", root_path, :class => "gradient-text no-decoration"  %>
    @logo = "Logo"
  end

  # Return a title on a per-page basis
  def title
    base_title = "Ruby on Rails Tutorial Sample App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
