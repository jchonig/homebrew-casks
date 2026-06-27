class Fetchbox < Formula
  desc "IMAP attachment fetcher that uploads to WebDAV (Nextcloud)"
  homepage "https://github.com/jchonig/docker-fetchbox"
  version "0.4.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jchonig/docker-fetchbox/releases/download/v#{version}/fetchbox-darwin-arm64.tar.gz"
      sha256 "723f9dd399014717e04deaaae99e75cf4264853b1ac4df98b5030a061bd8f6c0"
    end
    on_intel do
      url "https://github.com/jchonig/docker-fetchbox/releases/download/v#{version}/fetchbox-darwin-amd64.tar.gz"
      sha256 "0a0af6daf9c50acd9b6e02774eeb9192daa62ee7868f7d90e243ab81723bb1aa"
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
