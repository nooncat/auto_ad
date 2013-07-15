FactoryGirl.define do
  factory :user do
    sequence(:login)  { |n| "Person #{n}" }
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :car do
    name   "Volga"
    year_of_release "2000"
    price "100000"
    describtion "Cool car"
  end
end
