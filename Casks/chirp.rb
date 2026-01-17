cask "chirp" do
  version "20260116"
  sha256 "4a6cbcd3f497b97733c6bf69a948c011787fd1af3b1f0d33a447db1cd8c8d424"

  url "https://archive.chirpmyradio.com/chirp_next/next-#{version}/chirp-next-#{version}.app.zip",
      verified: "archive.chirpmyradio.com/",
      referer:  "https://archive.chirpmyradio.com/chirp_next/next-#{version}/"
  name "CHIRP"
  desc "Tool for programming amateur radios"
  homepage "https://chirp.danplanet.com/projects/chirp/wiki/Home"

  app "CHIRP.app"

  zap trash: "~/.chirp"
end
