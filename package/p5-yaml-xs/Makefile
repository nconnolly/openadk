# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p5-yaml-xs
PKG_VERSION:=		0.41
PKG_RELEASE:=		1
PKG_HASH:=		9a654427a3a63de434c6d03b18bba144cc7ba0f0e61a7100c6d08d77a90145ce
PKG_DESCR:=		yaml serialization using xs and libyaml
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl
PKG_BUILDDEP:=		perl-host perl
PKG_SITES:=		http://cpan.metacpan.org/authors/id/I/IN/INGY/

DISTFILES:=             YAML-LibYAML-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/YAML-LibYAML-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,P5_YAML_XS,p5-yaml-xs,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

include $(ADK_TOPDIR)/mk/perl.mk

CONFIG_STYLE:=		perl
XAKE_FLAGS+=		$(PERL_ENV)

p5-yaml-xs-install:
	$(INSTALL_DIR) $(IDIR_P5_YAML_XS)$(PERL_SITEDIR)
	$(CP) $(WRKINST)$(PERL_SITEDIR)/* \
		$(IDIR_P5_YAML_XS)$(PERL_SITEDIR)

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
