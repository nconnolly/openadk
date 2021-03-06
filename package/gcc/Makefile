# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk
include ${ADK_TOPDIR}/toolchain/gcc/Makefile.inc

PKG_NAME:=		gcc
PKG_DESCR:=		c compiler
PKG_SECTION:=		dev/lang
PKG_OPTS:=		noremove
PKG_DEPENDS:=		libmpc libgmp mpfr
PKG_BUILDDEP:=		libmpc gmp mpfr

PKG_NEEDS:=		c++

PKG_SUBPKGS:=		GCC GXX
PKGSD_GXX:=		c++ compiler

WRKBUILD=               ${WRKDIR}/${PKG_NAME}-obj

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GCC,gcc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,GXX,g++,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CPPFLAGS_FOR_BUILD:=	-I$(STAGING_HOST_DIR)/usr/include
CFLAGS_FOR_BUILD:=
LDFLAGS_FOR_BUILD:=
TARGET_CPPFLAGS:=
TARGET_CFLAGS:=
TARGET_LDFLAGS:=
TARGET_CXXFLAGS:=

ifeq ($(ADK_TARGET_SYSTEM_LEMOTE_YEELONG),y)
CONFIGURE_ARGS+=       --with-abi=$(ADK_TARGET_MIPS_ABI)
endif
ifeq ($(ADK_TARGET_SYSTEM_QEMU_MIPS64),y)
CONFIGURE_ARGS+=       --with-abi=$(ADK_TARGET_MIPS_ABI)
endif
ifeq ($(ADK_TARGET_SYSTEM_QEMU_MIPS64EL),y)
CONFIGURE_ARGS+=       --with-abi=$(ADK_TARGET_MIPS_ABI)
endif

ifneq ($(ADK_PACKAGE_GXX),)
CONFIGURE_ARGS+=	--enable-languages=c,c++
else
CONFIGURE_ARGS+=	--enable-languages=c
endif
ifeq ($(ADK_TARGET_CPU_ARCH),ppc)
CONFIGURE_ARGS+=	--disable-target-optspace --with-long-double-64 --enable-secureplt
TARGET_CFLAGS+=		'-Wl,--secure-plt'
else
CONFIGURE_ARGS+=	--enable-target-optspace
endif

CONFIGURE_ENV+=		have_sys_sdt_h=no
CONFIGURE_ARGS+=	--host=$(GNU_TARGET_NAME) \
			--target=$(GNU_TARGET_NAME) \
			--build=$(GNU_HOST_NAME) \
			--disable-__cxa_atexit \
			--without-headers \
			--libexecdir=/usr/lib \
			--disable-libssp \
			--disable-biarch \
			--disable-libmudflap \
			--disable-libgomp \
			--disable-libquadmath \
			--disable-libquadmath-support \
			--disable-multilib \
			--disable-libstdcxx-pch \
			--disable-libsanitizer \
			--disable-libitm \
			--disable-install-libiberty \
			--enable-dependency-tracking \
			--enable-cxx-flags="${TARGET_LDFLAGS}"

# disable honour cflags stuff
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s

pre-configure:
	$(SED) 's@\./fixinc\.sh@-c true@' $(WRKSRC)/gcc/Makefile.in
	$(SED) 's/install_to_$$(INSTALL_DEST) //' ${WRKSRC}/libiberty/Makefile.in

gcc-install:
	${INSTALL_DIR} ${IDIR_GCC}/usr/lib/gcc ${IDIR_GCC}/usr/bin
	${INSTALL_DIR} ${IDIR_GCC}/lib
	${INSTALL_BIN} ${WRKINST}/usr/bin/gcc ${IDIR_GCC}/usr/bin/
	cd ${IDIR_GCC}/usr/bin/ && ln -sf gcc cc
	${INSTALL_BIN} ${WRKINST}/usr/bin/cpp ${IDIR_GCC}/usr/bin/
	cd ${IDIR_GCC}/lib && ln -sf ../usr/bin/cpp .
	${CP} ${WRKINST}/usr/lib/gcc/* ${IDIR_GCC}/usr/lib/gcc/
	rm -rf ${IDIR_GCC}/usr/lib/gcc/*/*/install-tools

g++-install:
	${INSTALL_DIR} ${IDIR_GXX}/usr/bin
	${INSTALL_DIR} ${IDIR_GXX}/usr/include/c++
	${INSTALL_BIN} ${WRKINST}/usr/bin/g++ ${IDIR_GXX}/usr/bin/
	cd ${IDIR_GXX}/usr/bin/ && ln -sf g++ c++
	${CP} ${WRKINST}/usr/include/c++/* ${IDIR_GXX}/usr/include/c++/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
