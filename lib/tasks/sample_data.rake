namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "kommar",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
    9.times do |n|
      name  = Faker::Name.name
      password = "password"
      User.create!(name: name,
                  password: password,
                  password_confirmation: password)
    end
  end
end
