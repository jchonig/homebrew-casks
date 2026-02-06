cask "thaw" do
  version "1.0.0"
  sha256 "55c3b1c9acc70300899a36a0c778376f3ae81ddf777ea03aac2c091a0fbe6d59"

  url "https://github.com/stonerl/Thaw/releases/download/#{version}/Thaw_#{version}.zip"
  name "Thaw"
  desc "Menu bar manager for macOS"
  homepage "https://github.com/stonerl/Thaw"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  conflicts_with cask: [
    "jordanbaird-ice",
    "jordanbaird-ice@beta",
  ]

  app "Thaw.app"

  zap trash: [
    "~/Library/Application Scripts/com.stonerl.Thaw",
    "~/Library/Application Support/com.stonerl.Thaw",
    "~/Library/Caches/com.stonerl.Thaw",
    "~/Library/Containers/com.stonerl.Thaw",
    "~/Library/HTTPStorages/com.stonerl.Thaw",
    "~/Library/Preferences/com.stonerl.Thaw.plist",
    "~/Library/Saved Application State/com.stonerl.Thaw.savedState",
  ]
end
