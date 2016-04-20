class RubyistsController < ApplicationController

  def index
    response = Octokit.search_users("location:Indianapolis language:Ruby", :sort => "joined", :per_page => 100).items
    response.concat Octokit.last_response.rels[:next].get.data.items
    @rubyists = Kaminari.paginate_array(response).page(params[:page]).per(30)
  end

end
