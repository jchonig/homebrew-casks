cask "antscope2" do
  version "2.0.2"
  sha256 "b3c49741d065745eb28fb1d9513c73914f474d107cc6d3869b7ab102cd52d6ed"

  url "https://rigexpert.com/files/software/Antscope/antscope2formacos/From%20MacOS%20Sequoia%2015.7.2/AntScope2_#{version}_mac.dmg"
  name "AntScope2"
  desc "Antenna analyzer software for RigExpert devices"
  homepage "https://rigexpert.com/products/software/antscope2/"

  depends_on macos: :sequoia

  app "AntScope2.app"

  zap trash: [
    "~/Library/Application Support/com.rigexpert.AntScope2",
    "~/Library/Caches/com.rigexpert.AntScope2",
    "~/Library/Preferences/com.rigexpert.AntScope2.plist",
  ]
end
