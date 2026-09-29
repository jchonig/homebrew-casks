cask "htcommander" do
  version "0.1.81"
  sha256 "1bde7a71e2045101300ce6fa3f3e1d75da8d7496657937dd76da9ac8092b849b"

  url "https://github.com/Ylianst/HTCommander/releases/download/v#{version}/HTCommander.dmg"
  name "Handi-Talky Commander"
  desc "Control app for UV-Pro, GA-5WB, VR-N76, and VR-N7500 HAM radios"
  homepage "https://github.com/Ylianst/HTCommander"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on :macos

  app "Handi-Talky Commander.app"

  zap trash: [
    "~/Library/Application Support/com.meshcentral.htcommander",
    "~/Library/Caches/com.meshcentral.htcommander",
    "~/Library/Preferences/com.meshcentral.htcommander.plist",
  ]
end
