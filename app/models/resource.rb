class Resource < ActiveRecord::Base
    def seed()
      #require 'net/http'
      require 'rest-client'
      url = 'http://www.khanacademy.org/api/v1/topictree'
      req = RestClient.get url, {accept: :json}
      d = JSON.parse(req.body);
      d["children"].each do |field|
        dfs(field)
      end
    end
  def dfs(node)
    Resource.where(title: node["title"], kind: node["kind"], url: node["ka_url"], slug: node["slug"], extended_slug: node["extended_slug"], description: node["description"] ).first_or_create
    puts node["title"]
    if !node["children"].nil?
      node["children"].each do |child|
        dfs(child)
      end
    end
  end
end

def split()
  words = Array.new
  allslugs = Resource.uniq.pluck(:extended_slug)
  allslugs.each do |s|
    words << s.split('/')
  end
  puts words.uniq
end