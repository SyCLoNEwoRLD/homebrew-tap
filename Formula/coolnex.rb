class Coolnex < Formula
  desc "Friendly fan controller for macOS — terminal dashboard and CLI"
  homepage "https://github.com/SyCLoNEwoRLD/coolnex"
  url "https://github.com/SyCLoNEwoRLD/coolnex/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "7dcb146e8292ecb2e19631e63657b0437b9ba0aabdcd08d079672c35d1c18b71"
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
