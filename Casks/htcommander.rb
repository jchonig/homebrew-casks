cask "htcommander" do
  version "0.1.89"
  sha256 "8791a294deb362350c4e57f856eb3b671fbef5bfdbb78feac1491ddb5938289f"

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
