cask "chirp" do
  version "20260123"
  sha256 "983e217446c7134ef8ea0cd189b5f8ee148db352787aa3623dc884e45104b3fb"

  url "https://archive.chirpmyradio.com/chirp_next/next-#{version}/chirp-next-#{version}.app.zip",
      verified: "archive.chirpmyradio.com/",
      referer:  "https://archive.chirpmyradio.com/chirp_next/next-#{version}/"
  name "CHIRP"
  desc "Tool for programming amateur radios"
  homepage "https://chirp.danplanet.com/projects/chirp/wiki/Home"

  app "CHIRP.app"

  zap trash: "~/.chirp"
end
