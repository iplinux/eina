dnl Configure script for doxygen
dnl Vincent Torri 2008-08-25
dnl
dnl EFL_CHECK_DOXYGEN([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
dnl Test for the doxygen program, and define DOXYGEN.
dnl
AC_DEFUN([EFL_CHECK_DOXYGEN],
[

DOXYGEN="doxygen"

dnl
dnl Disable the build of the documentation
dnl
AC_ARG_ENABLE([doc],
   AC_HELP_STRING(
      [--disable-doc],
      [Disable the build of the documentation]),
   [if test "${disable_doc}" = "yes" ; then
       enable_doc="no"
    else
       enable_doc="yes"
    fi],
   [enable_doc="yes"]
)

dnl
dnl Specify the full file name, with path
dnl
AC_ARG_WITH([doxygen],
   AC_HELP_STRING(
      [--with-doxygen=FILE],
      [doxygen program to use @<:@default=doxygen@:>@]),
   dnl
   dnl Check the given doxygen program.
   dnl
   [DOXYGEN=${withval}
    AC_CHECK_PROG([BUILD_DOCS],
       [${DOXYGEN}],
       [yes],
       [no])
    if test "x${BUILD_DOCS}" = "xno" ; then
       echo "WARNING:"
       echo "The doxygen program you specified:"
       echo "$DOXYGEN"
       echo "was not found.  Please check the path and make sure "
       echo "the program exists and is executable."
       AC_MSG_WARN([Warning: no doxygen detected. Documentation will not be built])
    fi
   ],
   [AC_CHECK_PROG([BUILD_DOCS],
       [${DOXYGEN}],
       [yes],
       [no])
    if test "x${BUILD_DOCS}" = "xno" ; then
       echo "WARNING:"
       echo "The doxygen program was not found in your execute"
       echo "You may have doxygen installed somewhere not covered by your path."
       echo ""
       echo "If this is the case make sure you have the packages installed, AND"
       echo "that the doxygen program is in your execute path (see your"
       echo "shell manual page on setting the \$PATH environment variable), OR"
       echo "alternatively, specify the program to use with --with-doxygen."
       AC_MSG_WARN([Warning: no doxygen detected. Documentation will not be built])
    fi
   ]
)

dnl
dnl Substitution
dnl
AC_SUBST([DOXYGEN])

if test "x${BUILD_DOCS}" = "xyes" ; then
  ifelse([$1], , :, [$1])
else
  ifelse([$2], , :, [$2])
fi

])

dnl End of doxygen.m4