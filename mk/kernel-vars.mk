# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

KERNEL_MAKE_OPTS:=	V=1 \
			ARCH="$(ADK_TARGET_KARCH)" \
			CROSS_COMPILE="$(TARGET_CROSS)" \
			CC="$(TARGET_CC)" \
			HOSTCC="${HOST_CC}" \
			HOSTCXX="${HOST_CXX}" \
			DISABLE_PAX_PLUGINS=y \
			CONFIG_SHELL='${SHELL}'

# regex for relocs needs pcre
ifeq ($(OS_FOR_BUILD),Darwin)
KERNEL_MAKE_OPTS+=	HOSTLDFLAGS='-lpcreposix -Wl,-no_pie'
endif

# non-Linux platforms need elf.h
ifneq ($(OS_FOR_BUILD),Linux)
KERNEL_MAKE_OPTS+=	HOSTCFLAGS='$(HOST_CPPFLAGS) ${HOST_CFLAGS}'
KERNEL_MAKE_OPTS+=	HOST_EXTRACFLAGS='-I${LINUX_DIR}/tools/include -I${LINUX_DIR}/security/selinux/include -I${ADK_TOPDIR}/adk/include -DKBUILD_NO_NLS'
else
KERNEL_MAKE_OPTS+=	HOSTCFLAGS='${HOST_CFLAGS}'
endif

ifeq ($(ADK_TARGET_SYSTEM_BANANA_PRO),y)
KERNEL_MAKE_OPTS+=	LOADADDR=0x40008000
endif

KERNEL_MAKE_ENV:=	PATH="${TOOLCHAIN_DIR}/usr/bin:${STAGING_HOST_DIR}/usr/bin:$$PATH"
LINUX_BUILD_DIR:=	$(BUILD_DIR)/linux-$(ADK_TARGET_ARCH)
