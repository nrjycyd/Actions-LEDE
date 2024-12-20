#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/10.0.0.2/g' package/base-files/files/bin/config_generate # 18.06 LuCI
# sed -i 's/192.168.1.1/10.0.0.2/g' package/base-files/luci2/bin/config_generate # 23.05 LuCI

# Modify default KERNEL_PATCHVER
sed -i 's/KERNEL_PATCHVER:=6.6/KERNEL_PATCHVER:=6.12/g' target/linux/x86/Makefile

# Modify default hostname
sed -i '/uci commit system/i\uci set system.@system[0].hostname='LEDE'' package/lean/default-settings/files/zzz-default-settings

# Add luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon # 18.06 LuCI
# git clone https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon # 23.05 LuCI
