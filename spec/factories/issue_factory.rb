CODES = ("AAAA".."ZZZZ").to_a.shuffle
FactoryBot.define do
  factory :issue, class: Issue do
    association :user, factory: :user
    title { "rendering ERB Templates with correct spacing" }
    category { "open-source" }
    url { CODES.pop }
    repo_name { "test-repo" }
    gh_url { "/" }
    gh_id { 1234 }
    description { "Veniam rerum nesciunt. Quibusdam quasi non. Est id minima." }
    assigned { false }

    after(:create) do |issue|
      create_list(:tag, 2, issues: [issue])
    end
  end
end
