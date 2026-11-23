class Coolnex < Formula
  desc "Friendly fan controller for macOS — terminal dashboard and CLI"
  homepage "https://github.com/SyCLoNEwoRLD/coolnex"
  url "https://github.com/SyCLoNEwoRLD/coolnex/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "d3e54d810637cea4bf62236bb67908000a76a612a3995020b9a8b66111e96433"
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
