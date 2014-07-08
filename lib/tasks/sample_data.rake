#encoding: utf-8
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(login: "kommar",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
  end
end
