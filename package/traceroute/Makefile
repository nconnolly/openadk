# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		traceroute
PKG_VERSION:=		2.0.19
PKG_RELEASE:=		1
PKG_HASH:=		082be58ec3e6fe9717a52160150e2f6d52fa90f8ecb82abf3b363c8150b0607e
PKG_DESCR:=		utility to trace the route of ip packets
PKG_SECTION:=		net/debug
PKG_URL:=		http://traceroute.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=traceroute/}

PKG_LIBC_DEPENDS:=	glibc musl
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TRACEROUTE,traceroute,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual

MAKE_FLAGS+=		CC="${TARGET_CC}" \
			AR="${TARGET_CROSS}ar" \
			RANLIB="${TARGET_CROSS}ranlib" \
			CFLAGS="${TARGET_CFLAGS}" \
			LDFLAGS="${TARGET_LDFLAGS} -L${WRKSRC}/libsupp"

traceroute-install:
	$(INSTALL_DIR) $(IDIR_TRACEROUTE)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/traceroute \
		$(IDIR_TRACEROUTE)/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
