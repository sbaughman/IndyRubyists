class RubyistsController < ApplicationController

  def index
    response = Octokit.search_users("location:Indianapolis language:Ruby", :sort => "joined", :per_page => 100).items
    response.concat Octokit.last_response.rels[:next].get.data.items
    response.reverse!
    @rubyists = Kaminari.paginate_array(response).page(params[:page]).per(30)
  end

  def show
    @user = Octokit.user(params[:username])
    @events = @user.rels[:events].get.data
  end

  def user_repos
    @user = Octokit.user(params[:username])
    repos = @user.rels[:repos].get.data
    @repos = repos.sort_by { |repo| repo[:stargazers_count] }
  end

end
