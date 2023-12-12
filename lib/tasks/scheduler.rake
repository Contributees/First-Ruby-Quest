desc "Fetch issues from Github and create them in the database"
task create_issue: :environment do
  CreateIssuesJob.perform_async
end

desc "Fetch existing issues from Github and update them in the database"
task update_issue: :environment do
  UpdateIssuesJob.perform_async
end
