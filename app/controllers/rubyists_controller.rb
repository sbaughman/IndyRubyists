class RubyistsController < ApplicationController


  private

  def client
    @client ||= Octokit::Client.new(:access_token => ENV['github_access_token'])
  end

end
