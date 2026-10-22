cask "sniptext" do
  version "0.1.0"
  sha256 "44dd9d4b5615f0195df309211d21e8891f9166a29311a83522eea9eec0a6d025"

  url "https://github.com/khduy/snip-text/releases/download/v#{version}/SnipText-#{version}.zip"
  name "SnipText"
  desc "Menu bar OCR: select a screen region and copy its text"
  homepage "https://github.com/khduy/snip-text"

  depends_on macos: :sequoia

  app "SnipText.app"

  # The app is not notarized; drop the quarantine flag so Gatekeeper does not block it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/SnipText.app"]
  end

  uninstall quit: "io.github.khduy.sniptext"

  zap trash: [
    "~/Library/Application Support/SnipText",
    "~/Library/Caches/SnipText",
    "~/Library/Caches/io.github.khduy.sniptext",
    "~/Library/Preferences/io.github.khduy.sniptext.plist",
  ]

  caveats <<~EOS
    SnipText needs Screen Recording permission. After enabling it in
    System Settings → Privacy & Security, restart SnipText.

    If macOS still blocks the app on first launch, run:
      xattr -dr com.apple.quarantine #{appdir}/SnipText.app
  EOS
end
