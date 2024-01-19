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
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

# 取消 Lean 大登陆密码
sed -i 's/^\(.*99999\)/#&/' package/lean/default-settings/files/zzz-default-settings

# 删除自带 msd_lite 源码
rm -rf feeds/packages/net/msd_lite
rm -rf package/feeds/packages/msd_lite

# 拉取 passwall-packages 源码
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/feeds/packages/passwall
#cd package/feeds/packages/passwall
#git checkout c189a68728d6bb65d9fb4b47fdacea3ba970a624
#cd -

# 拉取 luci-app-passwall 源码
git clone https://github.com/xiaorouji/openwrt-passwall.git package/feeds/luci/luci-app-passwall
#cd package/feeds/luci/luci-app-passwall
#git checkout d1e618220a9a0a4b73d536101f452a2f4cf14861
#cd -

# 拉取 ShadowSocksR Plus+ 源码
#git clone -b master https://github.com/fw876/helloworld.git package/helloworld

# 拉取 msd_lite 源码
git clone https://github.com/ximiTech/msd_lite.git package/msd_lite
git clone https://github.com/ximiTech/luci-app-msd_lite.git package/luci-app-msd_lite

# 拉取 luci-app-tailscale 源码
#git clone https://github.com/selfcan/luci-app-tailscale.git package/feeds/luci/luci-app-tailscale
