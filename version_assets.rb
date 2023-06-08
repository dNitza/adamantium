# get index.css, index.js
# generate hash
# rename files
# write asset manifest

require "securerandom"
require "json"
require "fileutils"

folder_path = File.join(__dir__, "/public/assets")
dist_path = File.join(__dir__, "/public/assets/dist")
hash = SecureRandom.urlsafe_base64(9)
filenames = {}

FileUtils.rm_rf("#{dist_path}/.", secure: true)

Dir.glob(folder_path + "/*.{js,css}").each do |f|
  FileUtils.cp(f, dist_path)
end

Dir.glob(dist_path + "/*.{js,css}").each_with_object(filenames) do |f, memo|
  filename = File.basename(f, File.extname(f))
  memo[filename + File.extname(f)] = filename + "-" + hash + File.extname(f)
  File.rename(f, dist_path + "/" + filename + "-" + hash + File.extname(f))
end

File.binwrite(folder_path + "/asset-manifest.json", JSON.generate(filenames))
