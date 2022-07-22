<?php
/* ----------------- mysql settings ----------------- */
define('DB_NAME', 'wordpress');
define('DB_USER', 'mysql');
define('DB_PASSWORD', 'pseudoroot');
define('DB_HOST', 'localhost');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');
 
/*
    --------------- authentication keys ---------------
    you can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ secret-key service}
    you can change these at any point in time to invalidate all existing cookies. this will force all users to have to log in again
*/

define('AUTH_KEY',         'A@4xu#M1NNP(/OT5-?*Z Wx._slPwS^J<B:-VB8:::79^%j+%3xY w*|c2%9+*b1');
define('SECURE_AUTH_KEY',  'ND*/%fT[ 6S=0cwTWq}n|WSHc4?YGDE1-BK]~R3/}G@%p!:#ToIOjCte#lP.1kft');
define('LOGGED_IN_KEY',    '$_=PP|lm( m1RV0=hx_JHlR.}p)09eBO3F!Zp6Kj*Z^!Mp_j)E3[+D}mUn=^AX{(');
define('NONCE_KEY',        'zd8``9T|t* G:c!neI)+`Y:r[Zt()v(< ^PpfG*:?C}(EchrG51>Gc:&0K4ui-Ds');
define('AUTH_SALT',        '-+x?x=eMhB+e6Jz/mk-JL<p/<;}s?-[.R<mMJ C<-Pmg6Hn&EO5R;j<T2iec;2}+');
define('SECURE_AUTH_SALT', '|wTB+,:L3y{8wy^H( U[Qn26_|mJcHb6`dW;j+gg=p8-o8SQ%tF>N0#v-rFniL#M');
define('LOGGED_IN_SALT',   'Fz^[6g}lx`w7:GvBSS|-.?G]I2l;+meCN@cjo5Sg:[(rHY,/-dIf.+yJk$2bdn,|');
define('NONCE_SALT',       '<G8XI|j3Mi6QF5dnF+n@Q;U*=Rdor8of*+CcR>k6>UJ>36^`Bb*$RZ`SAvL25BL(');

/* -------------- database table prefix -------------- */
$table_prefix  = 'wp_';
 
/*
    --------------- wp debugging mode --------------- 
    change this to true to enable the display of notices during development 
*/
define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);
 
if (!defined('ABSPATH'))
    define('ABSPATH', '/var/www/html/wordpress');
 
/* --------------- wp vars and included files --------------- */
require_once(ABSPATH . 'wp-settings.php');