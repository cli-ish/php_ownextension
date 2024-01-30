PHP_ARG_ENABLE(ownextension, Whether to enable the OwnExtension extension, [ --enable-ownextension Enable OwnExtension])

if test "$OWNEXTENSION" != "no"; then
    PHP_NEW_EXTENSION(ownextension, ownextension.c, $ext_shared)
fi
