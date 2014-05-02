class DevisePreview < ActionMailer::Preview
  def reset_password_instructions
    record = Usuario.first
    token = "a"
    Devise::Mailer.reset_password_instructions(record,token)
  end
end