module RubyistsHelper

  def user(rubyist)
    Octokit.user(rubyist.login)
  end

end
