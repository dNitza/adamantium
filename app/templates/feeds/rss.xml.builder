xml.instruct! "xml-stylesheet", {:href=>"/assets/style.xslt", :type=>"text/xsl"}

xml.channel do |channel|
  channel.title "Daniel Nitsikopoulos"
  channel.description "The personal blog of Daniel Nitsikopoulos, software engineer from Canberra, ACT"
  channel.link "https://dnitza.com"
  channel.name "dnitza.com"
  channel.lastBuildDate Time.now.rfc2822
  channel.pubDate Time.now.rfc2822
  channel.ttl 1800

  posts.each do |post|
    channel.item do |item|
      item.title post.display_title
      item.description do |desc|
        desc.cdata! post.feed_content
      end
      item.link(post.permalink)
      item.guid(post.slug, isPermaLink: true)
      item.pubDate post.machine_published_at
    end
  end
end
