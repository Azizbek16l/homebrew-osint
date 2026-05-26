# Personal-tap formula for Bluetm.uz / mytools-osint.
#
# Usage:
#   brew tap Azizbek16l/osint
#   brew install mytools-osint
#
# This formula installs the CLI only (`osint` command). For the GUI, install
# the .pkg / .dmg directly from the GitHub release page.
class MytoolsOsint < Formula
  desc "Bluetm OSINT CLI v4.2 — smart shell, 7 themes, 45 modules, free APIs"
  homepage "https://github.com/Azizbek16l/mytools-osint"
  version "4.2.0"
  license "MIT"

  # macOS Intel binary not in v4.2.0 (CI macos-13 runner queue >6h on free tier).
  # Intel users: build from source or wait for community contribution.
  on_macos do
    on_arm do
      url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-macos-arm64"
      sha256 "645f645800f4122f8b8f6a9fab5d16afe29b4de303177314fca3e7215ee0c624"
    end
  end

  on_linux do
    url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-linux-x86_64"
    sha256 "7face891f475d81a996ae3fad26fe4915cd0f2f2b65b02daaa5a6d7bd72c9e74"
  end

  def install
    bin.install Dir["osint-*"].first => "osint"
  end

  test do
    assert_match "mytools-osint", shell_output("#{bin}/osint --version")
  end
end
