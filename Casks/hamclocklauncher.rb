cask "hamclocklauncher" do
  version "1.1"

  name "HamClock Launcher"
  desc "macOS GUI launcher for the HamClock web application"
  homepage "https://github.com/huberthickman/HamClockLauncher"

  on_intel do
    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version.dots_to_underscores}/HamClockLauncher-#{version}-Intel.dmg"
    sha256 "72bb4951d520049ef2a954e7df7a0753c61354cebe4ea39c9debaa1f56307f16"
  end

  on_arm do
    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version.dots_to_underscores}/HamClockLauncher-#{version}-AppleSilicon.dmg"
    sha256 "63e695f7877d16b46a8b92fd0096846b8981c7cb90fc7cd21fff828057ffe140"
  end

  app "HamClockLauncher.app"

  zap trash: [
    "~/Library/Application Support/HamClockLauncher",
    "~/Library/Caches/com.github.huberthickman.HamClockLauncher",
    "~/Library/Preferences/com.github.huberthickman.HamClockLauncher.plist",
  ]
end
