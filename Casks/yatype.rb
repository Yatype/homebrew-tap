cask "yatype" do
  version "0.1.1"
  sha256 "c4f30566c0872c7d51c5cb981b506e165e113cf477de7f20a5e2b8d6495698df"

  url "https://github.com/Yatype/yatype/releases/download/v#{version}/Yatype-#{version}.dmg"
  name "Yatype"
  desc "Fixes text typed in the wrong keyboard layout (Russian/English)"
  homepage "https://github.com/Yatype/yatype"

  app "Yatype.app"

  # Программа бесплатная и без подписи Apple: снимаем карантин, чтобы
  # macOS не показывала предупреждение «не удаётся проверить разработчика».
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Yatype.app"]
  end

  uninstall quit: "com.yatype.app"

  zap trash: "~/Library/Preferences/com.yatype.app.plist"
end
