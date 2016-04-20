Octokit.configure do |c|
  c.login = ENV['github_username']
  c.password = ENV['github_password']
end
