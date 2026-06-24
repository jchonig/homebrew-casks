class Fetchbox < Formula
  desc "IMAP attachment fetcher that uploads to WebDAV (Nextcloud)"
  homepage "https://github.com/jchonig/docker-fetchbox"
  version "0.4.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jchonig/docker-fetchbox/releases/download/v#{version}/fetchbox-darwin-arm64.tar.gz"
      sha256 "3b9398695bba65caa5f705e14e6cc4ab7a90110dd7184e6db04bd27ccbe7a5f8"
    end
    on_intel do
      url "https://github.com/jchonig/docker-fetchbox/releases/download/v#{version}/fetchbox-darwin-amd64.tar.gz"
      sha256 "45192febf212cb771f7ccc14d68f0b82d3b96e134f7d8c94ac5642d87e4da4bb"
    end
  end

  def install
    bin.install "fetchbox"
  end

  service do
    run [opt_bin/"fetchbox", "--daemon"]
    keep_alive true
    log_path var/"log/fetchbox.log"
    error_log_path var/"log/fetchbox.log"
  end

  def caveats
    <<~EOS
      Configuration: ~/.config/fetchbox.yml

      Credentials are stored in the macOS Keychain. Run once interactively
      to populate them before starting the service:
        fetchbox --list-folders
        brew services start fetchbox
    EOS
  end

  test do
    assert_match "Usage", shell_output("#{bin}/fetchbox --help 2>&1", 2)
    assert_match version, shell_output("#{bin}/fetchbox --version")
  end
end
