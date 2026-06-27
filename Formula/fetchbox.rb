class Fetchbox < Formula
  desc "IMAP attachment fetcher that uploads to WebDAV (Nextcloud)"
  homepage "https://github.com/jchonig/docker-fetchbox"
  version "0.4.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jchonig/docker-fetchbox/releases/download/v#{version}/fetchbox-darwin-arm64.tar.gz"
      sha256 "8d0e6b0e6e46f1d4a5648fdaefc75de00101cf40d81f3b243dfa0ba89c666858"
    end
    on_intel do
      url "https://github.com/jchonig/docker-fetchbox/releases/download/v#{version}/fetchbox-darwin-amd64.tar.gz"
      sha256 "39f36fcea5062fd936b06327b407d7e779d6fe1e630178326763d36c667a4932"
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
