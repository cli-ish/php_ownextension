#include <php.h>
#include "ownextension.h"

// Define a new arginfo
ZEND_BEGIN_ARG_INFO_EX(arginfo_void, 0, 0, 0)
ZEND_END_ARG_INFO()

// Prepare functions list to be exposed to php
zend_function_entry our_functions[] = {
    PHP_FE(ownfunction, arginfo_void)
    PHP_FE(ownfunctionarg, arginfo_void)
    {NULL, NULL, NULL}
};

// Define the module
zend_module_entry ownextension_module_entry = {
    STANDARD_MODULE_HEADER,
    OWNEXTENSION_EXTNAME,
    our_functions,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    OWNEXTENSION_VERSION,
    STANDARD_MODULE_PROPERTIES
};

// Make it dynamic
ZEND_GET_MODULE(ownextension)

// Our functions will be called here.
PHP_FUNCTION(ownfunction) {
    php_printf("Hello World! (from our extension)\n");
}

PHP_FUNCTION(ownfunctionarg) {
    zend_string *ourtext;
    
    // We define our parameters
    ZEND_PARSE_PARAMETERS_START(1, 1)
	Z_PARAM_STR(ourtext)
    ZEND_PARSE_PARAMETERS_END();
    
    php_printf("%s\n", ZSTR_VAL(ourtext));
}
