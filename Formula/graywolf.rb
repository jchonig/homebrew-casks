class Graywolf < Formula
  desc "APRS station with software modem, digipeater, iGate, and web UI"
  homepage "https://github.com/chrissnell/graywolf"
  version "0.14.12"
  license "GPL-2.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/chrissnell/graywolf/releases/download/v#{version}/graywolf_#{version}_macOS_arm64.tar.gz"
      sha256 "acc3d382a8425cf6d5a50d21f7d8ade48427e3edd934870e5f4a144e749e990a"
    end
    on_intel do
      url "https://github.com/chrissnell/graywolf/releases/download/v#{version}/graywolf_#{version}_macOS_x86_64.tar.gz"
      sha256 "65847627996264b3decac7de18a04a4480669ab65b15c741693d22baa01fe2b0"
    end
  end

  def install
    bin.install "graywolf"
    bin.install "graywolf-modem"
  end

  def caveats
    <<~EOS
      Graywolf keeps its config database, tile cache, and other state in
      the current working directory by default. Run it from a dedicated
      directory:
        mkdir -p ~/.graywolf && cd ~/.graywolf && graywolf

      See the handbook for configuration and operation:
        https://chrissnell.com/software/graywolf/
    EOS
  end

  test do
    assert_match "Usage of graywolf", shell_output("#{bin}/graywolf -h 2>&1")
  end
end
