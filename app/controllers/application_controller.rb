class ApplicationController < ActionController::Base
  #http_basic_authenticate_with name: "cfb-physio", password: "awesome"
  before_action :define_type

  def define_type
    @type = request.fullpath.start_with?("/physio") ? "physio" : request.fullpath.start_with?("/funktionelles-training") ? "athletik" : "home"
    @logo = request.fullpath.start_with?("/funktionelles-training") ? "logo-mensch.svg" : "logo-box.svg"
  end
end
