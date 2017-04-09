DCOMPILER = dmd

project_dir ?= $(CURDIR)
srcdir = $(project_dir)/src
objdir = $(project_dir)/obj
bindir = $(project_dir)/bin

OS ?= UnkOS
ARCH ?= x86_64
APP_VERSION ?= v~dev
PKG_ROOT_DIR ?= $(notdir $(basename $(CURDIR)))
PKG_DIR = $(PKG_ROOT_DIR)-$(APP_VERSION)_$(OS)-$(ARCH)_$(DCOMPILER)
TAR_FILE ?= $(PKG_DIR).tar.gz

appname = helloworld
appsrc = $(srcdir)/$(appname).d
app = $(bindir)/$(appname)

release: $(app)
$(app): $(appsrc)
	$(DCOMPILER) -release -O -od$(objdir) -of$(app) $(appsrc)

clean:
	-rm $(objdir)/*.o
	-rm $(bindir)/*

test-nobuild:
	$(app)

package: clean release test-nobuild
	mkdir $(PKG_DIR)
	cp -pr $(bindir) $(PKG_DIR)
	tar -czf $(TAR_FILE) $(PKG_DIR)
	-rm -r $(PKG_DIR)

