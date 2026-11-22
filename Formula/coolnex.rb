class Coolnex < Formula
  desc "Friendly fan controller for macOS — terminal dashboard and CLI"
  homepage "https://github.com/SyCLoNEwoRLD/coolnex"
  url "https://github.com/SyCLoNEwoRLD/coolnex/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "953dee17efd35ccdfedefef85f366ea1086dc411abf4e0a2959c090573cc0be1"
  license "GPL-3.0-or-later"
  head "https://github.com/SyCLoNEwoRLD/coolnex.git", branch: "main"

  depends_on :macos

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox"
    bin.install ".build/release/coolnex"
  end

  test do
    assert_match "coolnex #{version}", shell_output("#{bin}/coolnex --version")
  end
end
