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
  version "4.3.0"
  license "MIT"

  # macOS Intel binary not in v4.3.0 (CI macos-13 runner queue >6h on free tier).
  on_macos do
    on_arm do
      url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-macos-arm64"
      sha256 "72e96cfa1de7769d354a3356d63a0c1710c88d8d7a01fd3bbdb6e1999d8a5534"
    end
  end

  on_linux do
    url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-linux-x86_64"
    sha256 "acc3d6043032abe3ab5e9d7075d57d23625fcffbb54b73c140dca283708afc54"
  end

  def install
    bin.install Dir["osint-*"].first => "osint"
  end

  test do
    assert_match "mytools-osint", shell_output("#{bin}/osint --version")
  end
end
