class Api::PostsController < ApplicationController

  def all
    @all_posts = []
    hackernews = HackerNewsPost.get_posts
    reddit = RedditPost.get_posts
    producthunt = ProductHuntPost.get_posts
    github_trending = GithubTrendingPost.get_posts
    i = 0
    10.times do
      @all_posts << hackernews[i]
      @all_posts << reddit[i]
      @all_posts << producthunt[i]
      @all_posts << github_trending[i]
      i+=1
    end
    render 'all.json.jbuilder'
  end

end
