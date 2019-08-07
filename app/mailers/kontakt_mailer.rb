class KontaktMailer < ApplicationMailer

  def kontakt_mail(kontakt)
    mail  to:       %("Die PhysioBox" <mail@diephysiobox.de>),
          from:     %("#{kontakt.name}" <kontakt@diephysiobox.de>),
          reply_to: %("#{kontakt.name}" <#{kontakt.email}>),
          subject:  kontakt.subject,
          body:     kontakt.message
  end

end
