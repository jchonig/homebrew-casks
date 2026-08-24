cask "htcommander" do
  version "0.1.49"
  sha256 "2ace29dc7fcbeee26cede2bb80cfac18189031d47edca666a7260ef31e379b91"

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
