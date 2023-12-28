RANDOM_STRING = ("AAAA".."ZZZZ").to_a.shuffle
FactoryBot.define do
  factory :user, class: User do
    username { RANDOM_STRING.pop }
    gh_url { "https://www.github.com/#{RANDOM_STRING.pop}" }
    password { "123456" }
    email { "#{RANDOM_STRING.pop}@gmail.com" }
  end
end
