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
  version "4.2.1"
  license "MIT"

  # macOS Intel binary not in v4.2.1 (CI macos-13 runner queue >6h on free tier).
  on_macos do
    on_arm do
      url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-macos-arm64"
      sha256 "904aaba8f41712ccf44ada7ba022b7154a19b6b205223b9fc9dc723818999d09"
    end
  end

  on_linux do
    url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-linux-x86_64"
    sha256 "d8e97ae9342fba72efd3ec4f4fa6567d5f85786838afc5c2ba07021065c33dbe"
  end

  def install
    bin.install Dir["osint-*"].first => "osint"
  end

  test do
    assert_match "mytools-osint", shell_output("#{bin}/osint --version")
  end
end
