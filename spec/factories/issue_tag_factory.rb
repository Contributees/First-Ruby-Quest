FactoryBot.define do
  factory :issue_tag, class: IssueTag do
    association :issue, factory: :issue
    association :tag, factory: :tag
  end
end
