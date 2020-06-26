
if [ `grep -c "CONFIG_BRIDGE_NETFILTER=y" kernel/arch/arm64/configs/nanopi-r2_linux_defconfig` -eq 0 ]; then
    sed -i '/CONFIG_BRIDGE_NETFILTER/d' kernel/arch/arm64/configs/nanopi-r2_linux_defconfig >/dev/null 2>&1
    echo "CONFIG_BRIDGE_NETFILTER=m" >> kernel/arch/arm64/configs/nanopi-r2_linux_defconfig
fi

if [ -e "configs/config_rk3328" ]; then
    sed -i '/adblock/d' configs/config_rk3328
    sed -i '/samba/d' configs/config_rk3328
    sed -i '/CONFIG_LUCI_LANG_/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-bg=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-ca=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-cs=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-de=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-el=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-es=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-fr=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-he=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-hi=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-hu=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-it=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-ja=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-ko=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-ms=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-no=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-pl=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-pt=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-br=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-ro=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-ru=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-sk=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-sv=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-tr=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-uk=/d' configs/config_rk3328
    sed -i '/CONFIG_PACKAGE_luci-i18n-.*-vi=/d' configs/config_rk3328
    sed -i '/CONFIG_KERNEL_BUILD_DOMAIN/d' configs/config_rk3328
    sed -i '/CONFIG_KERNEL_BUILD_USER/d' configs/config_rk3328
echo '
CONFIG_KERNEL_BUILD_DOMAIN="https://github.com/kongfl888"
CONFIG_KERNEL_BUILD_USER="kongfl888"
CONFIG_LUCI_LANG_en=y
CONFIG_LUCI_LANG_zh-cn=y
CONFIG_LUCI_LANG_zh-tw=y
' >> configs/config_rk3328

fi
