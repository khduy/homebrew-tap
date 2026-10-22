cask "sniptext" do
  version "0.1.1"
  sha256 "623eb757e2b0a2dd4ac123857eb7f1198e3a0a5607f79cb49d83e5ed448113bf"

  url "https://github.com/khduy/snip-text/releases/download/v#{version}/SnipText-#{version}.zip"
  name "SnipText"
  desc "Menu bar OCR: select a screen region and copy its text"
  homepage "https://github.com/khduy/snip-text"

  depends_on macos: :sequoia

  app "SnipText.app"

  # The app is not notarized; drop the quarantine flag so Gatekeeper does not block it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/SnipText.app"],
                          must_succeed: false
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
