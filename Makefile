# [K] 2020

include $(TOPDIR)/rules.mk

PKG_NAME:=dns2socks
PKG_VERSION:=2.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/kongfl888/dns2socks.git
PKG_SOURCE_VERSION:=HEAD
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_LICENSE:=GPL-3.0
PKG_MAINTAINER:=kongfl888 <kongfl888@outlook.com>
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(PKG_SOURCE_SUBDIR)

PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk

define Package/dns2socks
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=IP Addresses and Names
	TITLE:=The utility to resolve DNS requests via a SOCKS5 tunnel.
	URL:=http://dns2socks.sourceforge.net/
	DEPENDS:=+libpthread
endef

define Package/dns2socks/description
	This is a utility to resolve DNS requests via a SOCKS5 tunnel and caches the answers.
endef

MAKE_PATH := DNS2SOCKS

define Package/dns2socks/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/DNS2SOCKS/dns2socks $(1)/usr/bin
endef

$(eval $(call BuildPackage,dns2socks))
