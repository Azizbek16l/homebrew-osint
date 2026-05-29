# Personal-tap formula for Bluetm.uz / mytools-osint.
#
# Usage:
#   brew tap Azizbek16l/osint
#   brew install mytools-osint
#
# This formula installs the CLI only (`osint` command). For the GUI, install
# the .pkg / .dmg directly from the GitHub release page.
class MytoolsOsint < Formula
  desc "Bluetm OSINT CLI v4.3 — chat shell, 7 themes, 45 modules, free APIs"
  homepage "https://github.com/Azizbek16l/mytools-osint"
  version "4.3.1"
  license "MIT"

  # macOS Intel binary not in v4.3.1 (CI macos-13 leg not built this release).
  on_macos do
    on_arm do
      url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-macos-arm64"
      sha256 "6aad6e75e536823efef532ec873ce474bf776ba2692a09977717c3befd2f235a"
    end
  end

  on_linux do
    url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-linux-x86_64"
    sha256 "a48e5f56f27816e20c3218df66ca88bd8115d3256ebecf50100dd1ec851cdf4a"
  end

  def install
    bin.install Dir["osint-*"].first => "osint"
  end

  test do
    assert_match "mytools-osint", shell_output("#{bin}/osint --version")
  end
end
