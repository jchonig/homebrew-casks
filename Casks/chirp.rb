cask "chirp" do
  version "20260109"
  sha256 "5e2530eaba3abf06ab97e073633f2a78234e5558284108d6e66a8d9f646e0abe"

  url "https://archive.chirpmyradio.com/chirp_next/next-#{version}/chirp-next-#{version}.app.zip",
      verified: "archive.chirpmyradio.com/",
      referer:  "https://archive.chirpmyradio.com/chirp_next/next-#{version}/"
  name "CHIRP"
  desc "Tool for programming amateur radios"
  homepage "https://chirp.danplanet.com/projects/chirp/wiki/Home"

  app "CHIRP.app"

  zap trash: "~/.chirp"
end
