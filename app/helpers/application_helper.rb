module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Studiocracy"
    end
  end

  def active_page(active_page)
    @active == active_page ? "active" : ""
  end
end
