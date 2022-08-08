<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wurrigon' );

/** Database password */
define( 'DB_PASSWORD', 'pseudoroot' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'WD#mSgh4_s/Rlcs^c,E+!+GvSatT56G:ml*y-<UP8<nK-`!-wEx$nYX`I5IXj]yq');
define('SECURE_AUTH_KEY',  'd.-_1,W/mo9Dei@^ +OJFEfQJx$]?)J;By9OHOhRBTfqH-F(m !$M3<0}y/ K<l!');
define('LOGGED_IN_KEY',    '=1T@MUW+j6~RH?i? 8S<1LOLQ<$|asDDU6GuH)8F]&^$>Qj<kvJO#[6.9_|N3AV`');
define('NONCE_KEY',        '2b7ks#P98.g2+/%#T,}^@=.`-hL2wkShr3%is`51^-os)+}Nd$F!gV*j>T<CWeAv');
define('AUTH_SALT',        'Z[<-lW3rzi)hN-mMV+np]Q8uv]C~%hy9&i0bA-}kxh/elSyW#UPa%9K|W0Nd:&ML');
define('SECURE_AUTH_SALT', 'hEbB <)({;i{T!|@1UJR*>V+LeBkIg<(9lcjdNxjjA |yoO;b{uo-?/Y~_`|C)nd');
define('LOGGED_IN_SALT',   '.D0t{}A,O3X-:6kt[ ?1^cP=y%n!f;{b8:`e6J u>3X-fSuSFYU@:[#WZhLR>4dv');
define('NONCE_SALT',       'H4T/XM]1$X@hr[B6G*ts#|v;)U+<?13@#Qj/*+gny6B~_lkKcUH8-pWO?}TP{[OX');
/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */
define( 'WP_CACHE', true);
define( 'WP_CACHE_KEY_SALT', 'wurrigon');
define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', 6379 );


/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', '/var/www/html/wordpress' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';