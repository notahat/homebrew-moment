class Moment < Formula
  desc "Command-line tool to list calendar events and reminders for the next 7 days"
  homepage "https://github.com/notahat/moment"
  url "https://github.com/notahat/moment/archive/v0.2.0.tar.gz"
  sha256 "52a445788809e828e74d6f7ed5f8718aa36317c583ccfde9f07d6a8d68771fd8"
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
