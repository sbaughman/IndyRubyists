class RubyistsController < ApplicationController

  def index
    @rubyists = Octokit.search_users("location:Indianapolis language:Ruby", :sort => "created").items
  end

end
