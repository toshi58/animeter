FactoryBot.define do
  factory :anime do
    name { 'ワンピース' }
    furigana { 'わんぴーす' }
    summary { '海賊王になる' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
