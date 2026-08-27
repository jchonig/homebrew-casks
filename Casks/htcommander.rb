cask "htcommander" do
  version "0.1.50"
  sha256 "506275fa460eb7f057253b48d0f3a0ef6d4df22af56e75f18fd7a10cf91f5c80"

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
