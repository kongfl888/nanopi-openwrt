# [K] (C)2020
# https://github.com/kongfl888/nanopi-openwrt

if [ `find friendlywrt-rk3328/friendlywrt/bin/packages/*/ -name "*adbyby*.ipk" | grep "aaa" -c` -gt 0 ]; then
	mv -f friendlywrt-rk3328/friendlywrt/bin/packages/*/*adbyby*.ipk ./artifact/ipk/
fi

if [ `find friendlywrt-rk3328/friendlywrt/bin/packages/*/ -name "*adguardhome*.ipk" | grep "aaa" -c` -gt 0 ]; then
	mv -f friendlywrt-rk3328/friendlywrt/bin/packages/*/*adguardhome*.ipk ./artifact/ipk/
fi

if [ `find friendlywrt-rk3328/friendlywrt/bin/packages/*/ -name "*iptvhelper*.ipk" | grep "aaa" -c` -gt 0 ]; then
	mv -f friendlywrt-rk3328/friendlywrt/bin/packages/*/*iptvhelper*.ipk ./artifact/ipk/
fi

if [ `find friendlywrt-rk3328/friendlywrt/bin/packages/*/ -name "*mwan3*.ipk" | grep "aaa" -c` -gt 0 ]; then
	mv -f friendlywrt-rk3328/friendlywrt/bin/packages/*/*mwan3*.ipk ./artifact/ipk/
fi

if [ `find friendlywrt-rk3328/friendlywrt/bin/packages/*/ -name "*luci-app-syncdial*.ipk" | grep "aaa" -c` -gt 0 ]; then
	mv -f friendlywrt-rk3328/friendlywrt/bin/packages/*/luci-app-syncdial*.ipk ./artifact/ipk/
fi

if [ `find friendlywrt-rk3328/friendlywrt/bin/packages/*/ -name "*luci-app-r2sflasher*.ipk" | grep "aaa" -c` -gt 0 ]; then
	mv -f friendlywrt-rk3328/friendlywrt/bin/packages/*/luci-app-r2sflasher*.ipk ./artifact/ipk/
fi
