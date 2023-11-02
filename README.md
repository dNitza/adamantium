# Adamantium

Adamantium is my personal blog built with Hanami 2.

It's based on the [Micropub](https://micropub.net/) spec for publishing posts of varying types.

## Status

This project is under active development and is light on tests. It was also started when Hanami 2 was still in beta, so contains some code that may not be needed in the current version of Hanami 2 (particularly the persistence and asset management code). I do plan on bringing that in line with what is in the release version of Hanami 2, though.

## Running locally

### Requirements
- Ruby
- Postgres

### Steps
1. Provide a `.env` file that fills in all of the required settings in `config/settings.rb`
2. Run `script/setup`
3. Run `script/server`
4. Visit `http://localhost:2300`

## License

The source code is available under the MIT licence. But you may not copy the design or content of this site.
