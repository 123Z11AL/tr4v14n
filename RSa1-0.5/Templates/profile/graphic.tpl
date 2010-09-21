<?php if(GP_ENABLE) {
?>
<h1>Player profile</h1>

<?php include("menu.tpl"); ?>
<?php include("gpackac.tpl"); ?>

<form action="spieler.php" method="post" name="gp_selection">
<input type="hidden" name="s" value="4" />
<table cellpadding="1" cellspacing="1" id="gpack">
    <thead>
        <tr>
            <th>Graphic pack settings</th>
        </tr>
    </thead>

            <tbody>
            <tr>
                <td class="info">
                    A graphic pack lets you change the design of Travian and shorten the loading time for each site. You can either choose the one in the list, use a link to an external graphic pack, or use a locally saved graphic pack on your pc.<br />
                    <span class="alert">CAUTION: Only use trustable graphic packs.</span>
                </td>
            </tr>
            <tr>

                <td>
                    <label>
                        <input type="radio" class="radio" name="gp_type" value="default" />
                        Standard graphic pack                    </label>
                </td>
            </tr>
            <tr>
                <td>

                    <label>
                        <input type="radio" class="radio" name="gp_type" value="custom"checked="checked" />
                        User-defined graphic pack                    </label>
                    <input class="text" type="text" name="custom_url" value="<?php echo $database->getUserField($session->uid,gpack,0); ?>" onclick="document.gp_selection.gp_type[1].checked = true" /><br />
                                        <div class="example">Example: <span class="path">file:///C:/Travian/gpack/</span> or <span class="path">http://www.travian.org/user/gpack/</span></div>
                </td>

            </tr>
        </tbody>
    </table>
    <p class="btn"><input type="image" alt="OK" src="img/x.gif" name="gp_selection_button" value="ok" class="dynamic_img" id="btn_ok" /></p>
    </form>


    <table cellpadding="1" cellspacing="1" id="download">
        <thead>
            <tr>

                <th colspan="4">More graphic packs</th>
            </tr>
            <tr>
                <td>name</td>
                <td>size in MB</td>
                <td>activate</td>
                <td>download</td>

            </tr>
        </thead>
        <tbody>
                            <tr>
                    <td class="nam">Travian Standard</td>
                                        <td class="size">4</td>
                    <td class="act"><a href="spieler.php?s=4&gp_type=custom&custom_url=http://img.travian.com/gpack/live/travian_default_en/">activate</a></td>

                    <td class="down"><a href="http://img.travian.com/gpack/download/travian_default_en.zip" target="_blank">download</a></td>
                </tr>
<tr>
					<td class="nam">Travian Revival</td>
										<td class="size">6</td>
					<td class="act"><a href="spieler.php?s=4&amp;gp_type=custom&amp;custom_url=http://tutorials.travianteam.com/gpack/">Activate</a></td>
					<td class="down"><a href="http://tutorials.travianteam.com/gpack/revival_en_new.zip" target="_blank">Download</a></td>
				</tr>
<tr>
					<td class="nam">Travian Redesign</td>
										<td class="size">?</td>
					<td class="act"><a href="spieler.php?s=4&amp;gp_type=custom&amp;custom_url=http://x2.travian.com/gpack/travian_redesign/">Activate</a></td>
					<td class="down"><a href="#" target="_blank">Download</a></td>
				</tr>
                    </tbody>
    </table>
    <?php
    }
    ?>