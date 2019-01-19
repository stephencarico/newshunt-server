require 'unirest'

class RedditPost < ApplicationRecord

  def self.get_posts
    response = Unirest.get('https://www.reddit.com/hot.json')
    posts = response.body['data']['children'][0..19]
    friendly_posts = posts.map do |post|
      normalize(post['data'])
    end
  end

  def self.check_api
    response = Unirest.get('https://www.reddit.com/hot.json')
    posts = response.body['data']['children'][0..3]
    JSON.pretty_generate(posts)
  end

  def self.normalize(post)
    {
      id: post['id'],
      title: post['title'],
      url: post['url'],
      comments_url: "https://www.reddit.com" + post['permalink'],
      points: post['score'],
      comments: post['num_comments'],
      image: post['url'] ? post['url'] : nil,
      author: post['author'],
      source: 'Reddit'
    }
  end
  
end
