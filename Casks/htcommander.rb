cask "htcommander" do
  version "0.1.1"
  sha256 "6a4695c01cb5f26a234f268375d8cbba59f1dbdd061699bc5eb013543a7d2276"

  url "https://github.com/Ylianst/HTCommander/releases/download/v#{version}/HTCommander.dmg"
  name "Handi-Talky Commander"
  desc "Remote management software for MeshCentral managed devices"
  homepage "https://github.com/Ylianst/HTCommander"

  depends_on :macos

  app "Handi-Talky Commander.app"

  zap trash: [
    "~/Library/Application Support/com.example.htcommander",
    "~/Library/Caches/com.example.htcommander",
    "~/Library/Preferences/com.example.htcommander.plist",
  ]
end
