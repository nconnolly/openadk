# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libssh2
PKG_VERSION:=		1.7.0
PKG_RELEASE:=		1
PKG_HASH:=		e4561fd43a50539a8c2ceb37841691baf03ecb7daf043766da1b112e4280d584
PKG_DESCR:=		client-side c library implementing ssh2 protocol
PKG_SECTION:=		libs/crypto
PKG_BUILDDEP:=		zlib libressl
PKG_DEPENDS:=		zlib libressl
PKG_URL:=		http://www.libssh2.org/
PKG_SITES:=		http://www.libssh2.org/download/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSSH2,libssh2,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libssh2-install:
	$(INSTALL_DIR) $(IDIR_LIBSSH2)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libssh2*.so* \
		$(IDIR_LIBSSH2)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
