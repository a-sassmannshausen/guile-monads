dnl -*- Autoconf -*-

AC_INIT(Guile-Monads, 0.1)
AC_CONFIG_SRCDIR(monads)
AC_CONFIG_AUX_DIR([build-aux])
AM_INIT_AUTOMAKE([color-tests -Wall -Wno-portability foreign])
AM_SILENT_RULES([yes])

AC_CONFIG_FILES([Makefile])
AC_CONFIG_FILES([pre-inst-env], [chmod +x pre-inst-env])
AC_CONFIG_FILES([test-env], [chmod +x test-env])

GUILE_PROGS([2.0.11])

AC_OUTPUT
