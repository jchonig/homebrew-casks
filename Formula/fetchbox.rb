class Fetchbox < Formula
  desc "IMAP attachment fetcher that uploads to WebDAV (Nextcloud)"
  homepage "https://github.com/jchonig/docker-fetchbox"
  version "0.4.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jchonig/docker-fetchbox/releases/download/v#{version}/fetchbox-darwin-arm64.tar.gz"
      sha256 "cacfd8b6b82e74157e6f4cc9ff47a846ba90e570c6ceff75ce1960b59ae66174"
    end
    on_intel do
      url "https://github.com/jchonig/docker-fetchbox/releases/download/v#{version}/fetchbox-darwin-amd64.tar.gz"
      sha256 "0188c9be120d61da0aaad971f26fb574ca2a8a7a6ca26a5318f252f97afed271"
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
  end
end
