cask "antscope2" do
  version "1.4.15"
  sha256 "731673467338a4bee8d931091e094be26b11cc159eb4ea3e76c40f48ab52417d"

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
