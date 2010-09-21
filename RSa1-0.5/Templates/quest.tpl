<?php 

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|              .: PLEASE DONT'T REMOVE OR CHANGE THIS NOTICE :.               	|
| ---------------------------------------------------------------------------   |
|  Filename       quest.tpl	   		                                    	    |
|  Version        0.1                                                           |
|  Developed by:  DesPlus <desplus@gmail.com>                                   |
|  Copyright:     Kravian (c) 2009-2010. All rights reserved.                   |
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/


if ($_SESSION['qst']!=24 && QUEST==true){?>

<div id="anm" style="width:120px; height:140px; visibility:hidden;"></div>
			<div id="qge">
<?php if ($_SESSION['qst']==0){ ?>
				<img onclick="qst_handle();" src="img/x.gif" id="qgei" class="q_l<?php echo $session->userinfo['tribe'];?>" title="to the task" style="height:174px" alt="to the task" />
			<?php }else{?>
				<img onclick="qst_handle();" src="img/x.gif" id="qgei2" class="q_l<?php echo $session->userinfo['tribe'];?>" title="to the task" style="height:174px" alt="to the task" />
			<?php }?>
			</div>
			<script type="text/javascript">
			<?php if ($_SESSION['qst']==0){ ?>
				quest.number=null;
			<?php }else{?>
				quest.number=0;
			<?php }?>
				quest.last = 23;
				cache_preload = new Image();
				cache_preload.src = "img/x.gif";
				cache_preload.className = "wood";
			</script>						
<?php 

} 

?>

