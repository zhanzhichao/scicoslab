
SHELL = /bin/sh

SCIDIR=../
include ../Makefile.incl

all	:: info 

info	:
	@echo "Type \"make tests\" in examples directory"
	@echo "  to test link and addinter features"

SUBDIRS1 = interface-tour-so interface-tutorial-so \
	intersci-examples-so \
	link-examples-so \
	interface-general \
	interface-multi-so \
	mex-examples

SUBDIRS2 = interface-tour interface-tutorial \
	interface-lapack intersci-examples \
	link-examples misc-examples man-examples macros-examples mex-examples 

SUBDIRS= $(SUBDIRS1) $(SUBDIRS2)

distclean::
	@case '${MFLAGS}' in *[ik]*) set +e;; esac; \
	for i in $(SUBDIRS) ;\
	do \
		(cd $$i ; echo "making distclean in examples/$$i..."; \
		$(MAKE) $(MFLAGS)  distclean); \
	done

clean::
	@case '${MFLAGS}' in *[ik]*) set +e;; esac; \
	for i in $(SUBDIRS) ;\
	do \
		(cd $$i ; echo "making clean in examples/$$i..."; \
		$(MAKE) $(MFLAGS) clean); \
	done

TEST_SUBDIRS = $(SUBDIRS1) $(SUBDIRS2) 

tests::
	@case '${MFLAGS}' in *[ik]*) set +e;; esac; \
	for i in $(TEST_SUBDIRS) ;\
	do \
		(cd $$i ; echo "making tests in examples/$$i..."; \
		$(MAKE) $(MFLAGS)  tests); \
	done
