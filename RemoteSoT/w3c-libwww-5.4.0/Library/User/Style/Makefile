# Generated automatically from Makefile.in by configure.
# Makefile.in generated automatically by automake 1.4 from Makefile.am

# Copyright (C) 1994, 1995-8, 1999 Free Software Foundation, Inc.
# This Makefile.in is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.


SHELL = /bin/sh

srcdir = .
top_srcdir = ../../..
prefix = /home/graph/tptp/ServiceTools/RemoteSOT/w3c-libwww-5.4.0
exec_prefix = ${prefix}

bindir = ${exec_prefix}/bin
sbindir = ${exec_prefix}/sbin
libexecdir = ${exec_prefix}/libexec
datadir = ${prefix}/share
sysconfdir = ${prefix}/etc
sharedstatedir = ${prefix}/com
localstatedir = ${prefix}/var
libdir = ${exec_prefix}/lib
infodir = ${prefix}/info
mandir = ${prefix}/man
includedir = ${prefix}/include
oldincludedir = /usr/include

DESTDIR =

pkgdatadir = $(datadir)/w3c-libwww
pkglibdir = $(libdir)/w3c-libwww
pkgincludedir = $(includedir)/w3c-libwww

top_builddir = ../../..

ACLOCAL = aclocal
AUTOCONF = autoconf
AUTOMAKE = automake
AUTOHEADER = autoheader

INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL} $(AM_INSTALL_PROGRAM_FLAGS)
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_SCRIPT = ${INSTALL_PROGRAM}
transform = s,x,x,

NORMAL_INSTALL = :
PRE_INSTALL = :
POST_INSTALL = :
NORMAL_UNINSTALL = :
PRE_UNINSTALL = :
POST_UNINSTALL = :
build_alias = i686-pc-linux-gnu
build_triplet = i686-pc-linux-gnu
host_alias = i686-pc-linux-gnu
host_triplet = i686-pc-linux-gnu
target_alias = i686-pc-linux-gnu
target_triplet = i686-pc-linux-gnu
AR = /usr/bin/ar
AS = 
A_STDIO = 
CC = gcc
CHMOD = /bin/chmod
COMPRESS = /bin/gzip
CP = /bin/cp
CVS = /usr/bin/cvs
CVS2SQL = 
DAVSAMPLE = 
DLLTOOL = 
EXEEXT = 
HTLIBXML = ${top_builddir}/modules/expat/xmlparse/libxmlparse.la ${top_builddir}/modules/expat/xmltok/libxmltok.la
HTSQL = 
HTSQLLOG = 
HTWAIS = 
HTXML = HTXML.lo
HTZLIB = 
LD = /usr/bin/ld
LIBTOOL = $(SHELL) $(top_builddir)/libtool
LIBWWWDAV = 
LIBWWWMD5 = ${top_builddir}/modules/md5/libmd5.la
LIBWWWSQL = 
LIBWWWSSL = 
LIBWWWWAIS = 
LIBWWWXML = ${top_builddir}/Library/src/libwwwxml.la ${top_builddir}/modules/expat/xmlparse/libxmlparse.la ${top_builddir}/modules/expat/xmltok/libxmltok.la
LIBWWWZIP = 
LN_S = ln -s
LWWWDAV = 
LWWWMD5 = -lmd5
LWWWSQL = 
LWWWSSL = 
LWWWWAIS = 
LWWWXML = -lwwwxml -lxmltok -lxmlparse
LWWWZIP = 
MAKEINFO = makeinfo
MKDIR = /bin/mkdir
MYEXT = 
NM = /usr/bin/nm -B
OBJDUMP = 
PACKAGE = w3c-libwww
PREVIOUS_VERSION = 5.3.2
PURIFY_CACHE = /tmp/purify.cache
RANLIB = ranlib
RM = /bin/rm
SED = /bin/sed
SHOWXML = showxml$(EXEEXT) ptri$(EXEEXT) stri$(EXEEXT) rdf_parse_file$(EXEEXT) rdf_parse_buffer$(EXEEXT)
SSLINC = 
TAR = /bin/tar
VERSION = 5.4.0
WWWDAV = 
WWWMD5 = libmd5.la
WWWSQL = 
WWWSSL = 
WWWSSLEX = 
WWWWAIS = 
WWWXML = libwwwxml.la
WWWZIP = 
XMLPARSE = libxmlparse.la
XMLTOK = libxmltok.la
ac_afsws_fs_found = @ac_afsws_fs_found@
ac_bn = @ac_bn@
ac_sys_afs_sysname = @ac_sys_afs_sysname@
have_perl = perl
have_resolv_conf = /etc/resolv.conf
have_rlogin = rlogin
have_telnet = telnet
have_tn3270 = 
icondir = ${prefix}/share/w3c-libwww
subdirs = @subdirs@

AUTOMAKE_OPTIONS = foreign

DOCS := $(wildcard *.html *.gif)

EXTRA_DIST =  	$(DOCS)

mkinstalldirs = $(SHELL) $(top_srcdir)/config/mkinstalldirs
CONFIG_HEADER = ../../../wwwconf.h
CONFIG_CLEAN_FILES = 
DIST_COMMON =  Makefile.am Makefile.in


DISTFILES = $(DIST_COMMON) $(SOURCES) $(HEADERS) $(TEXINFOS) $(EXTRA_DIST)

GZIP_ENV = --best
all: all-redirect
.SUFFIXES:
$(srcdir)/Makefile.in: Makefile.am $(top_srcdir)/configure.in $(ACLOCAL_M4) 
	cd $(top_srcdir) && $(AUTOMAKE) --foreign --include-deps Library/User/Style/Makefile

Makefile: $(srcdir)/Makefile.in  $(top_builddir)/config.status
	cd $(top_builddir) \
	  && CONFIG_FILES=$(subdir)/$@ CONFIG_HEADERS= $(SHELL) ./config.status

tags: TAGS
TAGS:


distdir = $(top_builddir)/$(PACKAGE)-$(VERSION)/$(subdir)

subdir = Library/User/Style

distdir: $(DISTFILES)
	@for file in $(DISTFILES); do \
	  d=$(srcdir); \
	  if test -d $$d/$$file; then \
	    cp -pr $$d/$$file $(distdir)/$$file; \
	  else \
	    test -f $(distdir)/$$file \
	    || ln $$d/$$file $(distdir)/$$file 2> /dev/null \
	    || cp -p $$d/$$file $(distdir)/$$file || :; \
	  fi; \
	done
info-am:
info: info-am
dvi-am:
dvi: dvi-am
check-am: all-am
check: check-am
installcheck-am:
installcheck: installcheck-am
install-exec-am:
install-exec: install-exec-am

install-data-am:
install-data: install-data-am

install-am: all-am
	@$(MAKE) $(AM_MAKEFLAGS) install-exec-am install-data-am
install: install-am
uninstall-am:
uninstall: uninstall-am
all-am: Makefile
all-redirect: all-am
install-strip:
	$(MAKE) $(AM_MAKEFLAGS) AM_INSTALL_PROGRAM_FLAGS=-s install
installdirs:


mostlyclean-generic:

clean-generic:

distclean-generic:
	-rm -f Makefile $(CONFIG_CLEAN_FILES)
	-rm -f config.cache config.log stamp-h stamp-h[0-9]*

maintainer-clean-generic:
mostlyclean-am:  mostlyclean-generic

mostlyclean: mostlyclean-am

clean-am:  clean-generic mostlyclean-am

clean: clean-am

distclean-am:  distclean-generic clean-am
	-rm -f libtool

distclean: distclean-am

maintainer-clean-am:  maintainer-clean-generic distclean-am
	@echo "This command is intended for maintainers to use;"
	@echo "it deletes files that may require special tools to rebuild."

maintainer-clean: maintainer-clean-am

.PHONY: tags distdir info-am info dvi-am dvi check check-am \
installcheck-am installcheck install-exec-am install-exec \
install-data-am install-data install-am install uninstall-am uninstall \
all-redirect all-am all installdirs mostlyclean-generic \
distclean-generic clean-generic maintainer-clean-generic clean \
mostlyclean distclean maintainer-clean


# Tell versions [3.59,3.63) of GNU make to not export all variables.
# Otherwise a system limit (for SysV at least) may be exceeded.
.NOEXPORT:
