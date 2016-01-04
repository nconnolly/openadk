# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		gst-plugins-good
PKG_VERSION:=		1.6.2
PKG_RELEASE:=		1
PKG_HASH:=		876e54dfce93274b98e024f353258d35fa4d49d1f9010069e676c530f6eb6a92
PKG_DESCR:=		gstreamer good plugins
PKG_SECTION:=		libs/video
PKG_DEPENDS:=		gstreamer
PKG_BUILDDEP:=		gstreamer libvorbis libtheora alsa-lib
PKG_URL:=		http://gstreamer.freedesktop.org/
PKG_SITES:=		http://gstreamer.freedesktop.org/src/gst-plugins-good/
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GST_PLUGINS_GOOD,gst-plugins-good,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_CPPFLAGS+=	-D_GNU_SOURCE -D_POSIX_SOURCE
CONFIGURE_ARGS+=	--without-x

gst-plugins-good-install:
	$(INSTALL_DIR) $(IDIR_GST_PLUGINS_GOOD)/usr/lib/gstreamer-1.0/
	$(CP) $(WRKINST)/usr/lib/gstreamer-1.0/*.so \
		$(IDIR_GST_PLUGINS_GOOD)/usr/lib/gstreamer-1.0/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk