# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		watchdog
PKG_VERSION:=		5.13
PKG_RELEASE:=		1
PKG_HASH:=		141e0faf3ee4d8187a6ff4e00b18ef7b7a4ce432a2d4c8a6e6fdc62507fc6eb0
PKG_DESCR:=		watchdog daemon
PKG_SECTION:=		sys/hw
PKG_DEPENDS:=		libtirpc
PKG_BUILDDEP:=		libtirpc
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=watchdog/}
PKG_BB:=		1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WATCHDOG,watchdog,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=	-D_GNU_SOURCE
TARGET_CFLAGS+=		-I$(STAGING_TARGET_DIR)/usr/include/tirpc
TARGET_LDFLAGS+=	-ltirpc

watchdog-install:
	${INSTALL_DIR} ${IDIR_WATCHDOG}/sbin ${IDIR_WATCHDOG}/etc/
	${INSTALL_DATA} ./files/watchdog.conf ${IDIR_WATCHDOG}/etc/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/watchdog \
		       ${IDIR_WATCHDOG}/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
