cask "htcommander" do
  version "0.1.47"
  sha256 "29b9922edd4c34e145d249ead76369d8b78a5fce99e94d895612e48faa85d914"

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
