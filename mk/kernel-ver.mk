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

ifeq ($(ADK_TARGET_KERNEL_VERSION_GIT)$(ADK_TARGET_KERNEL_VERSION_RPI)$(ADK_TARGET_KERNEL_VERSION_FSLC),y)
ifneq ($(ADK_TARGET_KERNEL_HASH),)
KERNEL_FILE_VER:=	$(ADK_TARGET_KERNEL_HASH)
else
KERNEL_FILE_VER:=	$(ADK_KERNEL_GITVER)
endif
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_4_6),y)
KERNEL_FILE_VER:=	4.6.5
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		7e2d53c8a36a159c444be8f452eae898fadc1f1862fe470a36c836c3d1d613c5
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_4_4),y)
KERNEL_FILE_VER:=	4.4.17
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		159451471c0df6bde8043b85dfacafa58e65c4a0cabb1157e83916326cd04f81
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_4_1),y)
KERNEL_FILE_VER:=	4.1.30
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		9d22eaaecce666c9e813653bd2a7654849f3f105bdcefe3fe4ee8035f2ad92c6
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_18),y)
KERNEL_FILE_VER:=	3.18.33
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		33f2a5d10769c05f6ed6a9eff24429ffd4fbaeb492320e3f9da318d56afdaa30
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_14),y)
KERNEL_FILE_VER:=	3.14.72
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		0c64e38255e591dc06d57881ce08e29009c2d31fcdaab2b1a4b736bc873f4724
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_12),y)
KERNEL_FILE_VER:=	3.12.59
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		6c626d95186c082a3a3e7e777cd374c0e03a851d8b8b2b2a0ee29786a1efce93
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_10),y)
KERNEL_FILE_VER:=	3.10.101
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		36358cdcc2f322d4b5fc0e7fc44376b7dbc895c94703db8787722145b7e912bd
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_4),y)
KERNEL_FILE_VER:=	3.4.112
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		29c8370c4c6e639ad5e38e6eb052058d5f45add3167f2aa4cc08e6569f024181
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_2),y)
KERNEL_FILE_VER:=	3.2.80
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		0823ab862fd7de6ea4d9b002fedfb0a293b05df697307e7b0a82e76eaf1e827d
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_2_6_32),y)
KERNEL_FILE_VER:=	2.6.32.70
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		d7d0ee4588711d4f85ed67b65d447b4bbbe215e600a771fb87a62524b6341c43
endif
