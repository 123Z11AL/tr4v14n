		<table id="coords" cellpadding="1" cellspacing="1">
	<tbody><tr>
		<td class="sel">

			<label>
				<input class="radio" name="c" value="3" checked="checked" type="radio">
				<?php echo RAINFORCEMENT; ?>
            </label>
		</td>
		<td class="vil">
			<span><?php echo VILLAGE; ?>:</span>
			<input class="text" name="dname" value="" maxlength="20" type="text">
		</td>

	</tr>
	<tr>
		<td class="sel">
			<label>
				<input class="radio" name="c" value="4" type="radio">
				<?php echo ATTACK_NORMAL; ?>
            </label>
		</td>
		<td class="or">

			<?php echo OR_; ?>		</td>
	</tr>
	<tr>
		<td class="sel">
			<label>
				<input class="radio" name="c" value="5" type="radio">
				<?php echo ATTACK_RAID; ?>
            </label>
		</td>

		<td class="target">
			<span><?php echo COOR_X; ?>:</span>
			<input class="text" name="x" value="" maxlength="4" type="text">
			<span><?php echo COOR_Y; ?>:</span>
			<input class="text" name="y" value="" maxlength="4" type="text">
		</td>
	</tr>
</tbody></table>

		<input value="ok" name="s1" id="btn_ok" class="dynamic_img" src="img/x.gif" alt="OK" type="image">
	</form>
<p class="error"><?php echo $form->getError("error"); ?></p>
</div>
