cask "htcommander" do
  version "0.1.48"
  sha256 "0b25c03605eb86429b7791bf29a7b337a3fa4fc7a26e15a2a827d16db3e7183c"

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
