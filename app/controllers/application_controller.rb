class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :setup_gbapi

  def after_sign_in_path_for(resource)
    dashboard_index_path
  end


  def setup_gbapi
    @gb = Gibbon::API.new(ENV["MAILCHIMP_APIKEY"])
    @list = @gb.lists.list({:filters => {:list_name => ENV["MAILCHIMP_LIST_NAME"]}})
  end
end