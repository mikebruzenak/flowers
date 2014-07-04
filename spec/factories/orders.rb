# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    customer_name "MyString"
    email "MyString"
    delivery_method 1
  end
end
