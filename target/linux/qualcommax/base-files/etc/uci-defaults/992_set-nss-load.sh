#!/bin/sh

#指定文件路径
FILE="/usr/share/rpcd/ucode/luci"

#添加NSS状态显示
[ -f "$FILE" ] && sed -i "s#const fd = popen('top.*')#const fd = popen('/sbin/cpuusage')#g" $FILE

#锁定NSS频率
mkdir -p /etc/sysctl.d && echo 'dev.nss.clock.auto_scale=0' > /etc/sysctl.d/97-nss-lock-clock.conf

exit 0