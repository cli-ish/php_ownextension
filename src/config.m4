PHP_ARG_ENABLE(php_ownextension, Whether to enable the OwnExtension extension, [ --enable-ownextension-php Enable OwnExtension])

if test "$PHP_OWNEXTENSION" != "no"; then
    PHP_NEW_EXTENSION(php_ownextension, php_ownextension.c, $ext_shared)
fi
