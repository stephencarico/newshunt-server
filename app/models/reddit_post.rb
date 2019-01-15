require 'unirest'

class RedditPost < ApplicationRecord

  def self.get_posts
    response = Unirest.get('https://www.reddit.com/hot.json')
    posts = response.body['data']['children'][0..19]
    friendly_posts = posts.map do |post|
      normalize(post['data'])
    end
  end

  def self.normalize(post)
    {
      id: post['id'],
      title: post['title'],
      url: post['url'],
      comments_url: "https://www.reddit.com" + post['permalink'],
      points: post['score'],
      comments: post['num_comments'],
      author: post['author'],
      source: 'Reddit'
    }
  end
  
end
