# Adamantium

Adamantium is my personal blog built with Hanami 2.

It's based on the [Micropub](https://micropub.net/) spec for publishing posts of varying types.

## Architecture

Adamantium takes advantage of Hanami slices to split out the various concerns that go in to managing a blog.

### The `micropub` slice

This is where the micropub spec is implemented, and is the main interface for managing the posts you see on the blog.

There are 3 endpoints:
- `/micropub` — responsible for describing the various micropub attributes supported by the site and for handling all of the CRUD requests that the micropub spec defines.
- `/micropub/media` — this is where media files are sent to be uploaded.
- `/micropub/webmentions` — handles webmention request.

### The `main` slice

This slice is a read-only slice<sup>*</sup> and serves to read and present the data created by interacting with the micropub slice.

The main reason for this being in its own slice is that I imagined wanting to write multiple frontends to the post data one day.
Today, the primary interface is a blog on the web, but I may want a CLI one day and being able to expose a new interface without needing to effect the old one was very appealing to me!
The other reason is that if someone wants to use this code for their own blog, they can throw away the `main` slice and build their own on top of their own blog data.

<sup>*</sup> With the exception of saving the top track of the week on weekly posts. But that really should be moved in to the micropub slice and happen on post creation, rather than the first time a post is viewed.

### The `admin` slice

This slice was largely added to have a GUI for managing some of the bits that a micropub-only interface makes tricky.
The `admin` slice lets me:
- Manage tags (delete them, merge them)
- List and manage posts (edit content, edit tags and syndicate to other sources)
- View the media uploaded via the `/media` endpoint
- Copy links to media uploaded via the `/media` endpoint
- Manage auto-tagging of posts. When a post mentions a word, or has a word in its title, attach a given tag to it
- Manage webmentions on the site
- Manage the `/trips` section on the site. This isn't manageable by micropub just yet as it involves collating a list of existing photos, posts and checkins under the umbrella of a trip

One thing I would like to do is re-work some of the admin area to send requests to the micropub slice, instead of owning the logic of how posts can be managed.

## Features

- A boring old blog — write posts, tag posts, syndicate posts to social media
- Apple Music integration to list the last ~12 [recently played](https://dnitza.com/now) albums or playlists
- [Podcast](https://dnitza.com/podcasts) scrobbling
- [Movie](https://dnitza.com/movies) tracking from Letterboxd
- Bookmark integration with Raindrop, as well as a weekly reminder of unread bookmarks
- An RSS feed
- Integration with Swarm via [OwnYourSwarm](http://ownyourswarm.p3k.io/)

## Status

This project is under active development and is light on tests. 
It was also started when Hanami 2 was still in beta, so contains some code that may not be needed in the current version of Hanami 2 (particularly the persistence and asset management code). 
I do plan on bringing that in line with what is in the release version of Hanami 2, though.

## Running locally 

### Steps
1. Provide a `.env` file that fills in all of the required settings in `config/settings.rb`
2. Run `script/setup`
3. Run `script/server`
4. Visit `http://localhost:2300`

## License

The source code is available under the MIT licence. But you may not copy the design or content of this site.
