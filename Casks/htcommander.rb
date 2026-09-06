cask "htcommander" do
  version "0.1.66"
  sha256 "88247a2211156ea82d1c45abb260e8becd3d98fc9a46bda9aa8beca647ab7096"

  url "https://github.com/Ylianst/HTCommander/releases/download/v#{version}/HTCommander.dmg"
  name "Handi-Talky Commander"
  desc "Control app for UV-Pro, GA-5WB, VR-N76, and VR-N7500 HAM radios"
  homepage "https://github.com/Ylianst/HTCommander"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Handi-Talky Commander.app"

  zap trash: [
    "~/Library/Application Support/com.meshcentral.htcommander",
    "~/Library/Caches/com.meshcentral.htcommander",
    "~/Library/Preferences/com.meshcentral.htcommander.plist",
  ]
end
