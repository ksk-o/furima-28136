FactoryBot.define do
  factory :item do
    image               {Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/test_image.png'), 'image/png')}
    name                {Faker::Name.initials(number: 4)}
    description         {Faker::Lorem.sentence}
    category_id         {2}
    condition_id        {2}
    postage_id          {2}
    shipping_plase_id   {2}
    ship_date_id        {2}
    price               {10000}
    association :user
  end
end
