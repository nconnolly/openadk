# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libvorbisidec
PKG_VERSION:=		1.0.2
PKG_RELEASE:=		3
PKG_VARIANT:=		svn15687
PKG_HASH:=		0ea6612ab16c52ba874aa5b65a6e3281be41768ab66da79eed48d919a888e2d5
PKG_DESCR:=		fixed point vorbis library
PKG_SECTION:=		libs/audio
PKG_SITES:=		http://ftp.de.debian.org/debian/pool/main/libv/libvorbisidec/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}_${PKG_VERSION}+$(PKG_VARIANT).orig.tar.gz
WRKDIST=		${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)+$(PKG_VARIANT)

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBVORBISIDEC,libvorbisidec,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf

libvorbisidec-install:
	${INSTALL_DIR} ${IDIR_LIBVORBISIDEC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libvorbisidec.so* \
		${IDIR_LIBVORBISIDEC}/usr/lib/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
