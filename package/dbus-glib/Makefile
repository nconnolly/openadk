# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		dbus-glib
PKG_VERSION:=		0.102
PKG_RELEASE:=		1
PKG_HASH:=		6964ed585bb8149a14ab744b5ded5e77cf71ec5446e6dcc5fcf5eebcc52df29c
PKG_DESCR:=		glib bindings for dbus
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		libdbus glib
PKG_BUILDDEP:=		dbus glib
PKG_URL:=		http://www.freedesktop.org/wiki/Software/DBusBindings
PKG_SITES:=		http://dbus.freedesktop.org/releases/dbus-glib/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DBUS_GLIB,dbus-glib,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-checks
CONFIGURE_ENV+=		ac_cv_have_abstract_sockets=no

dbus-glib-install:
	$(INSTALL_DIR) $(IDIR_DBUS_GLIB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libdbus-glib-1.so* \
		$(IDIR_DBUS_GLIB)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
