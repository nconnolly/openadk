# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libnetfilter_log
PKG_VERSION:=		1.0.1
PKG_RELEASE:=		2
PKG_HASH:=		74e0fe75753dba3ac114531b5e73240452c789a3f3adccf5c51217da1d933b21
PKG_DESCR:=		api to packets that have been logged
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		libnfnetlink
PKG_BUILDDEP:=		libnfnetlink
PKG_URL:=		http://www.netfilter.org/projects/libnetfilter_log/
PKG_SITES:=		http://www.netfilter.org/projects/libnetfilter_log/files/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNETFILTER_LOG,libnetfilter-log,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libnetfilter-log-install:
	$(INSTALL_DIR) $(IDIR_LIBNETFILTER_LOG)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnetfilter_log*so* \
		$(IDIR_LIBNETFILTER_LOG)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
