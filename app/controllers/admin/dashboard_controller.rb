class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["LOGINNAME"], password: ENV["PASSWRD"] 

  def show
  end
end
