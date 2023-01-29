Test::Factory.define(:post) do |f|
  f.name "post_name"
  f.content "post_content"
  f.slug "post-slug"
  f.published_at Time.now
  f.syndication_sources {}
end
