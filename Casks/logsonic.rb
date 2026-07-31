cask "logsonic" do
  version "1.4.2"
  sha256 "71514b2db4534d5d7cce57846554de516a17a3a3feb45bde03213b2f601581e8"

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
