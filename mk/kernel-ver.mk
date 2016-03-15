# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.
#
# On the various kernel version variables:
#
# KERNEL_FILE_VER: version numbering used for tarball and contained top level
#                  directory (e.g. linux-4.1.2.tar.bz2 -> linux-4.1.2) (not
#                  necessary equal to kernel's version, e.g. linux-3.19
#                  contains kernel version 3.19.0)
# KERNEL_RELEASE:  OpenADK internal versioning
# KERNEL_VERSION:  final kernel version how we want to identify a specific kernel

ifeq ($(ADK_TARGET_KERNEL_VERSION_GIT),y)
ifneq ($(ADK_TARGET_KERNEL_HASH),)
KERNEL_FILE_VER:=	$(ADK_TARGET_KERNEL_HASH)
else
KERNEL_FILE_VER:=	git
endif
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_4_4_5),y)
KERNEL_FILE_VER:=	4.4.5
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		30219a84d90286dce26f149613eb612438ce42753f0628a32a88ea2a64de4ab5
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_4_1_16),y)
KERNEL_FILE_VER:=	4.1.16
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		8792030cceeb9e6b9e4896afb44d59854ac9d5354ce0ea847ad301f5aa9eb26e
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_18_25),y)
KERNEL_FILE_VER:=	3.18.25
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		c649874e2856101df7cefe5fdad313ebb2282a939fc1e95cf02222327745ff92
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_14_58),y)
KERNEL_FILE_VER:=	3.14.58
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		f4d016cb807b294988c6515c245939b2a7987ba606ad0662958bd8cb8600814b
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_12_51),y)
KERNEL_FILE_VER:=	3.12.51
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		7199a5beaa9b3a6eb3aa30b62d5e66aa333bb4cf5efe715a5d1067f4f68f1820
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_10_94),y)
KERNEL_FILE_VER:=	3.10.94
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		61a700b21ad951c8bc2ed9d3ff3c3c5c6e4124a1f2808f786745d568290cba7f
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_4_110),y)
KERNEL_FILE_VER:=	3.4.110
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		3bc608bc722755128f14ab4a31b973789e23753d6ac8db417498d0f9911ce7d0
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_2_77),y)
KERNEL_FILE_VER:=	3.2.77
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		ce34dac6df719b3bcd99d1380bddf354a0319ae27326a4e10e556a0c5a3df18f
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_2_6_32_70),y)
KERNEL_FILE_VER:=	2.6.32.70
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		d7d0ee4588711d4f85ed67b65d447b4bbbe215e600a771fb87a62524b6341c43
endif
