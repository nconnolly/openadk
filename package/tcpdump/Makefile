# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		tcpdump
PKG_VERSION:=		4.9.0
PKG_RELEASE:=		1
PKG_HASH:=		eae98121cbb1c9adbedd9a777bf2eae9fa1c1c676424a54740311c8abcee5a5e
PKG_DESCR:=		tool for network monitoring and data acquisition
PKG_SECTION:=		net/debug
PKG_DEPENDS:=		libpcap
PKG_BUILDDEP:=		libpcap
PKG_URL:=		http://www.tcpdump.org/
PKG_SITES:=		http://www.tcpdump.org/release/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_FLAVOURS_TCPDUMP:=	WITH_IPV6 WITH_CHROOT
PKGFD_WITH_IPV6:=	enable IPv6 support
PKGFD_WITH_CHROOT:=	enable chrooting to /var/lib/tcpdump

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TCPDUMP,tcpdump,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		BUILD_CC="${TARGET_CC}" HOSTCC=${CC_FOR_BUILD} \
			td_cv_buggygetaddrinfo="no"
CONFIGURE_ARGS+=	--without-crypto
ifneq (${ADK_PACKAGE_TCPDUMP_WITH_IPV6},)
CONFIGURE_ARGS+=	--enable-ipv6
else
CONFIGURE_ARGS+=	--disable-ipv6
endif
ifneq (${ADK_PACKAGE_TCPDUMP_WITH_CHROOT},)
CONFIGURE_ARGS+=	--with-chroot="/var/lib/tcpdump" --with-user="nobody"
endif
XAKE_FLAGS+=		CCOPT="${TARGET_CFLAGS}" \
			INCLS="-I. -I${STAGING_TARGET_DIR}/usr/include"

XAKE_FLAGS+=           GCC_HONOUR_COPTS=s

tcpdump-install:
	${INSTALL_DIR} ${IDIR_TCPDUMP}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/tcpdump ${IDIR_TCPDUMP}/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
