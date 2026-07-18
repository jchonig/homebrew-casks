cask "hamclocklauncher" do
  version "4.27"

  on_arm do
    sha256 "a22d24adc9d6ab1c074971dc81fb03d51db08ee5f3459c6f492f907a278aec11"

    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version.dots_to_underscores}/HamClockLauncher.dmg"
  end
  on_intel do
    sha256 "731c2a5c008bfdbb0450ddf1d92a924476ed3e5dca358005e901658d2eed44cc"

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
