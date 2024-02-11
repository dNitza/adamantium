# xml.instruct! "xml-stylesheet", {href: "/assets/style.xslt", type: "text/xsl"}
xml.opml("xmlns:frss" => "https://freshrss.org/opml", version: "2.0") do
  xml.head do |head|
    head.title "Daniel Nitsikopoulos's RSS subscriptions"
    head.link "https://dnitza.com/blogroll/opml"
    head.lastBuildDate Time.now.rfc2822
    head.pubDate Time.now.rfc2822
    head.ttl 1800
  end

  xml.body do
    blogroll.each do |blog|
      xml.outline(text: blog[:title], type: "rss", xmlUrl: blog[:url], htmlUrl: blog[:html_url])
    end
  end
end
