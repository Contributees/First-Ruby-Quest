require 'faker'

# delete the content of the database before seeding
Bookmark.destroy_all
User.destroy_all
Issue.destroy_all
Tag.destroy_all
Comment.destroy_all

5.times do
  username = Faker::Internet.username
  User.create!(
    username:,
    gh_url: "https://github.com/#{username}",
    email: Faker::Internet.email,
    password: '123456',
    password_confirmation: '123456'
  )
end

10.times do |i|
  Issue.create!(
    url: "https://github.com/#{Faker::Company.name}",
    title: Faker::Hacker.say_something_smart,
    repo_name: Faker::Lorem.word,
    repo_stars: Faker::Number.number(digits: 4),
    repo_url: "https://github.com/#{Faker::Company.name}",
    description: Faker::Lorem.paragraph,
    user: User.all.sample,
    category: rand(0..1),
    gh_id: i + 1,
    assigned: [true, false].sample
  )
end

10.times do
  Bookmark.create!(
    user: User.all.sample,
    issue: Issue.all.sample
  )
end

tags = %w[Ruby Rails Good\ first\ issue Help\ wanted Bug Beginner]
tags.each do |tag|
  Tag.create!(
    name: tag
  )
end

Issue.all.each do |issue|
  3.times do
    IssueTag.create!(
      issue:,
      tag: Tag.all.sample
    )
  end
end

10.times do
  Comment.create(
    content: Faker::Lorem.paragraph,
    user: User.all.sample,
    issue: Issue.all.sample
  )
end

puts "Seeded database!"
