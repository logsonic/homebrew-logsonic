cask "logsonic" do
  version "1.2.1"
  sha256 "649f93e167d70dc85b4fda02403e6f8569b8a0d336c65617dede6f4c04d3c363"

  url "https://github.com/logsonic/logsonic/releases/download/v#{version}/logsonic_#{version}_macos.pkg"
  name "LogSonic"
  desc "Desktop-first log analytics with full-text search and Grok parsing"
  homepage "https://github.com/logsonic/logsonic"

  depends_on macos: :big_sur

  pkg "logsonic_#{version}_macos.pkg"

  uninstall pkgutil: "com.logsonic.cli"
end
