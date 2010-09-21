-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Machine: localhost
-- Genereertijd: 18 Sept 2010 om 03:33
-- Serverversie: 5.0.91
-- PHP-Versie: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tr4v14n_speed`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%abdata`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%abdata` (
  `vref` int(10) unsigned NOT NULL auto_increment,
  `a1` tinyint(2) unsigned NOT NULL default '0',
  `a2` tinyint(2) unsigned NOT NULL default '0',
  `a3` tinyint(2) unsigned NOT NULL default '0',
  `a4` tinyint(2) unsigned NOT NULL default '0',
  `a5` tinyint(2) unsigned NOT NULL default '0',
  `a6` tinyint(2) unsigned NOT NULL default '0',
  `a7` tinyint(2) unsigned NOT NULL default '0',
  `a8` tinyint(2) unsigned NOT NULL default '0',
  `b1` tinyint(2) unsigned NOT NULL default '0',
  `b2` tinyint(2) unsigned NOT NULL default '0',
  `b3` tinyint(2) unsigned NOT NULL default '0',
  `b4` tinyint(2) unsigned NOT NULL default '0',
  `b5` tinyint(2) unsigned NOT NULL default '0',
  `b6` tinyint(2) unsigned NOT NULL default '0',
  `b7` tinyint(2) unsigned NOT NULL default '0',
  `b8` tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vref`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%abdata`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%active`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%active` (
  `username` varchar(15) NOT NULL,
  `timestamp` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%active`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%alidata`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%alidata` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(25) NOT NULL,
  `tag` varchar(8) NOT NULL,
  `leader` int(10) unsigned NOT NULL,
  `coor` int(10) unsigned NOT NULL,
  `advisor` int(10) unsigned NOT NULL,
  `recruiter` int(10) unsigned NOT NULL,
  `notice` text NOT NULL,
  `desc` text NOT NULL,
  `max` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%alidata`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%ali_invite`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%ali_invite` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `alliance` int(10) unsigned NOT NULL,
  `sender` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `accept` int(1) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%ali_invite`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%ali_log`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%ali_log` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `aid` int(10) NOT NULL,
  `comment` text NOT NULL,
  `date` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%ali_log`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%ali_permission`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%ali_permission` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `alliance` int(10) unsigned NOT NULL,
  `rank` varchar(20) NOT NULL,
  `opt1` int(1) unsigned NOT NULL default '0',
  `opt2` int(1) unsigned NOT NULL default '0',
  `opt3` int(1) unsigned NOT NULL default '0',
  `opt4` int(1) unsigned NOT NULL default '0',
  `opt5` int(1) unsigned NOT NULL default '0',
  `opt6` int(1) unsigned NOT NULL default '0',
  `opt7` int(1) unsigned NOT NULL default '0',
  `opt8` int(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%ali_permission`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%bdata`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%bdata` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `wid` int(10) unsigned NOT NULL,
  `field` tinyint(2) unsigned NOT NULL,
  `type` tinyint(2) unsigned NOT NULL,
  `loopcon` tinyint(1) unsigned NOT NULL,
  `timestamp` int(10) unsigned NOT NULL,
  `action` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%bdata`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%build_log`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%build_log` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `wid` int(10) unsigned NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%build_log`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%chat`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%chat` (
  `id` int(20) unsigned NOT NULL auto_increment,
  `id_user` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alli` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%chat`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%deleting`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%deleting` (
  `uid` int(10) unsigned NOT NULL,
  `timestamp` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%deleting`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%demolition`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%demolition` (
  `vref` int(10) unsigned NOT NULL auto_increment,
  `buildnumber` int(10) unsigned NOT NULL default '0',
  `lvl` int(10) unsigned NOT NULL default '0',
  `timetofinish` int(11) NOT NULL,
  PRIMARY KEY  (`vref`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%demolition`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%diplomacy`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%diplomacy` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `alli1` int(10) unsigned NOT NULL,
  `alli2` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%diplomacy`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%enforcement`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%enforcement` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `u1` int(11) unsigned NOT NULL default '0',
  `u2` int(11) unsigned NOT NULL default '0',
  `u3` int(11) unsigned NOT NULL default '0',
  `u4` int(11) unsigned NOT NULL default '0',
  `u5` int(11) unsigned NOT NULL default '0',
  `u6` int(11) unsigned NOT NULL default '0',
  `u7` int(11) unsigned NOT NULL default '0',
  `u8` int(11) unsigned NOT NULL default '0',
  `u9` int(11) unsigned NOT NULL default '0',
  `u10` int(11) unsigned NOT NULL default '0',
  `u11` int(11) unsigned NOT NULL default '0',
  `u12` int(11) unsigned NOT NULL default '0',
  `u13` int(11) unsigned NOT NULL default '0',
  `u14` int(11) unsigned NOT NULL default '0',
  `u15` int(11) unsigned NOT NULL default '0',
  `u16` int(11) unsigned NOT NULL default '0',
  `u17` int(11) unsigned NOT NULL default '0',
  `u18` int(11) unsigned NOT NULL default '0',
  `u19` int(11) unsigned NOT NULL default '0',
  `u20` int(11) unsigned NOT NULL default '0',
  `u21` int(11) unsigned NOT NULL default '0',
  `u22` int(11) unsigned NOT NULL default '0',
  `u23` int(11) unsigned NOT NULL default '0',
  `u24` int(11) unsigned NOT NULL default '0',
  `u25` int(11) unsigned NOT NULL default '0',
  `u26` int(11) unsigned NOT NULL default '0',
  `u27` int(11) unsigned NOT NULL default '0',
  `u28` int(11) unsigned NOT NULL default '0',
  `u29` int(11) unsigned NOT NULL default '0',
  `u30` int(11) unsigned NOT NULL default '0',
  `u31` int(11) unsigned NOT NULL default '0',
  `u32` int(11) unsigned NOT NULL default '0',
  `u33` int(11) unsigned NOT NULL default '0',
  `u34` int(11) unsigned NOT NULL default '0',
  `u35` int(11) unsigned NOT NULL default '0',
  `u36` int(11) unsigned NOT NULL default '0',
  `u37` int(11) unsigned NOT NULL default '0',
  `u38` int(11) unsigned NOT NULL default '0',
  `u39` int(11) unsigned NOT NULL default '0',
  `u40` int(11) unsigned NOT NULL default '0',
  `u41` int(11) unsigned NOT NULL default '0',
  `u42` int(11) unsigned NOT NULL default '0',
  `u43` int(11) unsigned NOT NULL default '0',
  `u44` int(11) unsigned NOT NULL default '0',
  `u45` int(11) unsigned NOT NULL default '0',
  `u46` int(11) unsigned NOT NULL default '0',
  `u47` int(11) unsigned NOT NULL default '0',
  `u48` int(11) unsigned NOT NULL default '0',
  `u49` int(11) unsigned NOT NULL default '0',
  `u50` int(11) unsigned NOT NULL default '0',
  `from` int(10) unsigned NOT NULL default '0',
  `vref` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%enforcement`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%fdata`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%fdata` (
  `vref` int(10) unsigned NOT NULL,
  `f1` tinyint(2) unsigned NOT NULL default '0',
  `f1t` tinyint(2) unsigned NOT NULL default '0',
  `f2` tinyint(2) unsigned NOT NULL default '0',
  `f2t` tinyint(2) unsigned NOT NULL default '0',
  `f3` tinyint(2) unsigned NOT NULL default '0',
  `f3t` tinyint(2) unsigned NOT NULL default '0',
  `f4` tinyint(2) unsigned NOT NULL default '0',
  `f4t` tinyint(2) unsigned NOT NULL default '0',
  `f5` tinyint(2) unsigned NOT NULL default '0',
  `f5t` tinyint(2) unsigned NOT NULL default '0',
  `f6` tinyint(2) unsigned NOT NULL default '0',
  `f6t` tinyint(2) unsigned NOT NULL default '0',
  `f7` tinyint(2) unsigned NOT NULL default '0',
  `f7t` tinyint(2) unsigned NOT NULL default '0',
  `f8` tinyint(2) unsigned NOT NULL default '0',
  `f8t` tinyint(2) unsigned NOT NULL default '0',
  `f9` tinyint(2) unsigned NOT NULL default '0',
  `f9t` tinyint(2) unsigned NOT NULL default '0',
  `f10` tinyint(2) unsigned NOT NULL default '0',
  `f10t` tinyint(2) unsigned NOT NULL default '0',
  `f11` tinyint(2) unsigned NOT NULL default '0',
  `f11t` tinyint(2) unsigned NOT NULL default '0',
  `f12` tinyint(2) unsigned NOT NULL default '0',
  `f12t` tinyint(2) unsigned NOT NULL default '0',
  `f13` tinyint(2) unsigned NOT NULL default '0',
  `f13t` tinyint(2) unsigned NOT NULL default '0',
  `f14` tinyint(2) unsigned NOT NULL default '0',
  `f14t` tinyint(2) unsigned NOT NULL default '0',
  `f15` tinyint(2) unsigned NOT NULL default '0',
  `f15t` tinyint(2) unsigned NOT NULL default '0',
  `f16` tinyint(2) unsigned NOT NULL default '0',
  `f16t` tinyint(2) unsigned NOT NULL default '0',
  `f17` tinyint(2) unsigned NOT NULL default '0',
  `f17t` tinyint(2) unsigned NOT NULL default '0',
  `f18` tinyint(2) unsigned NOT NULL default '0',
  `f18t` tinyint(2) unsigned NOT NULL default '0',
  `f19` tinyint(2) unsigned NOT NULL default '0',
  `f19t` tinyint(2) unsigned NOT NULL default '0',
  `f20` tinyint(2) unsigned NOT NULL default '0',
  `f20t` tinyint(2) unsigned NOT NULL default '0',
  `f21` tinyint(2) unsigned NOT NULL default '0',
  `f21t` tinyint(2) unsigned NOT NULL default '0',
  `f22` tinyint(2) unsigned NOT NULL default '0',
  `f22t` tinyint(2) unsigned NOT NULL default '0',
  `f23` tinyint(2) unsigned NOT NULL default '0',
  `f23t` tinyint(2) unsigned NOT NULL default '0',
  `f24` tinyint(2) unsigned NOT NULL default '0',
  `f24t` tinyint(2) unsigned NOT NULL default '0',
  `f25` tinyint(2) unsigned NOT NULL default '0',
  `f25t` tinyint(2) unsigned NOT NULL default '0',
  `f26` tinyint(2) unsigned NOT NULL default '0',
  `f26t` tinyint(2) unsigned NOT NULL default '0',
  `f27` tinyint(2) unsigned NOT NULL default '0',
  `f27t` tinyint(2) unsigned NOT NULL default '0',
  `f28` tinyint(2) unsigned NOT NULL default '0',
  `f28t` tinyint(2) unsigned NOT NULL default '0',
  `f29` tinyint(2) unsigned NOT NULL default '0',
  `f29t` tinyint(2) unsigned NOT NULL default '0',
  `f30` tinyint(2) unsigned NOT NULL default '0',
  `f30t` tinyint(2) unsigned NOT NULL default '0',
  `f31` tinyint(2) unsigned NOT NULL default '0',
  `f31t` tinyint(2) unsigned NOT NULL default '0',
  `f32` tinyint(2) unsigned NOT NULL default '0',
  `f32t` tinyint(2) unsigned NOT NULL default '0',
  `f33` tinyint(2) unsigned NOT NULL default '0',
  `f33t` tinyint(2) unsigned NOT NULL default '0',
  `f34` tinyint(2) unsigned NOT NULL default '0',
  `f34t` tinyint(2) unsigned NOT NULL default '0',
  `f35` tinyint(2) unsigned NOT NULL default '0',
  `f35t` tinyint(2) unsigned NOT NULL default '0',
  `f36` tinyint(2) unsigned NOT NULL default '0',
  `f36t` tinyint(2) unsigned NOT NULL default '0',
  `f37` tinyint(2) unsigned NOT NULL default '0',
  `f37t` tinyint(2) unsigned NOT NULL default '0',
  `f38` tinyint(2) unsigned NOT NULL default '0',
  `f38t` tinyint(2) unsigned NOT NULL default '0',
  `f39` tinyint(2) unsigned NOT NULL default '0',
  `f39t` tinyint(2) unsigned NOT NULL default '0',
  `f40` tinyint(2) unsigned NOT NULL default '0',
  `f40t` tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vref`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%fdata`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%gold_fin_log`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%gold_fin_log` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `wid` int(10) unsigned NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%gold_fin_log`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%illegal_log`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%illegal_log` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user` int(10) unsigned NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%illegal_log`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%login_log`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%login_log` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%login_log`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%market`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%market` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `vref` int(11) unsigned NOT NULL,
  `gtype` tinyint(1) unsigned NOT NULL,
  `gamt` int(11) unsigned NOT NULL,
  `wtype` tinyint(1) unsigned NOT NULL,
  `wamt` int(11) unsigned NOT NULL,
  `accept` tinyint(1) unsigned NOT NULL,
  `maxtime` int(11) unsigned NOT NULL,
  `alliance` int(11) unsigned NOT NULL,
  `merchant` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%market`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%market_log`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%market_log` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `wid` int(10) unsigned NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%market_log`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%mdata`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%mdata` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `target` int(10) unsigned NOT NULL,
  `owner` int(10) unsigned NOT NULL,
  `topic` varchar(45) NOT NULL,
  `message` text NOT NULL,
  `viewed` tinyint(1) unsigned NOT NULL,
  `archived` tinyint(1) unsigned NOT NULL,
  `send` tinyint(1) unsigned NOT NULL,
  `time` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%mdata`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%movement`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%movement` (
  `moveid` int(10) unsigned NOT NULL auto_increment,
  `type` tinyint(4) unsigned NOT NULL default '0',
  `from` int(11) unsigned NOT NULL default '0',
  `to` int(11) unsigned NOT NULL default '0',
  `ref` int(11) unsigned NOT NULL default '0',
  `endtime` int(11) unsigned NOT NULL default '0',
  `proc` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`moveid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%movement`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%ndata`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%ndata` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `type` tinyint(1) unsigned NOT NULL default '0',
  `receiver` int(11) unsigned NOT NULL default '0',
  `topic` text NOT NULL,
  `from_village` int(11) unsigned NOT NULL default '0',
  `from_user` int(11) unsigned NOT NULL default '0',
  `to_village` int(11) unsigned NOT NULL default '0',
  `to_user` int(11) unsigned NOT NULL default '0',
  `time` int(11) unsigned NOT NULL default '0',
  `message` text NOT NULL,
  `viewed` int(1) unsigned NOT NULL default '0',
  `archive` tinyint(1) unsigned NOT NULL default '0',
  `in_group` int(11) unsigned NOT NULL default '0',
  `ally` int(11) unsigned NOT NULL default '0',
  `ally_name` varchar(25) NOT NULL,
  `a1_units` varchar(350) NOT NULL,
  `b1_units` varchar(350) NOT NULL,
  `a2_units` varchar(350) NOT NULL,
  `b2_units` varchar(350) NOT NULL,
  `buildings` varchar(350) NOT NULL,
  `luck` varchar(6) NOT NULL default '0',
  `moral` int(6) unsigned NOT NULL default '0',
  `wins` varchar(15) NOT NULL,
  `steal` varchar(100) NOT NULL,
  `see_def_units` int(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `receiver` (`receiver`),
  KEY `group` (`in_group`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%ndata`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%odata`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%odata` (
  `wref` int(10) unsigned NOT NULL,
  `type` tinyint(2) unsigned NOT NULL,
  `conqured` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`wref`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%odata`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%research`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%research` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `vref` int(10) unsigned NOT NULL,
  `tech` varchar(3) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%research`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%send`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%send` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `wood` int(11) unsigned NOT NULL,
  `clay` int(11) unsigned NOT NULL,
  `iron` int(11) unsigned NOT NULL,
  `crop` int(11) unsigned NOT NULL,
  `merchant` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%send`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%statistics`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%statistics` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `timestamp` int(10) unsigned NOT NULL,
  `users` int(11) unsigned NOT NULL default '0',
  `villages` int(11) unsigned NOT NULL default '0',
  `wood` int(11) unsigned NOT NULL default '0',
  `clay` int(11) unsigned NOT NULL default '0',
  `iron` int(11) unsigned NOT NULL default '0',
  `crop` int(11) unsigned NOT NULL default '0',
  `pop` int(11) unsigned NOT NULL default '0',
  `market` int(11) unsigned NOT NULL default '0',
  `messages` int(11) unsigned NOT NULL default '0',
  `attacks` int(11) unsigned NOT NULL default '0',
  `u1` int(11) unsigned NOT NULL default '0',
  `u2` int(11) unsigned NOT NULL default '0',
  `u3` int(11) unsigned NOT NULL default '0',
  `u4` int(11) unsigned NOT NULL default '0',
  `u5` int(11) unsigned NOT NULL default '0',
  `u6` int(11) unsigned NOT NULL default '0',
  `u7` int(11) unsigned NOT NULL default '0',
  `u8` int(11) unsigned NOT NULL default '0',
  `u9` int(11) unsigned NOT NULL default '0',
  `u10` int(11) unsigned NOT NULL default '0',
  `u11` int(11) unsigned NOT NULL default '0',
  `u12` int(11) unsigned NOT NULL default '0',
  `u13` int(11) unsigned NOT NULL default '0',
  `u14` int(11) unsigned NOT NULL default '0',
  `u15` int(11) unsigned NOT NULL default '0',
  `u16` int(11) unsigned NOT NULL default '0',
  `u17` int(11) unsigned NOT NULL default '0',
  `u18` int(11) unsigned NOT NULL default '0',
  `u19` int(11) unsigned NOT NULL default '0',
  `u20` int(11) unsigned NOT NULL default '0',
  `u21` int(11) unsigned NOT NULL default '0',
  `u22` int(11) unsigned NOT NULL default '0',
  `u23` int(11) unsigned NOT NULL default '0',
  `u24` int(11) unsigned NOT NULL default '0',
  `u25` int(11) unsigned NOT NULL default '0',
  `u26` int(11) unsigned NOT NULL default '0',
  `u27` int(11) unsigned NOT NULL default '0',
  `u28` int(11) unsigned NOT NULL default '0',
  `u29` int(11) unsigned NOT NULL default '0',
  `u30` int(11) unsigned NOT NULL default '0',
  `u31` int(11) unsigned NOT NULL default '0',
  `u32` int(11) unsigned NOT NULL default '0',
  `u33` int(11) unsigned NOT NULL default '0',
  `u34` int(11) unsigned NOT NULL default '0',
  `u35` int(11) unsigned NOT NULL default '0',
  `u36` int(11) unsigned NOT NULL default '0',
  `u37` int(11) unsigned NOT NULL default '0',
  `u38` int(11) unsigned NOT NULL default '0',
  `u39` int(11) unsigned NOT NULL default '0',
  `u40` int(11) unsigned NOT NULL default '0',
  `u41` int(11) unsigned NOT NULL default '0',
  `u42` int(11) unsigned NOT NULL default '0',
  `u43` int(11) unsigned NOT NULL default '0',
  `u44` int(11) unsigned NOT NULL default '0',
  `u45` int(11) unsigned NOT NULL default '0',
  `u46` int(11) unsigned NOT NULL default '0',
  `u47` int(11) unsigned NOT NULL default '0',
  `u48` int(11) unsigned NOT NULL default '0',
  `u49` int(11) unsigned NOT NULL default '0',
  `u50` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%statistics`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%tdata`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%tdata` (
  `vref` int(10) unsigned NOT NULL,
  `t2` tinyint(1) unsigned NOT NULL default '0',
  `t3` tinyint(1) unsigned NOT NULL default '0',
  `t4` tinyint(1) unsigned NOT NULL default '0',
  `t5` tinyint(1) unsigned NOT NULL default '0',
  `t6` tinyint(1) unsigned NOT NULL default '0',
  `t7` tinyint(1) unsigned NOT NULL default '0',
  `t8` tinyint(1) unsigned NOT NULL default '0',
  `t9` tinyint(1) unsigned NOT NULL default '0',
  `t12` tinyint(1) unsigned NOT NULL default '0',
  `t13` tinyint(1) unsigned NOT NULL default '0',
  `t14` tinyint(1) unsigned NOT NULL default '0',
  `t15` tinyint(1) unsigned NOT NULL default '0',
  `t16` tinyint(1) unsigned NOT NULL default '0',
  `t17` tinyint(1) unsigned NOT NULL default '0',
  `t18` tinyint(1) unsigned NOT NULL default '0',
  `t19` tinyint(1) unsigned NOT NULL default '0',
  `t22` tinyint(1) unsigned NOT NULL default '0',
  `t23` tinyint(1) unsigned NOT NULL default '0',
  `t24` tinyint(1) unsigned NOT NULL default '0',
  `t25` tinyint(1) unsigned NOT NULL default '0',
  `t26` tinyint(1) unsigned NOT NULL default '0',
  `t27` tinyint(1) unsigned NOT NULL default '0',
  `t28` tinyint(1) unsigned NOT NULL default '0',
  `t29` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vref`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%tdata`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%tech_log`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%tech_log` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `wid` int(10) unsigned NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%tech_log`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%training`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%training` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `vref` int(10) unsigned NOT NULL,
  `unit` tinyint(2) unsigned NOT NULL,
  `amt` int(10) unsigned NOT NULL,
  `pop` int(10) unsigned NOT NULL,
  `timestamp` int(10) unsigned NOT NULL,
  `eachtime` int(10) unsigned NOT NULL,
  `commence` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%training`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%units`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%units` (
  `vref` int(10) unsigned NOT NULL,
  `u1` int(11) unsigned NOT NULL default '0',
  `u2` int(11) unsigned NOT NULL default '0',
  `u3` int(11) unsigned NOT NULL default '0',
  `u4` int(11) unsigned NOT NULL default '0',
  `u5` int(11) unsigned NOT NULL default '0',
  `u6` int(11) unsigned NOT NULL default '0',
  `u7` int(11) unsigned NOT NULL default '0',
  `u8` int(11) unsigned NOT NULL default '0',
  `u9` int(11) unsigned NOT NULL default '0',
  `u10` int(11) unsigned NOT NULL default '0',
  `u11` int(11) unsigned NOT NULL default '0',
  `u12` int(11) unsigned NOT NULL default '0',
  `u13` int(11) unsigned NOT NULL default '0',
  `u14` int(11) unsigned NOT NULL default '0',
  `u15` int(11) unsigned NOT NULL default '0',
  `u16` int(11) unsigned NOT NULL default '0',
  `u17` int(11) unsigned NOT NULL default '0',
  `u18` int(11) unsigned NOT NULL default '0',
  `u19` int(11) unsigned NOT NULL default '0',
  `u20` int(11) unsigned NOT NULL default '0',
  `u21` int(11) unsigned NOT NULL default '0',
  `u22` int(11) unsigned NOT NULL default '0',
  `u23` int(11) unsigned NOT NULL default '0',
  `u24` int(11) unsigned NOT NULL default '0',
  `u25` int(11) unsigned NOT NULL default '0',
  `u26` int(11) unsigned NOT NULL default '0',
  `u27` int(11) unsigned NOT NULL default '0',
  `u28` int(11) unsigned NOT NULL default '0',
  `u29` int(11) unsigned NOT NULL default '0',
  `u30` int(11) unsigned NOT NULL default '0',
  `u31` int(11) unsigned NOT NULL default '0',
  `u32` int(11) unsigned NOT NULL default '0',
  `u33` int(11) unsigned NOT NULL default '0',
  `u34` int(11) unsigned NOT NULL default '0',
  `u35` int(11) unsigned NOT NULL default '0',
  `u36` int(11) unsigned NOT NULL default '0',
  `u37` int(11) unsigned NOT NULL default '0',
  `u38` int(11) unsigned NOT NULL default '0',
  `u39` int(11) unsigned NOT NULL default '0',
  `u40` int(11) unsigned NOT NULL default '0',
  `u41` int(11) unsigned NOT NULL default '0',
  `u42` int(11) unsigned NOT NULL default '0',
  `u43` int(11) unsigned NOT NULL default '0',
  `u44` int(11) unsigned NOT NULL default '0',
  `u45` int(11) unsigned NOT NULL default '0',
  `u46` int(11) unsigned NOT NULL default '0',
  `u47` int(11) unsigned NOT NULL default '0',
  `u48` int(11) unsigned NOT NULL default '0',
  `u49` int(11) unsigned NOT NULL default '0',
  `u50` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vref`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%units`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%users`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%users` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` text NOT NULL,
  `tribe` tinyint(1) unsigned NOT NULL,
  `access` tinyint(1) unsigned NOT NULL default '1',
  `gold` tinyint(4) unsigned NOT NULL default '0',
  `gender` tinyint(1) unsigned NOT NULL default '0',
  `birthday` date NOT NULL default '0000-00-00',
  `location` text NOT NULL,
  `desc1` text NOT NULL,
  `desc2` text NOT NULL,
  `plus` int(10) unsigned NOT NULL default '0',
  `b1` int(10) unsigned NOT NULL default '0',
  `b2` int(10) unsigned NOT NULL default '0',
  `b3` int(10) unsigned NOT NULL default '0',
  `b4` int(10) unsigned NOT NULL default '0',
  `sit1` int(10) unsigned NOT NULL default '0',
  `sit2` int(10) unsigned NOT NULL default '0',
  `alliance` int(10) unsigned NOT NULL default '0',
  `sessid` varchar(45) NOT NULL,
  `act` varchar(10) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL default '0',
  `ap` int(10) unsigned NOT NULL default '0',
  `dp` int(10) unsigned NOT NULL default '0',
  `protect` int(10) unsigned NOT NULL,
  `banned` tinyint(1) unsigned NOT NULL default '0',
  `quest` tinyint(2) unsigned NOT NULL,
  `gpack` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%users`
--

INSERT INTO `%PREFIX%users` (`id`, `username`) VALUES
(0, 'support');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%vdata`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%vdata` (
  `wref` int(10) unsigned NOT NULL,
  `owner` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `capital` tinyint(1) unsigned NOT NULL,
  `pop` int(10) unsigned NOT NULL,
  `cp` int(10) unsigned NOT NULL,
  `wood` float(12,2) NOT NULL,
  `clay` float(12,2) NOT NULL,
  `iron` float(12,2) NOT NULL,
  `maxstore` int(10) unsigned NOT NULL,
  `crop` float(12,2) NOT NULL,
  `maxcrop` int(10) unsigned NOT NULL,
  `lastupdate` int(11) unsigned NOT NULL,
  `fealthy` int(6) unsigned NOT NULL default '100',
  PRIMARY KEY  (`wref`),
  KEY `wref` (`wref`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%vdata`
--


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `%PREFIX%wdata`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%wdata` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `fieldtype` tinyint(2) unsigned NOT NULL,
  `oasistype` tinyint(2) unsigned NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `occupied` tinyint(1) unsigned NOT NULL,
  `image` varchar(3) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `%PREFIX%wdata`
--

