# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		gnupg2
PKG_VERSION:=		2.1.19
PKG_RELEASE:=		1
PKG_HASH:=		46cced1f5641ce29cc28250f52fadf6e417e649b3bfdec49a5a0d0b22a639bf0
PKG_DESCR:=		gnu privacy guard (modern)
PKG_SECTION:=		app/crypto
PKG_DEPENDS:=		libreadline libncurses libgcrypt libgpg-error libassuan
PKG_DEPENDS+=		libksba npth
PKG_BUILDDEP:=		readline ncurses libgcrypt libgpg-error libassuan
PKG_BUILDDEP+=		libksba npth
PKG_URL:=		http://www.gnupg.org/
PKG_SITES:=		ftp://ftp.gnupg.org/gcrypt/gnupg/

DISTFILES:=		gnupg-$(PKG_VERSION).tar.bz2
WRKDIST=		${WRKDIR}/gnupg-${PKG_VERSION}

PKG_SUBPKGS:=		GNUPG2 GPGV2
 
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GNUPG2,gnupg2,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))
$(eval $(call PKG_template,GPGV2,gpgv2,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIGURE_ARGS+=	--disable-dirmngr \
			--disable-gpgsm \
			--disable-scdaemon \
			--disable-card-support \
			--disable-bzip2 \
			--disable-exec \
			--disable-ldap \
			--disable-rpath \
			--disable-regex

gpgv2-install:
	$(INSTALL_DIR) $(IDIR_GPGV2)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/g10/gpgv \
		$(IDIR_GPGV2)/usr/bin

gnupg2-install:
	$(INSTALL_DIR) $(IDIR_GNUPG2)/usr/bin/
	$(INSTALL_BIN) $(WRKBUILD)/g10/gpg $(IDIR_GNUPG2)/usr/bin/
	# we need root privileges for secure memory (locked pages)
	chmod u+s $(IDIR_GNUPG2)/usr/bin/gpg

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
