class KontaktController < ApplicationController

  def create
    @kontakt = Kontakt.new(kontakt_params)
    if @kontakt.valid?
      KontaktMailer.kontakt_mail(@kontakt).deliver_now
      head :ok
    else
      head :bad_request
    end
  end

  private

  def kontakt_params
    params.require(:kontakt).permit(:name, :email, :subject, :message)
  end

end
