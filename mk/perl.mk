PERL_VERSION=5.18.1
PERL_ARCHNAME:=$(ADK_TARGET_CPU_ARCH)-linux
PERL_SITEDIR:=/usr/lib/perl5/site_perl/$(PERL_VERSION)
PERL_INCDIR:=/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE
PERL_ENV:=	AR="$(TARGET_AR)" \
		FULL_AR="$(TARGET_AR)" \
		CC="$(TARGET_CC)" \
		CCFLAGS="$(TARGET_CFLAGS)" \
		LD="$(TARGET_CC)" \
		LDDLFLAGS="-shared $(TARGET_LDFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		PERL_INC=$(STAGING_TARGET_DIR)/$(PERL_INCDIR) \
		DESTDIR=$(WRKINST) \
		INSTALLDIRS=vendor \
		INSTALLVENDORLIB=$(PERL_SITEDIR) \
		INSTALLVENDORARCH=$(PERL_SITEDIR)/$(PERL_ARCHNAME) \
		INSTALLVENDORBIN=/usr/bin \
		INSTALLVENDORSCRIPT=/usr/bin
