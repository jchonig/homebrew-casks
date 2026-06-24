class Fetchbox < Formula
  desc "IMAP attachment fetcher that uploads to WebDAV (Nextcloud)"
  homepage "https://github.com/jchonig/docker-fetchbox"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jchonig/docker-fetchbox/releases/download/v#{version}/fetchbox-darwin-arm64.tar.gz"
      sha256 "ae3f18f9ab6329daa96d1c54c15b6f7f5bb998a2800c50ffb8852076009b6dc2"
    end
    on_intel do
      url "https://github.com/jchonig/docker-fetchbox/releases/download/v#{version}/fetchbox-darwin-amd64.tar.gz"
      sha256 "f804f319f603862a236703735c4b51dbdf546ada1d5f684fb2990949027c8c4a"
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
