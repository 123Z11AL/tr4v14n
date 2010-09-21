<?php
$configfile = 'engine/config.php';
if (!file_exists($configfile)){
echo "Don`t exists config.php, install de aplication";
}else{
include("engine/account.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
 
<html> 
	<head> 
		<title><?php echo SERVER_NAME; ?></title> 
		<meta name="content-language" content="en" /> 
		<meta http-equiv="cache-control" content="max-age=0" /> 
		<meta http-equiv="imagetoolbar" content="no" /> 
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" /> 
				<script src="mt-full.js?94761"  type="text/javascript"></script> 
		<script src="unx.js?94761" type="text/javascript"></script> 
		<script src="new.js?94761" type="text/javascript"></script> 
		<link href="gpack/travian_basic/lang/en/compact.css?94761" rel="stylesheet" type="text/css" /> 
<link href="gpack/travian_basic/lang/en/lang.css?94761" rel="stylesheet" type="text/css" /> 
<link href="gpack/travian_redesign/travian.css?94761" rel="stylesheet" type="text/css" /> 
<link href="gpack/travian_redesign/lang/en/lang.css?94761" rel="stylesheet" type="text/css" /> 
			</head> 
 
	<body class="v35 webkit" onload="initCounter()"> 
		<div class="wrapper"> 
						<div id="dynamic_header"> 
							</div> 
 
			<div id="header"></div> 
 
			<div id="mid"> 
<?php include("Templates/menu.tpl"); ?>
				<div id="content"  class="error_site"><img class="e404" src="img/x.gif" alt="Nothing here!" style="position:absolute;top:60px;left:55px;" /> 
<div style="position:absolute;top:0px;left:30px;"><h1>Nothing here!</h1></div> 
<div style="position:absolute;top:235px;left:30px;z-index:15;">We looked 404 times already but can't find anything</div> 
<img src="img/x.gif" style="height:330px;width:1px;" /> 
				</div> 
				<div id="side_info" class="outgame"> 
<?php
if(SHOW_NEWSBOX1) { include("Templates/News/newsbox1.tpl"); }
if(SHOW_NEWSBOX2) { include("Templates/News/newsbox2.tpl"); }
if(SHOW_NEWSBOX3) { include("Templates/News/newsbox3.tpl"); }

?>
											</div> 
 
				<div class="clear"></div> 
			</div> 
 
			<div class="footer-stopper outgame"></div> 
			<div class="clear"></div> 
<?php include("Templates/footer.tpl"); ?>
		<div id="ce"></div> 
			</div> 
	</body> 
</html>
<?php
}
?>