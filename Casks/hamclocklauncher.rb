cask "hamclocklauncher" do
  version "4.30"

  on_arm do
    sha256 "15f01b89188a3248dccf91b2f8c03bc5c7979e7cba1bb3f9187e5586e5d7496d"

    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version.dots_to_underscores}/HamClockLauncher.dmg"
  end
  on_intel do
    sha256 "198a23a9947a7eab3bd4b7520f6abcf65898298ed123b6947ffa3571e96ceaf7"

    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version.dots_to_underscores}/HamClockLauncherIntel.dmg"
  end

  name "HamClock Launcher"
  desc "GUI launcher for the HamClock web application"
  homepage "https://github.com/huberthickman/HamClockLauncher"

  livecheck do
    url :url
    regex(/^release_(\d+(?:_\d+)+)$/i)
    strategy :github_latest do |json, regex|
      match = json["tag_name"]&.match(regex)
      match&.[](1)&.tr("_", ".")
    end
  end

  depends_on :macos

  app "HamClockLauncher.app"

  zap trash: [
    "~/Library/Application Support/HamClockLauncher",
    "~/Library/Caches/com.github.huberthickman.HamClockLauncher",
    "~/Library/Preferences/com.github.huberthickman.HamClockLauncher.plist",
  ]
end
