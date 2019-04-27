class KontaktController < ApplicationController
  caches_page :new, gzip: 9

  def new
    @kontakt = Kontakt.new
    render :kontakt
  end

  def create
    @kontakt = Kontakt.new(kontakt_params)
    if @kontakt.valid?
      KontaktMailer.kontakt_mail(@kontakt).deliver_now
      @kontakt.delivered = true
    end
    render :kontakt
  end

  private

  def kontakt_params
    params.require(:kontakt).permit(:name, :email, :subject, :message)
  end

end
