cask "antscope2" do
  on_sonoma :or_older do
    version "1.4.9"
    sha256 "5bec0f9741b183c5976a21e5a08f1f8b3cab1b40fa76fe5609752abdfd687366"

    url "https://rigexpert.com/files/software/Antscope/antscope2formacos/Up%20to%20MacOS%20Sonoma%2014.2.1/AntScope2_#{version}_mac.dmg"
  end
  on_sequoia :or_newer do
    version "2.0.2"
    sha256 "b3c49741d065745eb28fb1d9513c73914f474d107cc6d3869b7ab102cd52d6ed"

    url "https://rigexpert.com/files/software/Antscope/antscope2formacos/From%20MacOS%20Sequoia%2015.7.2/AntScope2_#{version}_mac.dmg"
  end

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

  depends_on :macos

  app "AntScope2.app"

  zap trash: [
    "~/Library/Application Support/com.rigexpert.AntScope2",
    "~/Library/Caches/com.rigexpert.AntScope2",
    "~/Library/Preferences/com.rigexpert.AntScope2.plist",
  ]
end
