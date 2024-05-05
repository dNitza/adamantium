xml.instruct! "xml-stylesheet", {href: "/assets/full_style.xslt", type: "text/xsl"}

xml.rss do |rss|
  rss.channel do |channel|
    channel.title "Daniel Nitsikopoulos"
    channel.description "The personal blog of Daniel Nitsikopoulos, software engineer from Canberra, ACT"
    channel.link "https://dnitza.com"
    channel.name "dnitza.com"
    channel.lastBuildDate Time.now.rfc2822
    channel.pubDate Time.now.rfc2822
    channel.ttl 1800

    channel.alternate_feed do |item|
      item.link "/feeds/rss"
      item.title "Main feed (this feed)"
      item.description "Containing longer text posts and bookmarks"
    end

    channel.alternate_feed do |item|
      item.link "/feeds/statuses_rss"
      item.title "Statuses / Microblog"
      item.description "Only shorter posts and photo posts, usually also appearing on Mastodon"
    end

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
end
