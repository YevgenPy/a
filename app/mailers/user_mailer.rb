class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.newsletter_mailer.subject
  #
  def newsletter_mailer
    Post.includes(:comments, :user).where(comments: { created_at: 1.hour.ago..Time.current}).
    find_each do |post|
    post.comments.ids.to_s
    mail(to: post.user.email, subject: "Author") if post.mail_if_comment
    end
  end
end
