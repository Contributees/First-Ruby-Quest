namespace :issue do
  desc "Fetch issues from Github and create them in the database"
  task create: :environment do
    CreateIssuesJob.perform_async
  end

  desc "Fetch existing issues from Github and update them in the database"
  task update: :environment do
    UpdateIssuesJob.perform_async
  end
end
