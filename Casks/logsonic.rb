cask "logsonic" do
  version "1.3.1"
  sha256 "f9d22b9a3334476b904e6789c1c92aa5dff8d95f13f4b1da8c043bc1917a9fdb"

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
