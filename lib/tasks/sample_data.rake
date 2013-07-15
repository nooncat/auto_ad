namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(login: "kommar",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
    9.times do |n|
      login  = Faker::Name.name
      password = "password"
      User.create!(login: login,
                  password: password,
                  password_confirmation: password)
    end
  end
end
