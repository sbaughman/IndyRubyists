class RubyistsController < ApplicationController

  def index
    response = Octokit.search_users("location:Indianapolis language:Ruby", :sort => "joined", :per_page => 100).items
    response.concat Octokit.last_response.rels[:next].get.data.items
    response.reverse!
    @rubyists = Kaminari.paginate_array(response).page(params[:page]).per(30)
  end

  def show
    @user = Octokit.user(params[:username])
    event_data = @user.rels[:events].get.data
    @events = Kaminari.paginate_array(event_data).page(params[:page]).per(20)
  end

  def user_repos
    @user = Octokit.user(params[:username])
    repo_data = @user.rels[:repos].get.data
    all_repos = repo_data.sort_by { |repo| repo[:stargazers_count] }.reverse
    @repos = Kaminari.paginate_array(all_repos).page(params[:page]).per(20)
  end

end
