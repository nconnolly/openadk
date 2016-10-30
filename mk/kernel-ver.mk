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

ifeq ($(ADK_TARGET_KERNEL_GIT),y)
ifneq ($(ADK_TARGET_KERNEL_HASH),)
KERNEL_FILE_VER:=	$(ADK_TARGET_KERNEL_HASH)
else
KERNEL_FILE_VER:=	$(ADK_KERNEL_GITVER)
endif
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_4_8),y)
KERNEL_FILE_VER:=	4.8.5
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		48171714923f52b03e667011426cb62089fd3df9eb4be1227b781188d680c408
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_4_4),y)
KERNEL_FILE_VER:=	4.4.28
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		841acb9109a893ab2f60b02355e1527e80fa09251e46339317f6984d69b1f4fc
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_4_1),y)
KERNEL_FILE_VER:=	4.1.35
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		544af0400818a4b5ee7bca192c52e801faf7eeb22eed128c89aeb490344cc04a
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_18),y)
KERNEL_FILE_VER:=	3.18.44
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		5661ccb8e45ec290d16d9617056d32f54bdea1357b1b3047c9c4042c78824db2
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_12),y)
KERNEL_FILE_VER:=	3.12.66
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		8c219fd19367423be58a50584d293e593ff0aba65f95db2b08303090f561ca0a
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_10),y)
KERNEL_FILE_VER:=	3.10.104
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		e3d23228b5398a484c81e9d5012bc49bbbe1eda245a05a8a4110bddb3e316c12
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_4),y)
KERNEL_FILE_VER:=	3.4.113
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		c474a1d630357e64ae89f374a2575fa9623e87ea1a97128c4d83f08d4e7a0b4f
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_2),y)
KERNEL_FILE_VER:=	3.2.83
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		db578292c43c8cbca7530723d4da4fc784e6cdadc61bff5e966bfb00dbc947e1
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_2_6_32),y)
KERNEL_FILE_VER:=	2.6.32.70
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		d7d0ee4588711d4f85ed67b65d447b4bbbe215e600a771fb87a62524b6341c43
endif
