desc 'weekly newsletter email'
task every_hours_newsletter_email: :environment do
  UserMailer.newsletter_mailer.deliver!
end