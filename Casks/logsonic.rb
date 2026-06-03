cask "logsonic" do
  version "1.2.4"
  sha256 "58531f25e18ac9820e6e7c97461ad3aa0d7ee98b37f91f67ed3258334d0c93ea"

  url "https://github.com/logsonic/logsonic/releases/download/v#{version}/logsonic_#{version}_macos.zip"
  name "LogSonic"
  desc "Desktop-first log analytics with full-text search and Grok parsing"
  homepage "https://github.com/logsonic/logsonic"

  depends_on macos: :big_sur

  app "Logsonic.app"
  binary "#{appdir}/Logsonic.app/Contents/MacOS/logsonic", target: "logsonic"

  zap trash: "~/Library/Application Support/Logsonic"

  caveats <<~EOS
    LogSonic stores its search index under:
      ~/Library/Application Support/Logsonic
    This directory grows with the logs you ingest. To cap it, run logsonic with
    --retention-days N (or set RETENTION_DAYS). To delete all indexed data when
    uninstalling, run:
      brew uninstall --zap logsonic
  EOS
end
