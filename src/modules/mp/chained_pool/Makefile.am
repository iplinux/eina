MAINTAINERCLEANFILES = Makefile.in

AM_CPPFLAGS = \
-I. \
-I$(top_srcdir)/src/include \
-I$(top_builddir)/src/include \
@EINA_CPPFLAGS@ \
@EFL_EINA_BUILD@

if EINA_BUILD_CHAINED_POOL
if !EINA_STATIC_BUILD_CHAINED_POOL

controllerdir = $(libdir)/eina/modules/mp/chained_pool/$(MODULE_ARCH)
controller_LTLIBRARIES = module.la

module_la_SOURCES = \
eina_chained_mempool.c

module_la_CFLAGS = @EINA_CFLAGS@ @EFL_PTHREAD_CFLAGS@
module_la_LIBADD = $(top_builddir)/src/lib/libeina.la @EINA_LIBS@
module_la_LDFLAGS = -no-undefined @lt_enable_auto_import@ -module -avoid-version @EFL_PTHREAD_LIBS@
module_la_LIBTOOLFLAGS = --tag=disable-static

endif
endif

clean-local:
	rm -rf *.gcno
