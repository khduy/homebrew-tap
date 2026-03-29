cask "sniptext" do
  version "1.0.1"
  sha256 "7a487ab2b0e3d006af669e707a070341248c8a4c95fb011b7565d591d9377489"
  url "https://github.com/khduy/SnipText/releases/download/v1.0.1/SnipText.zip"
  name "SnipText"
  desc "Capture screen regions and copy extracted text"
  homepage "https://github.com/khduy/SnipText"

  depends_on arch: :arm64

  app "SnipText.app"

  zap trash: [
    "~/Library/Application Support/SnipText",
    "~/Library/Preferences/com.khduy.SnipText.plist",
  ]

  caveats <<~EOS
    SnipText is currently unsigned.
    If macOS blocks it on first launch, run:

      xattr -cr /Applications/SnipText.app
  EOS
end
