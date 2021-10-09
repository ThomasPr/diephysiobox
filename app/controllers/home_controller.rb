class HomeController < ApplicationController
  caches_page :sitemap, gzip: 9

  def sitemap
    @urls = (HighVoltage.page_ids - ["home", "datenschutz", "impressum"]).map{ |p| page_url(p) }
    @urls << root_url
  end

end
