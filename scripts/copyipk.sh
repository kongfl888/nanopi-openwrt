# [K] (C)2020
# https://github.com/kongfl888/nanopi-openwrt

mkdir -p ./r2srom/ipk/

if [ `find friendlywrt-rk3328/friendlywrt/bin/packages/* -name "*adbyby*.ipk" | grep "adbyby" -c` -gt 0 ]; then
	mv -f friendlywrt-rk3328/friendlywrt/bin/packages/*/*adbyby*.ipk ./r2srom/ipk/
fi

if [ `find friendlywrt-rk3328/friendlywrt/bin/packages/* -name "*adguardhome*.ipk" | grep "adguardhome" -c` -gt 0 ]; then
	mv -f friendlywrt-rk3328/friendlywrt/bin/packages/*/*/*adguardhome*.ipk ./r2srom/ipk/
fi

if [ `find friendlywrt-rk3328/friendlywrt/bin/packages/* -name "*iptvhelper*.ipk" | grep "iptvhelper" -c` -gt 0 ]; then
	mv -f friendlywrt-rk3328/friendlywrt/bin/packages/*/*/*iptvhelper*.ipk ./r2srom/ipk/
fi

if [ `find friendlywrt-rk3328/friendlywrt/bin/packages/* -name "*mwan3*.ipk" | grep "mwan3" -c` -gt 0 ]; then
	mv -f friendlywrt-rk3328/friendlywrt/bin/packages/*/*/*mwan3*.ipk ./r2srom/ipk/
fi

if [ `find friendlywrt-rk3328/friendlywrt/bin/packages/* -name "*luci-app-syncdial*.ipk" | grep "syncdial" -c` -gt 0 ]; then
	mv -f friendlywrt-rk3328/friendlywrt/bin/packages/*/*/luci-app-syncdial*.ipk ./r2srom/ipk/
fi

if [ `find friendlywrt-rk3328/friendlywrt/bin/packages/* -name "*luci-app-r2sflasher*.ipk" | grep "r2sflasher" -c` -gt 0 ]; then
	mv -f friendlywrt-rk3328/friendlywrt/bin/packages/*/*/luci-app-r2sflasher*.ipk ./r2srom/ipk/
fi

if [ `find ./r2srom/ipk/* -name "*.ipk" | grep ".ipk" -c` -gt 0 ]; then
    echo "1" > ./r2srom/ipk/noipk
fi
