cask "yatype" do
  version "0.1.3"
  sha256 "1d860187043cca24192303cce8c1f0b1f36a8777039de88685d8229e25de2d52"

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
