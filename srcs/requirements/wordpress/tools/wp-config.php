<?php
define('WP_CACHE_KEY_SALT', 'wurrigon.42.fr');
define('WP_CACHE', true);
define('DB_NAME', 'wordpress');
define('DB_USER', 'wurrigon');
define('DB_PASSWORD', 'superroot');
define('DB_HOST', 'mariadb');
define('DB_CHARSET', 'utf8');

define('DB_COLLATE', '');
define('AUTH_KEY',         'i)ly+kx]g0,yo^i6x,o)`PgwNl(t!+|;5--b-W[>4|I%iJef%Xz_D`O-`k[?cxk(');
define('SECURE_AUTH_KEY',  'hbJH?k+p*)OSWBN |e(5-3];XFu_.?:Jc$-]$tkq%4TI.>(v%;!yYT3| B^lZWJw');
define('LOGGED_IN_KEY',    'BWckE+ko]=xk`h6WYACAyWIk(WP.<2M_D~-;zZ[_&XXs1#Tq;2y[.|LqFo$Xv9!K');
define('NONCE_KEY',        '*QQr-`f7H7]:</ WdOX$`Kl-j?ay{nO]phV]PH6aQ+E+J]#+ZBJp!_iv#vuV+g4/');
define('AUTH_SALT',        'WPCcX^Ea0,P2[g(9xDrX!pS3@v6V/VP_s1,SRboO&Ct9ghDjg#N. ITmj:$Z48+H');
define('SECURE_AUTH_SALT', 'dn@v-TaFGuciTER,!i:;OfgZ--bmlLjlsHZ]`4*KC^MPPtw$vMudUOjQ=I@s6-6&');
define('LOGGED_IN_SALT',   '84$k~q/#aS(`.7UGwMxYm*+0D xxoC0jY+@`9#O<]mAfz/&qy;7d1v]FMmD/T?(8');
define('NONCE_SALT',       '{{&Kw83DxgaRjVGG2Zryt5>I<eUD}J%>W|/EA<OOB{2b!-o=.Fp*hf/aavD]Yz!i');

$table_prefix = 'wp_';

define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);

if (!defined('ABSPATH'))
	define('ABSPATH', '/var/www/wordpress');

require_once(ABSPATH . 'wp-settings.php');