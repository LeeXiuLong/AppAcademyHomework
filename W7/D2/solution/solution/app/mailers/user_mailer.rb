class UserMailer < ApplicationMailer
    default from: '99catsadmin@gmail.com'

    def welcome_email(user)
        @user = user
        @url = 'http://99cats.com/login'
        mail(to: user.email, subject: 'This is a cats site')
    end

end
