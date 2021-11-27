class ApplicationController < ActionController::Base
  helper_method :cms_pages
  # by making it a helper method, we can call from anywhere

  def cms_pages
    Page.all
  end
end
