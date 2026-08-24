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
      url "https://github.com/chrissnell/graywolf/releases/download/v0.14.13/graywolf_0.14.13_macOS_arm64.tar.gz"
      sha256 "1f7429e7fa8d2d8ff7d93e3aec48c5a5e4fc720afc30293faa3518a84f6ee43a"
    end
    on_intel do
      url "https://github.com/chrissnell/graywolf/releases/download/v0.14.13/graywolf_0.14.13_macOS_x86_64.tar.gz"
      sha256 "fb9977a1cc8131ebe6d72e8b192aa0e32c9bc7c30a78a3933396319cc7fb8955"
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
    sleep 3

    response = JSON.parse(shell_output("curl -fs http://127.0.0.1:#{port}/api/version"))
    assert_equal version.to_s, response["version"]
  ensure
    Process.kill("TERM", pid)
  end
end
