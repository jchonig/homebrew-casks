cask "hamclocklauncher" do
  version "1.3"

  name "HamClock Launcher"
  desc "macOS GUI launcher for the HamClock web application"
  homepage "https://github.com/huberthickman/HamClockLauncher"

  on_intel do
    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version.dots_to_underscores}/HamClockLauncherIntel.dmg"
    sha256 "c010fbda7e4bf7778b67cf1b80c1584cd55b08027fc4c081ff433149451d709d"
  end

  on_arm do
    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version.dots_to_underscores}/HamClockLauncher.dmg"
    sha256 "a74802ded0a8f52b2be3d8acaead85a4c5ef22e10716a4aa35c3142dd62fed7d"
  end

  app "HamClockLauncher.app"

  zap trash: [
    "~/Library/Application Support/HamClockLauncher",
    "~/Library/Caches/com.github.huberthickman.HamClockLauncher",
    "~/Library/Preferences/com.github.huberthickman.HamClockLauncher.plist",
  ]
end
