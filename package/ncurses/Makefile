# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		ncurses
PKG_VERSION:=		6.0
PKG_RELEASE:=		2
PKG_HASH:=		f551c24b30ce8bfb6e96d9f59b42fbea30fa3a6123384172f9e7284bcf647260
PKG_DESCR:=		terminal handling library
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		ncurses-host
PKG_URL:=		http://www.gnu.org/software/ncurses/
PKG_SITES:=		${MASTER_SITE_GNU:=ncurses/}
PKG_LIBNAME:=		libncurses
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_FLAVOURS_LIBNCURSES:=	FULL_TERMINFO
PKGFD_FULL_TERMINFO:=		install the complete set of terminfo files as provided upstream

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,LIBNCURSES,libncurses,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBNCURSES,libncurses,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

ifeq ($(ADK_TARGET_BINFMT_FLAT)$(ADK_TARGET_USE_STATIC_LIBS_ONLY),y)
CONFIGURE_ARGS+=	--with-static
else
CONFIGURE_ARGS+=	--with-shared
endif

CONFIGURE_ENV+=		ac_cv_linux_vers=2
CONFIGURE_ARGS+=	--without-cxx \
			--without-cxx-binding \
			--with-build-cc="${HOST_CC}" \
			--with-pkg-config-libdir=/usr/lib/pkgconfig \
			--without-progs \
			--disable-termcap \
			--enable-symlinks \
			--without-ada \
			--without-normal \
			--enable-pc-files \
			--with-termlib \
			--without-debug \
			--without-profile \
			--without-gpm \
			--without-manpages \
			--without-tests \
			--enable-overwrite \
			--with-terminfo-dirs=/usr/share/terminfo \
			--with-default-terminfo-dir=/usr/share/terminfo \
			--disable-big-core \
			--disable-home-terminfo \
			--disable-assertions \
			--without-rcs-ids \
			--enable-const
ALL_TARGET:=		libs
INSTALL_TARGET:=	install.libs install.data

# use sth which does not exist
HOST_ALL_TARGET:=	progs
HOST_INSTALL_TARGET:=	install.includes install.progs
HOST_CONFIGURE_ARGS+=	--without-shared \
			--with-build-cc="${HOST_CC}" \
			--with-progs \
			--with-ticlib \
			--disable-tic-depends \
			--enable-symlinks \
			--without-manpages \
			--without-tests \
			--without-cxx \
			--without-cxx-binding \
			--without-gpm \
			--without-ada \
			--disable-termcap \
			--without-debug \
			--without-profile

libncurses-install:
	rm -rf ${WRKINST}/usr/lib/terminfo
	# this is installed as libncurses - make libcurses a "link"
	rm -f ${WRKINST}/usr/lib/libcurses.so*
	echo 'GROUP(-lncurses)' >${WRKINST}/usr/lib/libcurses.so
	# libcurses will not show up in the IPKG, only in STAGING_TARGET_DIR
	${INSTALL_DIR} ${IDIR_LIBNCURSES}/usr/lib
	${CP} ${WRKINST}/usr/lib/lib{tinfo,form,menu,ncurses,panel}.so* \
	    ${IDIR_LIBNCURSES}/usr/lib
ifeq (${ADK_PACKAGE_LIBNCURSES_FULL_TERMINFO},y)
	${INSTALL_DIR} ${IDIR_LIBNCURSES}/usr/share
	${CP} ${WRKINST}/usr/share/terminfo ${IDIR_LIBNCURSES}/usr/share/
else
	${INSTALL_DIR} ${IDIR_LIBNCURSES}/usr/share/terminfo/
	for f in ansi dumb linux screen vt100 vt102 \
	    vt220 xterm xterm-color xterm-xfree86; do \
		${INSTALL_DIR} ${IDIR_LIBNCURSES}/usr/share/terminfo/$${f:0:1}; \
		${INSTALL_DATA} ${WRKINST}/usr/share/terminfo/*/$$f \
		    ${IDIR_LIBNCURSES}/usr/share/terminfo/$${f:0:1}/$$f; \
	done
endif

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
