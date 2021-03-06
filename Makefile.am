## Guile-Monads --- GNU Guile application cnofiguration
## Copyright © 2015 Alex Sassmannshausen <alex@pompo.co>
##
## This file is part of Guile-Monads.
##
## Guile-Monads is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
##
## Guile-Monads is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Guile-Monads.  If not, see <http://www.gnu.org/licenses/>.

GOBJECTS = $(SOURCES:%.scm=%.go)

nobase_mod_DATA = $(SOURCES) $(NOCOMP_SOURCES)
nobase_go_DATA = $(GOBJECTS)

# Make sure source files are installed first, so that the mtime of
# installed compiled files is greater than that of installed source
# files.  See
# <http://lists.gnu.org/archive/html/guile-devel/2010-07/msg00125.html>
# for details.
guile_install_go_files = install-nobase_goDATA
$(guile_install_go_files): install-nobase_modDATA

CLEANFILES =					\
  $(GOBJECTS)					\
  $(TESTS:tests/%.scm=%.log)
EXTRA_DIST = $(SOURCES) $(NOCOMP_SOURCES)
GUILE_WARNINGS = -Wunbound-variable -Warity-mismatch -Wformat
SUFFIXES = .scm .go
.scm.go:
	$(AM_V_GEN)$(top_builddir)/pre-inst-env $(GUILE_TOOLS) compile $(GUILE_WARNINGS) -o "$@" "$<"

moddir=$(prefix)/share/guile/site/2.0
godir=$(libdir)/guile/2.0/ccache

SOURCES =					\
  monads.scm					\
  monads/io.scm

TESTS =						\
  tests/monads.scm

TEST_EXTENSIONS = .scm
AM_TESTS_ENVIRONMENT = abs_top_srcdir="$(abs_top_srcdir)"
SCM_LOG_COMPILER = $(top_builddir)/test-env $(GUILE)
AM_SCM_LOG_FLAGS = --no-auto-compile -L "$(top_srcdir)"

info_TEXINFOS = doc/monads.texi
doc_haunt_TEXINFOS = doc/fdl-1.3.texi
dvi: # Don't build dvi docs

EXTRA_DIST +=					\
  pre-inst-env.in				\
  test-env.in					\
  README					\
  guix.scm					\
  $(TESTS)


