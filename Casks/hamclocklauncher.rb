cask "hamclocklauncher" do
  version "4.28"

  on_arm do
    sha256 "ae78744f562b026c205b8557b632c9b652b936fc03cf330dc31883282d4b085c"

    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version.dots_to_underscores}/HamClockLauncher.dmg"
  end
  on_intel do
    sha256 "0f1f7395b5018fe8551ffce30c8852c97ec91002843d4a181245edf85260d48c"

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
