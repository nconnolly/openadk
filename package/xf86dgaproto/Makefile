# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xf86dgaproto
PKG_VERSION:=		2.1
PKG_RELEASE:=		1
PKG_DESCR:=		xfree86-dga headers
PKG_SECTION:=		dev/header
PKG_HASH:=		73bc6fc830cce5a0ec9c750d4702601fc0fca12d6353ede8b4c0092c9c4ca2af
PKG_SITES:=		http://www.x.org/releases/individual/proto/
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86DGAPROTO,xf86dgaproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
