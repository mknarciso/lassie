def dfs(node)
  Resource.where(title: node["title"], kind: node["kind"], url: node["ka_url"], slug: node["slug"], extended_slug: node["extended_slug"], description: node["description"] ).first_or_create
  puts node["title"]
  if !node["children"].nil?
    node["children"].each do |child|
      dfs(child)
    end
  end
end

