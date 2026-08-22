cask "htcommander" do
  version "0.1.20"
  sha256 "3dc6eb037aceac27a0daa23c660d2789d03d7a1eda37946550cba60ba65f08cc"

  url "https://github.com/Ylianst/HTCommander/releases/download/v#{version}/HTCommander.dmg"
  name "Handi-Talky Commander"
  desc "Remote management software for MeshCentral managed devices"
  homepage "https://github.com/Ylianst/HTCommander"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Handi-Talky Commander.app"

  zap trash: [
    "~/Library/Application Support/com.example.htcommander",
    "~/Library/Caches/com.example.htcommander",
    "~/Library/Preferences/com.example.htcommander.plist",
  ]
end
