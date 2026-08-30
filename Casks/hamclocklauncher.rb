cask "hamclocklauncher" do
  version "4.31"

  on_arm do
    sha256 "5cb67c4e8bcadb06e7070494db3ac3779fd3561cf70353b25641d0a0fa87f5d4"

    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version.dots_to_underscores}/HamClockLauncher.dmg"
  end
  on_intel do
    sha256 "cba1a12187866b3916a1a39ed5ce740786082c28b17f91569702417c1c97ac37"

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
