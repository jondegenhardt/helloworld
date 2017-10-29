DCOMPILER = dmd
DFLAGS =
DOCKER_LDC_IMAGE = dlanguage/ldc

project_dir ?= $(CURDIR)
srcdir = $(project_dir)/src
objdir = $(project_dir)/obj
bindir = $(project_dir)/bin
scriptdir = $(project_dir)/script

OS ?= UnkOS
ARCH ?= x86_64
APP_VERSION ?= v~dev
PKG_ROOT_DIR ?= $(notdir $(basename $(CURDIR)))
DCOMPILER_BASENAME = $(notdir $(basename $(DCOMPILER)))
PKG_DIR = $(PKG_ROOT_DIR)-$(APP_VERSION)_$(OS)-$(ARCH)_$(DCOMPILER_BASENAME)
TAR_FILE ?= $(PKG_DIR).tar.gz

appname = helloworld
appsrc = $(srcdir)/$(appname).d
app = $(bindir)/$(appname)
dockerldc = $(scriptdir)/docker-ldc.sh

release: $(dockerldc) $(app)
$(app): $(appsrc)
	$(DCOMPILER) -release -O $(DFLAGS) -od$(objdir) -of$(app) $(appsrc)

$(dockerldc):
	mkdir -p $(scriptdir)
	echo '#!/bin/sh\ndocker run --rm -ti -u `stat -c "%u:%g" .` -v $$(pwd):/src $(DOCKER_LDC_IMAGE) ldc2 $$*' > $(dockerldc)
	chmod a+x $(dockerldc)

clean:
	-rm $(objdir)/*.o
	-rm $(bindir)/*
	-rm $(dockerldc)

test: release test-nobuild

test-nobuild:
	$(app)

package: clean release test-nobuild
	mkdir $(PKG_DIR)
	cp -pr $(bindir) $(PKG_DIR)
	tar -czf $(TAR_FILE) $(PKG_DIR)
	-rm -r $(PKG_DIR)

