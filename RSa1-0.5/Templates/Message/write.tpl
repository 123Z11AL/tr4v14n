<div id="content"  class="messages">
<h1>Messages</h1>
<?php 
include("menu.tpl");
?>
<script language="JavaScript" type="text/javascript">
		function setReceiver(name) {
			document.getElementById('receiver').value = name;
			copyElement('receiver');
		}

		function closeFriendsList() {
			document.getElementById('adressbook').className = 'hide';
		}

		function toggleFriendsList() {
			var book = document.getElementById('adressbook');
			if (book.className == 'hide')
				book.className = '';
			else
				book.className = 'hide';
		}

		function copyElement(element) {
			if (element == 'receiver') {
				document.getElementById('copy_receiver').value = document.getElementById('receiver').value;
			} else if (element == 'subject') {
				document.getElementById('copy_subject').value = document.getElementById('subject').value;
			} else if (element == 'body') {
				document.getElementById('copy_igm').value = document.getElementById('message').value;
			}
		}

		function submitDefault (type,uid) {
			var book = document.abform;
			book.sbmtype.value = type;
			book.sbmvalue.value = uid;
			book.submit();
		}

	</script>
<div id="write_head" class="msg_head"></div>
<div id="write_content" class="msg_content">
	<form method="post" action="nachrichten.php" accept-charset="UTF-8" name="msg">
	<input type="hidden" name="c" value="3e9" />
	<input type="hidden" name="p" value="">
	<input type="hidden" name="ft" value="m2" />
	<input type="hidden" name="a" value="3e9" />
 <input type="hidden" id="copy_receiver" name="copy_receiver" value="" />
 <input type="hidden" id="copy_subject" name="copy_subject" value="" />
 <input type="hidden" id="copy_igm" name="copy_igm" value="" />
 <input type="hidden" name="sbmtype" value="default" />
 <input type="hidden" name="sbmvalue" value="" />
		<img src="img/x.gif" id="label" class="send" alt="">
	<div id="heading">
		<input class="text" type="text" name="an" id="receiver" value="<?php if(isset($id)) { echo $database->getUserField($id,'username',0); } ?>" maxlength="20" onkeyup="copyElement('receiver')" tabindex="1;"><br>
		<input class="text" type="text" name="be" id="subject" value="<?php if(isset($message->reply['topic'])) { echo "Re:".$message->reply['topic']; } ?>" maxlength="35" onkeyup="copyElement('subject')" tabindex="2;">
	</div>
<a id="adbook" href="#" onclick="toggleFriendsList(); return false;"><img src="img/x.gif" alt="Addressbook" title="Addressbook"></a>
<div class="clear"></div>
<div class="line"></div>
	
			<div bbarea="message" id="message_container" name="message_container">
				<div id="message_toolbar" name="message_toolbar">
					<a href="javascript:void(0);" bbtype="d" bbtag="b"><div title="bold" alt="bold" class="bbButton bbBold"></div></a>
					<a href="javascript:void(0);" bbtype="d" bbtag="i"><div title="italic" alt="italic" class="bbButton bbItalic"></div></a>
					<a href="javascript:void(0);" bbtype="d" bbtag="u"><div title="underline" alt="underline" class="bbButton bbUnderscore"></div></a>
					<a href="javascript:void(0);" bbtype="d" bbtag="alliance"><div title="alliance" alt="alliance" class="bbButton bbAlliance"></div></a>
					<a href="javascript:void(0);" bbtype="d" bbtag="player"><div title="player" alt="player" class="bbButton bbPlayer"></div></a>
					<a href="javascript:void(0);" bbtype="d" bbtag="x|y"><div title="coordinates" alt="coordinates" class="bbButton bbCoordinate"></div></a>
					<a href="javascript:void(0);" bbtype="d" bbtag="report"><div title="report" alt="report" class="bbButton bbReport"></div></a>
					<a href="javascript:void(0);" bbwin="resources" id="message_resourceButton"><div title="resources" alt="resources" class="bbButton bbResource"></div></a>
					<a href="javascript:void(0);" bbwin="smilies" id="message_smilieButton"><div title="smilies" alt="smilies" class="bbButton bbSmilie"></div></a>
					<a href="javascript:void(0);" bbwin="troops" id="message_troopButton"><div title="troops" alt="troops" class="bbButton bbTroop"></div></a>
					<a href="javascript:void(0);" id="message_previewButton" bbarea="message"><div title="preview" alt="preview" class="bbButton bbPreview"></div></a>
					<div class="clear"></div>
					<div id="message_toolbarWindows">
						<div id="message_resources" name="message_resources"><a href="javascript:void(0);" bbtype="o" bbtag="l"><img src="img/x.gif" class="r1" title="Lumber" alt="Lumber"></a><a href="javascript:void(0);" bbtype="o" bbtag="cl"><img src="img/x.gif" class="r2" title="Clay" alt="Clay"></a><a href="javascript:void(0);" bbtype="o" bbtag="i"><img src="img/x.gif" class="r3" title="Iron" alt="Iron"></a><a href="javascript:void(0);" bbtype="o" bbtag="c"><img src="img/x.gif" class="r4" title="Crop" alt="Crop"></a></div>
						<div id="message_smilies" name="message_smilies"><a href="javascript:void(0);" bbtype="s" bbtag="*aha*"><img class="smiley aha" src="img/x.gif" alt="*aha*" title="*aha*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*angry*"><img class="smiley angry" src="img/x.gif" alt="*angry*" title="*angry*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*cool*"><img class="smiley cool" src="img/x.gif" alt="*cool*" title="*cool*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*cry*"><img class="smiley cry" src="img/x.gif" alt="*cry*" title="*cry*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*cute*"><img class="smiley cute" src="img/x.gif" alt="*cute*" title="*cute*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*depressed*"><img class="smiley depressed" src="img/x.gif" alt="*depressed*" title="*depressed*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*eek*"><img class="smiley eek" src="img/x.gif" alt="*eek*" title="*eek*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*ehem*"><img class="smiley ehem" src="img/x.gif" alt="*ehem*" title="*ehem*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*emotional*"><img class="smiley emotional" src="img/x.gif" alt="*emotional*" title="*emotional*"></a><a href="javascript:void(0);" bbtype="s" bbtag=":D"><img class="smiley grin" src="img/x.gif" alt=":D" title=":D"></a><a href="javascript:void(0);" bbtype="s" bbtag=":)"><img class="smiley happy" src="img/x.gif" alt=":)" title=":)"></a><a href="javascript:void(0);" bbtype="s" bbtag="*hit*"><img class="smiley hit" src="img/x.gif" alt="*hit*" title="*hit*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*hmm*"><img class="smiley hmm" src="img/x.gif" alt="*hmm*" title="*hmm*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*hmpf*"><img class="smiley hmpf" src="img/x.gif" alt="*hmpf*" title="*hmpf*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*hrhr*"><img class="smiley hrhr" src="img/x.gif" alt="*hrhr*" title="*hrhr*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*huh*"><img class="smiley huh" src="img/x.gif" alt="*huh*" title="*huh*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*lazy*"><img class="smiley lazy" src="img/x.gif" alt="*lazy*" title="*lazy*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*love*"><img class="smiley love" src="img/x.gif" alt="*love*" title="*love*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*nocomment*"><img class="smiley nocomment" src="img/x.gif" alt="*nocomment*" title="*nocomment*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*noemotion*"><img class="smiley noemotion" src="img/x.gif" alt="*noemotion*" title="*noemotion*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*notamused*"><img class="smiley notamused" src="img/x.gif" alt="*notamused*" title="*notamused*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*pout*"><img class="smiley pout" src="img/x.gif" alt="*pout*" title="*pout*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*redface*"><img class="smiley redface" src="img/x.gif" alt="*redface*" title="*redface*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*rolleyes*"><img class="smiley rolleyes" src="img/x.gif" alt="*rolleyes*" title="*rolleyes*"></a><a href="javascript:void(0);" bbtype="s" bbtag=":("><img class="smiley sad" src="img/x.gif" alt=":(" title=":("></a><a href="javascript:void(0);" bbtype="s" bbtag="*shy*"><img class="smiley shy" src="img/x.gif" alt="*shy*" title="*shy*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*smile*"><img class="smiley smile" src="img/x.gif" alt="*smile*" title="*smile*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*tongue*"><img class="smiley tongue" src="img/x.gif" alt="*tongue*" title="*tongue*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*veryangry*"><img class="smiley veryangry" src="img/x.gif" alt="*veryangry*" title="*veryangry*"></a><a href="javascript:void(0);" bbtype="s" bbtag="*veryhappy*"><img class="smiley veryhappy" src="img/x.gif" alt="*veryhappy*" title="*veryhappy*"></a><a href="javascript:void(0);" bbtype="s" bbtag=";)"><img class="smiley wink" src="img/x.gif" alt=";)" title=";)"></a></div>
						<div id="message_troops" name="message_troops"><a href="javascript:void(0);" bbtype="o" bbtag="tid1"><img class="unit u1" src="img/x.gif" title="Legionnaire" alt="Legionnaire"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid2"><img class="unit u2" src="img/x.gif" title="Praetorian" alt="Praetorian"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid3"><img class="unit u3" src="img/x.gif" title="Imperian" alt="Imperian"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid4"><img class="unit u4" src="img/x.gif" title="Equites Legati" alt="Equites Legati"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid5"><img class="unit u5" src="img/x.gif" title="Equites Imperatoris" alt="Equites Imperatoris"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid6"><img class="unit u6" src="img/x.gif" title="Equites Caesaris" alt="Equites Caesaris"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid7"><img class="unit u7" src="img/x.gif" title="Battering Ram" alt="Battering Ram"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid8"><img class="unit u8" src="img/x.gif" title="Fire Catapult" alt="Fire Catapult"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid9"><img class="unit u9" src="img/x.gif" title="Senator" alt="Senator"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid10"><img class="unit u10" src="img/x.gif" title="Settler" alt="Settler"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid11"><img class="unit u11" src="img/x.gif" title="Clubswinger" alt="Clubswinger"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid12"><img class="unit u12" src="img/x.gif" title="Spearman" alt="Spearman"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid13"><img class="unit u13" src="img/x.gif" title="Axeman" alt="Axeman"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid14"><img class="unit u14" src="img/x.gif" title="Scout" alt="Scout"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid15"><img class="unit u15" src="img/x.gif" title="Paladin" alt="Paladin"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid16"><img class="unit u16" src="img/x.gif" title="Teutonic Knight" alt="Teutonic Knight"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid17"><img class="unit u17" src="img/x.gif" title="Ram" alt="Ram"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid18"><img class="unit u18" src="img/x.gif" title="Catapult" alt="Catapult"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid19"><img class="unit u19" src="img/x.gif" title="Chief" alt="Chief"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid20"><img class="unit u20" src="img/x.gif" title="Settler" alt="Settler"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid21"><img class="unit u21" src="img/x.gif" title="Phalanx" alt="Phalanx"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid22"><img class="unit u22" src="img/x.gif" title="Swordsman" alt="Swordsman"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid23"><img class="unit u23" src="img/x.gif" title="Pathfinder" alt="Pathfinder"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid24"><img class="unit u24" src="img/x.gif" title="Theutates Thunder" alt="Theutates Thunder"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid25"><img class="unit u25" src="img/x.gif" title="Druidrider" alt="Druidrider"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid26"><img class="unit u26" src="img/x.gif" title="Haeduan" alt="Haeduan"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid27"><img class="unit u27" src="img/x.gif" title="Ram" alt="Ram"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid28"><img class="unit u28" src="img/x.gif" title="Trebuchet" alt="Trebuchet"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid29"><img class="unit u29" src="img/x.gif" title="Chieftain" alt="Chieftain"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid30"><img class="unit u30" src="img/x.gif" title="Settler" alt="Settler"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid31"><img class="unit u31" src="img/x.gif" title="Rat" alt="Rat"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid32"><img class="unit u32" src="img/x.gif" title="Spider" alt="Spider"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid33"><img class="unit u33" src="img/x.gif" title="Snake" alt="Snake"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid34"><img class="unit u34" src="img/x.gif" title="Bat" alt="Bat"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid35"><img class="unit u35" src="img/x.gif" title="Wild Boar" alt="Wild Boar"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid36"><img class="unit u36" src="img/x.gif" title="Wolf" alt="Wolf"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid37"><img class="unit u37" src="img/x.gif" title="Bear" alt="Bear"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid38"><img class="unit u38" src="img/x.gif" title="Crocodile" alt="Crocodile"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid39"><img class="unit u39" src="img/x.gif" title="Tiger" alt="Tiger"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid40"><img class="unit u40" src="img/x.gif" title="Elephant" alt="Elephant"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid41"><img class="unit u41" src="img/x.gif" title="Pikeman" alt="Pikeman"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid42"><img class="unit u42" src="img/x.gif" title="Thorned Warrior" alt="Thorned Warrior"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid43"><img class="unit u43" src="img/x.gif" title="Guardsman" alt="Guardsman"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid44"><img class="unit u44" src="img/x.gif" title="Birds Of Prey" alt="Birds Of Prey"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid45"><img class="unit u45" src="img/x.gif" title="Axerider" alt="Axerider"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid46"><img class="unit u46" src="img/x.gif" title="Natarian Knight" alt="Natarian Knight"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid47"><img class="unit u47" src="img/x.gif" title="War Elephant" alt="War Elephant"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid48"><img class="unit u48" src="img/x.gif" title="Ballista" alt="Ballista"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid49"><img class="unit u49" src="img/x.gif" title="Natarian Emperor" alt="Natarian Emperor"></a><a href="javascript:void(0);" bbtype="o" bbtag="tid50"><img class="unit u50" src="img/x.gif" title="Settler" alt="Settler"></a><a href="javascript:void(0);" bbtype="o" bbtag="hero"><img class="unit uhero" src="img/x.gif" title="Hero" alt="Hero"></a></div>
					</div>
				</div>
				<div class="line bbLine"></div>

				<textarea id="message" name="message" onkeyup="copyElement('body')" tabindex="3" class="textarea write message"><?php if(isset($message->reply['message'])) { echo " \n\nReply:\n".$message->reply['message']; } ?></textarea>
				<div id="message_preview" name="message_preview" class="message" style="display: none; "></div>
			</div>

			<script>
				var bbEditor = new BBEditor("message");
			</script>
					<p class="btn">
		<input type="hidden" name="t" value="1" />
		<input type="image" value="" name="s1" id="btn_send" class="dynamic_img" src="img/x.gif" alt="send" tabindex="4;">
	</p>
	</form>
	<div id="adressbook" class="hide"><h2>Addressbook</h2><form method="post" name="abform" action="nachrichten.php" accept-charset="UTF-8"> <input type="hidden" name="a" value="d3d"> <input type="hidden" name="t" value="1"> <input type="hidden" id="copy_receiver" name="copy_receiver" value=""> <input type="hidden" id="copy_subject" name="copy_subject" value=""> <input type="hidden" id="copy_igm" name="copy_igm" value=""> <input type="hidden" name="sbmtype" value="default"> <input type="hidden" name="sbmvalue" value=""> <table cellpadding="1" cellspacing="1" id="friendlist"><tbody><tr><td class="end"></td>  <td class="pla">    <input class="text" type="text" name="addfriends[0]" value="" maxlength="15">  </td>  <td class="on"></td><td></td><td class="end"></td>  <td class="pla">    <input class="text" type="text" name="addfriends[1]" value="" maxlength="15">  </td>  <td class="on"></td></tr><tr><td class="end"></td>  <td class="pla">    <input class="text" type="text" name="addfriends[2]" value="" maxlength="15">  </td>  <td class="on"></td><td></td><td class="end"></td>  <td class="pla">    <input class="text" type="text" name="addfriends[3]" value="" maxlength="15">  </td>  <td class="on"></td></tr><tr><td class="end"></td>  <td class="pla">    <input class="text" type="text" name="addfriends[4]" value="" maxlength="15">  </td>  <td class="on"></td><td></td><td class="end"></td>  <td class="pla">    <input class="text" type="text" name="addfriends[5]" value="" maxlength="15">  </td>  <td class="on"></td></tr><tr><td class="end"></td>  <td class="pla">    <input class="text" type="text" name="addfriends[6]" value="" maxlength="15">  </td>  <td class="on"></td><td></td><td class="end"></td>  <td class="pla">    <input class="text" type="text" name="addfriends[7]" value="" maxlength="15">  </td>  <td class="on"></td></tr><tr><td class="end"></td>  <td class="pla">    <input class="text" type="text" name="addfriends[8]" value="" maxlength="15">  </td>  <td class="on"></td><td></td><td class="end"></td>  <td class="pla">    <input class="text" type="text" name="addfriends[9]" value="" maxlength="15">  </td>  <td class="on"></td></tr><tr><td class="end"></td>  <td class="pla">    <input class="text" type="text" name="addfriends[10]" value="" maxlength="15">  </td>  <td class="on"></td><td></td><td class="end"></td>  <td class="pla">    <input class="text" type="text" name="addfriends[11]" value="" maxlength="15">  </td>  <td class="on"></td></tr><tr><td class="end"></td>  <td class="pla">    <input class="text" type="text" name="addfriends[12]" value="" maxlength="15">  </td>  <td class="on"></td><td></td><td class="end"></td>  <td class="pla">    <input class="text" type="text" name="addfriends[13]" value="" maxlength="15">  </td>  <td class="on"></td></tr><tr><td class="end"></td>  <td class="pla">    <input class="text" type="text" name="addfriends[14]" value="" maxlength="15">  </td>  <td class="on"></td><td></td><td class="end"></td>  <td class="pla">    <input class="text" type="text" name="addfriends[15]" value="" maxlength="15">  </td>  <td class="on"></td></tr><tr><td class="end"></td>  <td class="pla">    <input class="text" type="text" name="addfriends[16]" value="" maxlength="15">  </td>  <td class="on"></td><td></td><td class="end"></td>  <td class="pla">    <input class="text" type="text" name="addfriends[17]" value="" maxlength="15">  </td>  <td class="on"></td></tr><tr><td class="end"></td>  <td class="pla">    <input class="text" type="text" name="addfriends[18]" value="" maxlength="15">  </td>  <td class="on"></td><td></td><td class="end"></td>  <td class="pla">    <input class="text" type="text" name="addfriends[19]" value="" maxlength="15">  </td>  <td class="on"></td></tr></tbody></table>  <p class="btn">  <input type="image" value="" name="s1" id="btn_save" class="dynamic_img" src="img/x.gif" alt="save">  </p>  </form><a href="#" onclick="closeFriendsList(); return false;"><img src="img/x.gif" id="close" alt="close adressbook" title="close adressbook"></a></div></div>
<div id="write_foot" class="msg_foot"></div>

</div>