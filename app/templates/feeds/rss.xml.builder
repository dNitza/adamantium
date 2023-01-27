xml.instruct!(:xml, version: "2.0", encoding: "utf-8")

xml.channel do |channel|
  channel.title "Daniel Nitsikopoulos"
  channel.description "The RSS feed for https://dnitza.com"
  channel.lastBuildDate Time.now.rfc2822
  channel.pubDate Time.now.rfc2822
  channel.ttl 1800

  posts.each do |post|
    channel.item do |item|
      item.title post.display_title
      item.description do |desc|
        desc.cdata! post.content
      end
      item.guid(post.slug, isPermaLink: true)
      item.pubDate post.machine_published_at
    end
  end
end
