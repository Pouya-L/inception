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
 * * Localized language
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
define( 'DB_USER', 'wpuser' );

/** Database password */
define( 'DB_PASSWORD', 'wppassword' );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

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
define( 'AUTH_KEY',          'bN|sv]|CpE$=(h~0l9smx3 /E>(ZHcSTq99^TN*n`IqO<@2S?;meG.KE}@H!:o,~' );
define( 'SECURE_AUTH_KEY',   'WdUo.!:#>QBHRM(^xij8c+qXo^62xH~pyH(;C;&lsD?kw_4.3}06*_QAgq&pt{1G' );
define( 'LOGGED_IN_KEY',     '<+=e%#:I4|UaTNGfP2i+z>MCCP(^84I %N#nW,oe9]b^crkC=H4KO5>pt>.q?M>v' );
define( 'NONCE_KEY',         ']VP/*gTeeoS*Kq%/:7B4F;u,yU.pF%gS*Xu4Pr*62hV,Lo2G/WN8l*1:ydVr%,`V' );
define( 'AUTH_SALT',         'k Z5=X!iFel67z>~^vsKJ<v@O8{.vvlVARy*mbHGN?z{(6ete)6dWCKtLG(<R<7h' );
define( 'SECURE_AUTH_SALT',  '0Vsx`:q]&dLI*h]7qy)(Nh;ujZ59XGHy6hXtl&91s)Ub!)HSDm%xM$mtRsINjgc(' );
define( 'LOGGED_IN_SALT',    'lxMaM-{o,Y]Bw0xKob-xNd@Xpr8Q?8DK-3{j|u}}c6JeH~;V8x<5+BW]k%dV<rt!' );
define( 'NONCE_SALT',        '>uhZ&`duf?~phA bjaoO(Jy%f>$4l/aot42qrb>Yc$v&]S!nY}=E0fY9,{)?cwqn' );
define( 'WP_CACHE_KEY_SALT', 'f`!FR!5~*aMiW+I s4Fmx.a7|67&ix1%U!xUxCEdo#6$)j{NPVT4T@1?pvAC-2m;' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



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
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
