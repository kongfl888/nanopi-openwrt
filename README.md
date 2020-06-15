## Nanopi r2s openwrt 固件自动编译

### 代码说明

本库派生自 [klever1988/nanopi-openwrt](https://github.com/klever1988/nanopi-openwrt)，并由该作者主力维护

### 固件说明

本固件是friendlywrt和openwrt混编的结果，前者为基后者为主。

minimal版本就是Lean版opwenwrt的最小编译，加入Turbo加速和一两个VPN插件和广告插件跟KMS等（不含多播），是原作者主力维护的版本

而minimal2则是在minimal版的基础上加入最基本的NAS应用：网络共享(samba)和下载工具。软路由空间大，没个samba实在是浪费。

多播还是没有，因为我这边好像不支持多播，测试不了所以不想加。

对了，docker也没有。

usb-wifi驱动有，就网上常见的芯片，

![支持列表](http://wiki.friendlyarm.com/wiki/images/f/f9/R2swrt%2Busbwifi-08.jpg)。

建议不要对它抱有太大的期望。

### 发布地址：

[下载传送门](https://github.com/kongfl888/nanopi-openwrt/releases)

（彻底解压出来，img包才是最终固件格式）

### 温馨提示：

Lean版的默认用户名是root, 密码是password  
Lienol版默认用户名是root, 密码为空

烧制完固件插入tf卡并启动完成，电脑端显示“网络（已连接）”之后，在浏览器输入 http://friendlywrt/ 可以直接打开路由器后台，无需修改本地连接设置或者查看IP地址。如果网络状态一直是未识别（上电超过5分钟），请直接插拔一次电源重启试试。

tf卡直接影响系统启动速度。建议使用C10+卡，卡容量大小至少2GB。

### 更新说明：

[核心更新内容](https://github.com/klever1988/nanopi-openwrt/blob/master/CHANGELOG.md)

未知问题：bpfilter/netfilter偶尔抽风导致网口链接丢失，具体原因未知。

#### 本固件(minimal版本)NAT基准性能测试：

<img src="https://github.com/klever1988/nanopi-openwrt/raw/master/assets/NAT.jpg" width="600" /><img src="https://raw.githubusercontent.com/klever1988/nanopi-openwrt/master/assets/Acc.jpg" width="250" />
