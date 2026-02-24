cask "hamclocklauncher" do
  version "1.2"

  name "HamClock Launcher"
  desc "macOS GUI launcher for the HamClock web application"
  homepage "https://github.com/huberthickman/HamClockLauncher"

  on_intel do
    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version.dots_to_underscores}/HamClockLauncherIntel.dmg"
    sha256 "c3be55bbd938dad853fb55789ea525006fd394cbefc0c887d98bf805d29e8124"
  end

  on_arm do
    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version.dots_to_underscores}/HamClockLauncher.dmg"
    sha256 "fb592e11dc3b314436d43c58705594516d47257c4af04175915559280429c45c"
  end

  app "HamClockLauncher.app"

  zap trash: [
    "~/Library/Application Support/HamClockLauncher",
    "~/Library/Caches/com.github.huberthickman.HamClockLauncher",
    "~/Library/Preferences/com.github.huberthickman.HamClockLauncher.plist",
  ]
end
