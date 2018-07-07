class KontaktMailer < ApplicationMailer

  def kontakt_mail(kontakt)
    mail  to:       %("CrossFitBewegt" <info@crossfitbewegt.com>),
          from:     %("#{kontakt.name}" <kontakt@crossfitbewegt.com>),
          reply_to: %("#{kontakt.name}" <#{kontakt.email}>),
          subject:  kontakt.subject,
          body:     kontakt.message
  end

end
