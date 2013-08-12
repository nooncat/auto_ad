#encoding: utf-8
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(login: "kommar",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
    Setting.title_text      = 'Ваше авто'
    Setting.about_text      = 'Fast and quality'
    Setting.phone_text      = '23-32-34'
    Setting.skype_text      = 'skype:vasheavto'
    Setting.vk_text         = 'http://vk.com/avto'
    Setting.copyrights_text = 'vasheavto'
  end
end
