class PagesController < ApplicationController
  include HighVoltage::StaticPage
  #caches_page :show, gzip: 9
end
