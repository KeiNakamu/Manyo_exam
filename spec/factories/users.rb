FactoryBot.define do
  factory :user do
    name { "nakamura" }
    email { "nakamura01@dic.com" }
    password { "111111" }
    password_confirmation { "111111" }
    admin { true }
  end

  factory :second_user, class: User do
    name { "kei" }
    email { "kei01@dic.com" }
    password { "222222" }
    password_confirmation { "222222" }
    admin { false }
  end
end
