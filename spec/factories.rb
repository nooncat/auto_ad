FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
end
