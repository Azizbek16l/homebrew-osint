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
  version "4.3.2"
  license "MIT"

  # macOS Intel binary not in v4.3.2 (CI macos-13 leg not built this release).
  on_macos do
    on_arm do
      url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-macos-arm64"
      sha256 "076453ab52a6ac4937c35966f8ecaa335ddbff830646c65a93cce04116786f67"
    end
  end

  on_linux do
    url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-linux-x86_64"
    sha256 "200f1796c2885c0754e00e2fcdf6cc48d5356c133ad919a61675ec229a6f9c78"
  end

  def install
    bin.install Dir["osint-*"].first => "osint"
  end

  test do
    assert_match "mytools-osint", shell_output("#{bin}/osint --version")
  end
end
