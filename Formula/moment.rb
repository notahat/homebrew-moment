class Moment < Formula
  desc "Command-line tool to list calendar events and reminders for the next 7 days"
  homepage "https://github.com/notahat/moment"
  url "https://github.com/notahat/moment/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox"
    bin.install ".build/release/moment"
  end

  test do
    # Just verify the binary runs (it will fail gracefully without calendar access)
    assert_match "access", shell_output("#{bin}/moment 2>&1", 1)
  end
end
