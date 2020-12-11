FactoryBot.define do
  factory :order_form do
    postal_code    {"111-1111"}
    prefecture_id  {2}
    city           {"区市町村"}
    block          {"番地1-1-1"}
    building       {"建物"}
    phone_number   {"09011223344"}
  end
end 