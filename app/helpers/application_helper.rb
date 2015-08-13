module ApplicationHelper
  def title_display(title)
    base="QuickThoughts"
    if title==""
      return base
    else
      return "#{title} | #{base}"
    end
  end
end
