cask "htcommander" do
  version "0.1.55"
  sha256 "9b1065e084d19fbd417977a1b592745f45937dddb1f2225f6c13ee78478fce32"

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
