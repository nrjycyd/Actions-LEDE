#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/10.0.0.2/g' package/base-files/files/bin/config_generate

# Modify default KERNEL_PATCHVER
# sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=6.6/g' target/linux/x86/Makefile

# Modify default hostname
sed -i '/uci commit system/i\uci set system.@system[0].hostname='LEDE'' package/lean/default-settings/files/zzz-default-settings

# Add luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/' feeds/luci/collections/luci/Makefile

# Add luci-app-openclash
# mkdir package/luci-app-openclash
# cd package/luci-app-openclash
# git init
# git remote add -f origin https://github.com/vernesong/OpenClash.git
# git config core.sparsecheckout true
# echo "luci-app-openclash" >> .git/info/sparse-checkout
# git pull --depth 1 origin master
# git branch --set-upstream-to=origin/master master
# 编译 po2lmo (如果有po2lmo可跳过)
# pushd luci-app-openclash/tools/po2lmo
# make && sudo make install
# popd
# 回退到主项目目录
# cd ../..
