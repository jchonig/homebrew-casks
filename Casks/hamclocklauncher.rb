cask "hamclocklauncher" do
  version "4.26"

  on_arm do
    sha256 "f0b508a6503b91d0729ec90007c6211d5bfae40f787c4b14a93fb1d472e93b46"

    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version.dots_to_underscores}/HamClockLauncher.dmg"
  end
  on_intel do
    sha256 "3259ef7064089b644a1c7e6e9d4ba1bd80e53a78669b7a3e2b49c860e1c58a99"

    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version.dots_to_underscores}/HamClockLauncherIntel.dmg"
  end

  name "HamClock Launcher"
  desc "GUI launcher for the HamClock web application"
  homepage "https://github.com/huberthickman/HamClockLauncher"

  depends_on :macos

  app "HamClockLauncher.app"

  zap trash: [
    "~/Library/Application Support/HamClockLauncher",
    "~/Library/Caches/com.github.huberthickman.HamClockLauncher",
    "~/Library/Preferences/com.github.huberthickman.HamClockLauncher.plist",
  ]
end
