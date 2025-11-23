cask "chirp" do
  version "20251121"
  sha256 "c2b95e6a7aaaf7aa931d29fc410f3e44bbaa019b06e8c9f3125c7dceb58bd951"

  url "https://archive.chirpmyradio.com/chirp_next/next-#{version}/chirp-next-#{version}.app.zip",
      verified: "archive.chirpmyradio.com/",
      referer:  "https://archive.chirpmyradio.com/chirp_next/next-#{version}/"
  name "CHIRP"
  desc "Tool for programming amateur radios"
  homepage "https://chirp.danplanet.com/projects/chirp/wiki/Home"

  app "CHIRP.app"

  zap trash: "~/.chirp"
end
