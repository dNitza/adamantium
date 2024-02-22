module Adamantium
  class GentlyRemindMe
    def call(limit:)
      repo = Adamantium::Container["repos.post_repo"]
      app_settings = Adamantium::Container["settings"]

      bookmarks = repo.for_reminders(limit: limit)
      bookmarks_struct = bookmarks.map do |bookmark|
        {
          name: bookmark.name,
          source_url: bookmark.url,
          url: "#{app_settings.micropub_site_url}/bookmark/#{bookmark.slug}"
        }
      end

      body_content = ""
      bookmarks_struct.each do |bm|
        body_content += "🔗 #{bm[:name]} — #{bm[:source_url]} \n"
        body_content += "    #{bm[:url]}\n"
        body_content += "\n"
      end

      Mail.defaults do
        delivery_method :smtp, {
          address: app_settings.smtp_server,
          port: 587,
          authentication: "plain",
          openssl_verify_mode: "peer",
          enable_starttls_auto: true
        }
      end

      Mail.delivery_method.settings[:user_name] = app_settings.smtp_username
      Mail.delivery_method.settings[:password] = app_settings.smtp_password

      mail = Mail.new do
        subject "A gentle reminder of some things to read 🌿"
        body body_content
      end

      mail[:to] = app_settings.from_email
      mail[:from] = app_settings.from_email

      mail.deliver
    end
  end
end