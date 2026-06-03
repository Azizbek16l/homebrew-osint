# Personal-tap formula for Bluetm.uz / mytools-osint.
#
# Usage:
#   brew tap Azizbek16l/osint
#   brew install mytools-osint
#
# This formula installs the CLI only (`osint` command). For the GUI, install
# the .pkg / .dmg directly from the GitHub release page.
class MytoolsOsint < Formula
  desc "Bluetm OSINT CLI v4.3 — chat shell, 7 themes, 47 modules, free APIs"
  homepage "https://github.com/Azizbek16l/mytools-osint"
  version "4.3.4"
  license "MIT"

  # macOS Intel binary not in v4.3.4 (CI macos-13 leg not built this release).
  on_macos do
    on_arm do
      url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-macos-arm64"
      sha256 "52b9a345c70b5eb29f65946a3723f55613b790f7643149fc99d44a13898c9028"
    end
  end

  on_linux do
    url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-linux-x86_64"
    sha256 "1c3e837cf44cf545d995903f7beb2a853a465c0e30c1fa6178f191d86de9ab4f"
  end

  def install
    bin.install Dir["osint-*"].first => "osint"
  end

  test do
    assert_match "mytools-osint", shell_output("#{bin}/osint --version")
  end
end
