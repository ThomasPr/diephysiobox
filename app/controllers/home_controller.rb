class HomeController < ApplicationController

  def sitemap
    @urls = HighVoltage.page_ids.map{ |p| page_url(p) }
    @urls << root_url
    @urls << kontakt_url
  end

end