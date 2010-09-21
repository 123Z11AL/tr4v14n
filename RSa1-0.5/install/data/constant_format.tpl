<?php
################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 #
## --------------------------------------------------------------------------- #
##  Revision: 	   Installer Kravian 0.9.0 Beta 1                              #
##  Developed by:  scr1pt <scr1pt@2kdesign.es>                                 #
##  Revision       0.1                                                         #
##  License:       GNU LGPL v.3                                                #
##  Site:          http://www.2kdesign.es                                      #
##  Copyright:     Kravian (c) 2006-2010. All rights reserved.                 #
##                                                                             #
################################################################################

//
// Server Stats Defination
//
define("SERVER_NAME", "%SERVERNAME%");  // Server Name
define("COMMENCE",1270857599);          // Date/Time Start Unix format
define("LANG","%LANG%");                // Lang
define("SERVER_WEB_ROOT",false);        // Server at Root path
define("CFM_ADMIN_ACT",true);           // *No Defined
define("GP_ENABLE", %GP%);              // Graphic Pack Usage
define("COOKIE_EXPIRE", 60*60*24*7);    // 7 days by default
define("COOKIE_PATH", "/");             // Available in whole domain
define("SUBDOMAIN", %SUBDOM%);          // Is the server on a subdomain?
define("DBUG", false);

define("SHOW_NEWSBOX1", false);
define("SHOW_NEWSBOX2", false);
define("SHOW_NEWSBOX3", false);

//
// World definitions
//
define("AUTO_DEL_INACTIVE",%AUTOD%);    // Auto borrado de usuarios
define("UN_ACT_TIME", %AUTODT%);        // Tiempo para considerarse usuario inactivo
define("TRACK_USR", %UTRACK%);          // Track active Users?
define("USER_TIMEOUT",%UTOUT%);         // Tiempo max para considerar a un usuario inactivo in Minutes
define("ALLOW_BURST",false);
define("INIT_GOLD",50);
define("BASIC_MAX",1);
define("INNER_MAX",1);
define("PLUS_MAX",1);
define("ALLOW_ALL_TRIBE",false);
define("SPEED", %SPEED%);               //1 (Normal), 3 (3x Speed)
define("INCREASE_SPEED","%INCSPEED%");
define("WORLD_MAX", %MAX%);             //To put it simply. Eg 5, Max x = +/-5 y = +/-5
define("BATTLE_OPEN",false);			// True = Can atack, false Not

//Mp
define("WORD_CENSOR", %ACTCEN%);
define("CENSORED","Elmar, Horeca, Horeca-Spel, darkwarriors, MarMigs, jimjam32, G3n3s!s, %CENWORDS%");        //Sperate by ,
//

//
// Logs
//
define("LOG_BUILD",%LOGBUILD%);
define("LOG_TECH",%LOGTECH%);
define("LOG_LOGIN",%LOGLOGIN%);
define("LOG_GOLD_FIN",%LOGGOLDFIN%);
define("LOG_ADMIN",%LOGADMIN%);
define("LOG_WAR",%LOGWAR%);
define("LOG_MARKET",%LOGMARKET%);
define("LOG_ILLEGAL",%LOGILLEGAL%);

//
// SQL Server Defination
//
define("SQL_SERVER", "%SSERVER%");
define("SQL_USER", "%SUSER%");
define("SQL_PASS", "%SPASS%");
define("SQL_DB", "%SDB%");
define("TB_PREFIX", "%PREFIX%");
define("DB_TYPE", %CONNECTT%); 			// 0 = MYSQL, 1 = MYSQLi

//
// User Related Defination
//
define("USRNM_SPECIAL",%SPECIALCHARS%);     // Permitir caracteres especiales
define("USRNM_MIN_LENGTH",%MINUSERLENGTH%); // Longitud minima para el nombre de usuario
define("PW_MIN_LENGTH",%MINPASSLENGTH%);    // Longitud mínima para la contraseña
define("AUTH_EMAIL",%ACTIVATE%);            // Activacion de la cuenta
define("LIMIT_MAILBOX",true);				// *No Defined
define("MAX_MAIL",30);						// *No Defined

//
// Game Definitions
//
define("DEMOLISH_LEVEL_REQ",10);
define("QUEST",true); // Acitve/Inactive quest for newbie players

//
// Alliance Definitios
//
define("PURGE_ALLI_LOG",1); 				// Permitir la purga de ali_log cuando la alli es eliminada

//
//User Access Defination
//
define("BANNED",0);
define("AUTH",1);
define("USER",2);
define("PLUS", 3);
define("MODERATOR",8);
define("ADMIN",9);

//
//Admin Email Defination
//
define("ADMIN_NAME", "%ANAME%");
define("ADMIN_EMAIL", "%AEMAIL%");
define("INCLUDE_ADMIN", %ARANK%); 		//Include admin on ranking?
?>