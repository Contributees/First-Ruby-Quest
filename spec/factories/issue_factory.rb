CODES = ("AAAA".."ZZZZ").to_a.shuffle
FactoryBot.define do
  factory :issue, class: Issue do
    title { "rendering ERB Templates with correct spacing" }
    category { "open-source" }
    url { CODES.pop }
    repo_name { "test-repo" }
    gh_url { "/" }
    gh_id { 1234 }
  end
end
