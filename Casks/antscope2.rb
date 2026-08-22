cask "antscope2" do
  version "2.0.2"
  sha256 "b3c49741d065745eb28fb1d9513c73914f474d107cc6d3869b7ab102cd52d6ed"

  url "https://rigexpert.com/files/software/Antscope/antscope2formacos/From%20MacOS%20Sequoia%2015.7.2/AntScope2_#{version}_mac.dmg"
  name "AntScope2"
  desc "Antenna analyzer software for RigExpert devices"
  homepage "https://rigexpert.com/products/software/antscope2/"

  livecheck do
    url "https://rigexpert.com/files/software/Antscope/antscope2formacos/"
    regex(/AntScope2_(\d+(?:\.\d+)+)_mac\.dmg/i)
    strategy :page_match do |page, regex|
      dirs = page.scan(%r{href="(From[^"]*/)"}).flatten
      next [] if dirs.empty?

      latest_dir = dirs.max_by { |dir| dir.scan(/\d+/).map(&:to_i) }
      nested_url = "https://rigexpert.com/files/software/Antscope/antscope2formacos/#{latest_dir}"

      nested_page = Homebrew::Livecheck::Strategy.page_content(nested_url)[:content]
      next [] if nested_page.blank?

      nested_page.scan(regex).flatten.uniq
    end
  end

  depends_on macos: :sequoia

  app "AntScope2.app"

  zap trash: [
    "~/Library/Application Support/com.rigexpert.AntScope2",
    "~/Library/Caches/com.rigexpert.AntScope2",
    "~/Library/Preferences/com.rigexpert.AntScope2.plist",
  ]
end
