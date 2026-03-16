class Moment < Formula
  desc "Command-line tool to list calendar events and reminders for the next 7 days"
  homepage "https://github.com/notahat/moment"
  url "https://github.com/notahat/moment/archive/v0.4.0.tar.gz"
  sha256 "1caa5e4d2df95ada239bad864b64e1cb3e181bb7138288b2a37f4786a33c9fdc"
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
