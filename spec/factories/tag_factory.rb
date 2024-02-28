RANDOM_STRING = ("AAAA".."ZZZZ").to_a.shuffle
FactoryBot.define do
  factory :tag, class: Tag do
    name { RANDOM_STRING.pop }
  end
end
