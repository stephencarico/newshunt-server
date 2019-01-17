require 'unirest'

class GithubTrendingPost < ApplicationRecord

  def self.get_posts
    response = Unirest.get("https://github-trending-api.now.sh/repositories?since=weekly")
    posts = response.body[0..19]
    posts.map!{|post| normalize(post)}
  end

  def self.check_api
    response = Unirest.get("https://github-trending-api.now.sh/repositories?since=weekly")
    posts = response.body[0..3]
    JSON.pretty_generate(posts)
  end

  def self.normalize(post)
    {
      id: "",
      title: post['name'],
      url: post['url'],
      comments_url: post['url']+"/issues",
      points: post['currentPeriodStars'],
      comments: "",
      author: post['author'],
      source: "Github Trending"
    } 
  end

end
