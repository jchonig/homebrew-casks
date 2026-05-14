cask "hamclocklauncher" do
  version "1.4"

  name "HamClock Launcher"
  desc "macOS GUI launcher for the HamClock web application"
  homepage "https://github.com/huberthickman/HamClockLauncher"

  on_intel do
    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version.dots_to_underscores}/HamClockLauncherIntel.dmg"
    sha256 "0eae265bea9971ef536402774aea155e8e7dbfa81f7630b9e12c3745815914be"
  end

  on_arm do
    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version.dots_to_underscores}/HamClockLauncher.dmg"
    sha256 "20126f764c9ed6d627c62a17453a3717173b6256f6469fc77d31ad622fb5770f"
  end

  app "HamClockLauncher.app"

  zap trash: [
    "~/Library/Application Support/HamClockLauncher",
    "~/Library/Caches/com.github.huberthickman.HamClockLauncher",
    "~/Library/Preferences/com.github.huberthickman.HamClockLauncher.plist",
  ]
end
