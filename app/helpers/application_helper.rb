module ApplicationHelper
  def title_display(title)
    base="Rate Everything"
    if title==""
      return base
    else
      return "#{title} | #{base}"
    end
  end
end
