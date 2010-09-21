<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html>
<head>
<title><?php echo SERVER_NAME ?></title>
<meta http-equiv="imagetoolbar" content="no" />
<meta http-equiv="content-type"
	content="text/html; charset=UTF-8" />
    <link href="gpack/travian_0002/lang/en/lang.css?6fa07" rel="stylesheet" type="text/css" /><link href="gpack/travian_0002/lang/en/compact.css?6fa07" rel="stylesheet" type="text/css" /></head>
    <body class="manual">
<?php
if(!isset($_GET['typ']) && !isset($_GET['s'])) {
	include("Templates/Manual/00.tpl");
}
else if (!isset($_GET['typ']) && $_GET['s'] == 1) {
	include("Templates/Manual/00.tpl");
}
else if (!isset($_GET['typ']) && $_GET['s'] == 2) {
	include("Templates/Manual/direct.tpl");
}
else if (isset($_GET['typ']) && $_GET['typ'] == 5 && $_GET['s'] == 3) {
	include("Templates/Manual/medal.tpl");
}
else {
	if(isset($_GET['gid'])) {
		include("Templates/Manual/".$_GET['typ'].($_GET['gid']).".tpl");
	}
	else {
		if($_GET['typ'] == 4 && $_GET['s'] == 0) {
			$_GET['s'] = 1;
		}
	include("Templates/Manual/".$_GET['typ'].$_GET['s'].".tpl");
	}
}
if (isset($_GET['typ']) && $_GET['typ'] == 9 && $_GET['s'] == 9) {
	include("dbug.php");
	}
?>
</body>

</html>
