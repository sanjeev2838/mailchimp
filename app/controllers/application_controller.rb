class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :setup_gbapi

  def setup_gbapi
    @gb = Gibbon::API.new("f6e60f57e590c4f2f6ee04e7a23342d9-us3")
    @list = @gb.lists.list({:filters => {:list_name => "Insurance"}})
  end
end