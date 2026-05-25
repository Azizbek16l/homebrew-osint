# Personal-tap formula for Bluetm.uz / mytools-osint.
#
# Usage (once tap is created):
#   brew tap Azizbek16l/osint
#   brew install mytools-osint
#
# This formula installs the CLI only (`osint` command). For the GUI, install
# the .pkg / .dmg directly from the GitHub release page.
class MytoolsOsint < Formula
  desc "Bluetm OSINT CLI — 32 free-source modules, red-team profiles, TUI, web dashboard, HTML reports"
  homepage "https://github.com/Azizbek16l/mytools-osint"
  version "0.3.1"
  license "MIT"

  # Note: macOS Intel binary not in v0.3.1 (CI runner queue >6h). Intel users:
  #   `pipx install mytools-osint==0.3.1`
  on_macos do
    on_arm do
      url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-macos-arm64"
      sha256 "7f785d76ada2ea8109dc65a3b1537e5b561864364c6000d8ae96d83e08803596"
    end
  end

  on_linux do
    url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-linux-x86_64"
    sha256 "80d87054f4ab481d62ed961f2fb8952e953637bed095f8a4a15564a5e7616555"
  end

  def install
    bin.install Dir["osint-*"].first => "osint"
  end

  test do
    assert_match "mytools-osint", shell_output("#{bin}/osint --version")
  end
end
