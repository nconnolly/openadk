ifeq ($(ADK_KERNEL_VERSION_TOOLCHAIN),y)
KERNEL_VERSION:=	2.6.39.4
KERNEL_RELEASE:=	1
KERNEL_MD5SUM:=		a17c748c2070168f1e784e9605ca043d
endif
ifeq ($(ADK_KERNEL_VERSION_2_6_39_4),y)
KERNEL_VERSION:=	2.6.39.4
KERNEL_RELEASE:=	1
KERNEL_MD5SUM:=		a17c748c2070168f1e784e9605ca043d
endif
ifeq ($(ADK_KERNEL_VERSION_3_0_22),y)
KERNEL_VERSION:=	3.0.22
KERNEL_RELEASE:=	1
KERNEL_MD5SUM:=		0cb510da24d9cf7bd17091ed49176178
endif
ifeq ($(ADK_KERNEL_VERSION_3_1_10),y)
KERNEL_VERSION:=	3.1.10
KERNEL_RELEASE:=	1
KERNEL_MD5SUM:=		3649bdaa50ffd9114cc16486ec54d83a
endif
ifeq ($(ADK_KERNEL_VERSION_3_2_7),y)
KERNEL_VERSION:=	3.2.7
KERNEL_RELEASE:=	1
KERNEL_MD5SUM:=		c0303125c8eda431b10084eece7564e3
endif
