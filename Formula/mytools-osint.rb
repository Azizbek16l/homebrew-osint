# Personal-tap formula for Bluetm.uz / mytools-osint.
#
# Usage (once tap is created):
#   brew tap Azizbek16l/osint
#   brew install mytools-osint
#
# This formula installs the CLI only (`osint` command). For the GUI, install
# the .pkg / .dmg directly from the GitHub release page.
class MytoolsOsint < Formula
  desc "Bluetm OSINT CLI — 24 free-source modules, red-team profiles, TUI, HTML reports"
  homepage "https://github.com/Azizbek16l/mytools-osint"
  version "0.3.0"
  license "MIT"

  # Note: macOS Intel binary not yet shipped in v0.2.0 (release CI runner queue
  # timed out on macos-13). Intel users: `pipx install mytools-osint==0.2.0`
  on_macos do
    on_arm do
      url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-macos-arm64"
      sha256 "2037c45075e386792257f1fe04c352fcb00aec5ea13135cf8968e875b436023a"
    end
  end

  on_linux do
    url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-linux-x86_64"
    sha256 "fa60c0d393fd20201fdef2250d3098fd5a1ebaf9920acc35784f944965ce4dc4"
  end

  def install
    bin.install Dir["osint-*"].first => "osint"
  end

  test do
    assert_match "mytools-osint", shell_output("#{bin}/osint --version")
  end
end
