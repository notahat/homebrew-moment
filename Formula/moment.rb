class Moment < Formula
  desc "Command-line tool to list calendar events and reminders for the next 7 days"
  homepage "https://github.com/notahat/moment"
  url "https://github.com/notahat/moment/archive/v0.1.0.tar.gz"
  sha256 "21e24cf4ce76d52c3491f632ee2cbda888677d999b6a9875523c7a43e936af88"
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
