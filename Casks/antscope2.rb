cask "antscope2" do
  on_sequoia :or_later do
    version "1.4.15"
    sha256 "731673467338a4bee8d931091e094be26b11cc159eb4ea3e76c40f48ab52417d"
    url "https://rigexpert.com/files/software/Antscope/antscope2formacos/From%20MacOS%20Sequoia%2015.7.2/AntScope2_#{version}_mac.dmg"
  end

  on_sonoma :or_earlier do
    version "1.4.9"
    sha256 "5bec0f9741b183c5976a21e5a08f1f8b3cab1b40fa76fe5609752abdfd687366"
    url "https://rigexpert.com/files/software/Antscope/antscope2formacos/Up%20to%20MacOS%20Sonoma%2014.2.1/AntScope2_#{version}_mac.dmg"
  end

  name "AntScope2"
  desc "Antenna analyzer software for RigExpert devices"
  homepage "https://rigexpert.com/products/software/antscope2/"

  app "AntScope2.app"

  zap trash: [
    "~/Library/Application Support/com.rigexpert.AntScope2",
    "~/Library/Caches/com.rigexpert.AntScope2",
    "~/Library/Preferences/com.rigexpert.AntScope2.plist",
  ]
end
