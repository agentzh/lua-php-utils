version=0.01

name=lua-php-utils
dist=$(name)-$(version)

LUA_VERSION =   5.1

# See http://lua-users.org/wiki/BuildingModules for platform specific
# details.

## Linux/BSD
PREFIX ?=          /usr/local
LDFLAGS +=         -shared

## OSX (Macports)
#PREFIX ?=          /opt/local
#LDFLAGS +=         -bundle -undefined dynamic_lookup

LUA_INCLUDE_DIR ?= $(PREFIX)/include
LUA_LIB_DIR ?=     $(PREFIX)/lib/lua/$(LUA_VERSION)

.PHONY: all clean dist test t

all:
	@echo Nothing to do.

test:
	prove -r t

valtest:
	TEST_LUA_USE_VALGRIND=1 prove -r t

install:
	$(INSTALL) -d $(DESTDIR)/$(LUA_LIB_DIR)/php
	$(INSTALL) php/utils.lua $(DESTDIR)/$(LUA_LIB_DIR)/php

