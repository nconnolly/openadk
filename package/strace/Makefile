# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		strace
PKG_VERSION:=		4.17
PKG_RELEASE:=		1
PKG_HASH:=		81f35b085fbb3cfa806eb521a8522ac3406deaccfe121ce35064bad268237419
PKG_DESCR:=		system call trace program
PKG_SECTION:=		app/debug
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=strace/}

PKG_ARCH_DEPENDS:=	!nds32

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,STRACE,strace,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

# fails for x86_64
ifeq ($(ADK_TARGET_ARCH),x86_64)
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
endif

ifeq ($(OS_FOR_BUILD),Darwin)
XAKE_FLAGS+=		CPPFLAGS_FOR_BUILD="-I$(STAGING_TARGET_DIR)/usr/include -I$(LINUX_DIR)/include/uapi -I$(LINUX_DIR)/arch/$(ADK_TARGET_ARCH)/include/generated"
else
XAKE_FLAGS+=		CPPFLAGS_FOR_BUILD="-I$(LINUX_DIR)/include/uapi -I$(LINUX_DIR)/arch/$(ADK_TARGET_ARCH)/include/generated"
endif

ifeq ($(ADK_TARGET_LIB_MUSL),y)
TARGET_CPPFLAGS+=	-DMSG_EXCEPT=020000 -D_LARGEFILE64_SOURCE=1
endif

INSTALL_STYLE:=		manual

do-install:
	${INSTALL_DIR} ${IDIR_STRACE}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/strace ${IDIR_STRACE}/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
