cask "chirp" do
  version "20260102"
  sha256 "1eae322be4d839792a94eb2bcb3d5fe16bd199613cbf3772eb9fdfadedfd56ac"

  url "https://archive.chirpmyradio.com/chirp_next/next-#{version}/chirp-next-#{version}.app.zip",
      verified: "archive.chirpmyradio.com/",
      referer:  "https://archive.chirpmyradio.com/chirp_next/next-#{version}/"
  name "CHIRP"
  desc "Tool for programming amateur radios"
  homepage "https://chirp.danplanet.com/projects/chirp/wiki/Home"

  app "CHIRP.app"

  zap trash: "~/.chirp"
end
