pkgname=corekeeper
pkgver=1.1.0.1
pkgrel=1
pkgdesc="A mining sandbox adventure game"
arch=("x86_64")
makedepends=("steamcmd")
depends=("xorg-server-xvfb" "libxi")
source=("sysusers.conf" "tmpfiles.conf" "corekeeper.service" "launch.sh")
md5sums=("06d72127a4f704032bc077fac396b4c3" "e86fb461e0cf35093cb704da75f0ce2f" "8bbdb201f14873f670fed9db8a60be56" "5848098a6a93d90d537646a635cd56bc")
options=("!strip")

prepare() {
    local STEAMWORKS_SDK_REDIST_STEAMID=1007
    local CORE_KEEPER_DEDICATED_SERVER_STEAMID=1963720

    steamcmd \
        +force_install_dir "$srcdir/steam" \
        +login anonymous \
        +app_update $STEAMWORKS_SDK_REDIST_STEAMID validate \
        +app_update $CORE_KEEPER_DEDICATED_SERVER_STEAMID validate \
        +quit
}

package() {
    install -Dm 644 sysusers.conf $pkgdir/usr/lib/sysusers.d/corekeeper.conf
    install -Dm 644 tmpfiles.conf $pkgdir/usr/lib/tmpfiles.d/corekeeper.conf
    install -Dm 644 corekeeper.service $pkgdir/usr/lib/systemd/system/corekeeper.service

    install -Dm 544 launch.sh $pkgdir/opt/corekeeper/launch.sh
    cp -r steam $pkgdir/opt/corekeeper
}
