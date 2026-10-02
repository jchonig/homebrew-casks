class Graywolf < Formula
  desc "APRS station with software modem, digipeater, iGate, and web UI"
  homepage "https://github.com/chrissnell/graywolf"
  license "GPL-2.0-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/chrissnell/graywolf/releases/download/v0.14.14/graywolf_0.14.14_macOS_arm64.tar.gz"
      sha256 "1fdc58aab8dea7dd72fbdbb57be5067a828b48db22a529b4c185a29424d2c4f5"
    end
    on_intel do
      url "https://github.com/chrissnell/graywolf/releases/download/v0.14.14/graywolf_0.14.14_macOS_x86_64.tar.gz"
      sha256 "50ede751ca8df86931ced6d011e1f8eeffe15b12ac6139492412d9fe0dd48703"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chrissnell/graywolf/releases/download/v0.14.14/graywolf_0.14.14_linux_arm64.tar.gz"
      sha256 "e4cf639bd0e9bbddef16ec6d5175416b3ccf74cb2d84a84d52499c9000da52c5"
    end
    on_intel do
      url "https://github.com/chrissnell/graywolf/releases/download/v0.14.14/graywolf_0.14.14_linux_x86_64.tar.gz"
      sha256 "9d8c47cec2660da52b01fed5686cb1dd4f5d3bb12e63bf07e100c1d3f8821542"
    end
  end

  def install
    bin.install "graywolf"
    bin.install "graywolf-modem"
    (var/"graywolf").mkpath
    (var/"log").mkpath
  end

  service do
    run [opt_bin/"graywolf"]
    working_dir var/"graywolf"
    keep_alive true
    log_path var/"log/graywolf.log"
    error_log_path var/"log/graywolf.log"
  end

  def caveats
    <<~EOS
      Graywolf keeps its config database, tile cache, and other state in
      its working directory.

      To run graywolf as a background service (recommended for unattended
      digipeater/iGate operation), state is kept under
      #{var}/graywolf and the web UI listens on http://127.0.0.1:8080:
        brew services start graywolf

      To run it interactively instead, use a dedicated directory:
        mkdir -p ~/.graywolf && cd ~/.graywolf && graywolf

      See the handbook for configuration and operation:
        https://chrissnell.com/software/graywolf/
    EOS
  end

  test do
    assert_match "Usage of graywolf", shell_output("#{bin}/graywolf -h 2>&1")

    port = free_port
    pid = spawn bin/"graywolf", "-http", "127.0.0.1:#{port}"

    response = nil
    20.times do
      sleep 0.5
      begin
        response = JSON.parse(shell_output("curl -fs http://127.0.0.1:#{port}/api/version"))
        break
      rescue
        next
      end
    end

    refute_nil response
    assert_equal version.to_s, response["version"]
  ensure
    Process.kill("TERM", pid)
  end
end
