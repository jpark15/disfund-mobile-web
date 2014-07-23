FactoryGirl.define do
  factory :user do
    email { 'test@annkissam.com' }
    password { 'testpass' }

    factory :admin_user do
      admin true
    end
  end
end
