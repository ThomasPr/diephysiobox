class ApplicationController < ActionController::Base
  #http_basic_authenticate_with name: "cfb-physio", password: "awesome"
  before_action :define_type

  def define_type
    @type = request.fullpath.start_with?("/physio") ? "physio" : request.fullpath.start_with?("/athletik") ? "athletik" : "home"
    @logo = request.fullpath.start_with?("/athletik") ? "athletik" : "physio"
  end
end
