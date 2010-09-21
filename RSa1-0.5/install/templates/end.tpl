<?php
$text = file_get_contents("include/constant.php");
$text = preg_replace("'//%REPLACE%'",'',$text);
$myFile = "include/constant.php";
$fh = fopen($myFile, 'w') or die("can't open file");
fwrite($fh,$text);
fclose($fh);
copy("include/constant.php","../engine/config.php");
unlink("include/constant.php");
$rand = md5(rand(1,10));
rename("index.php","$rand");
?>
<div class="headline"><span class="f16 c5">Travian Clone Installation Script Ended</span></div><br>
<br>
    <h4>Please remove/rename install or the installation folder.</h4>
  
<div class="lbox">-Kravian Creation Team.</div>
