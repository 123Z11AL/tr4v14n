res_d1
<table class="results defender" cellpadding="1" cellspacing="1">
				<thead>
					<tr>
						<td class="role">
							Defender
						</td><td>
								<img src="img/x.gif" class="unit u1" title="Legionnaire" alt="Legionnaire" />
							</td><td>
								<img src="img/x.gif" class="unit u2" title="Praetorian" alt="Praetorian" />
							</td><td>
								<img src="img/x.gif" class="unit u3" title="Imperian" alt="Imperian" />
							</td><td>
								<img src="img/x.gif" class="unit u4" title="Equites Legati" alt="Equites Legati" />
							</td><td>
								<img src="img/x.gif" class="unit u5" title="Equites Imperatoris" alt="Equites Imperatoris" />
							</td><td>
								<img src="img/x.gif" class="unit u6" title="Equites Caesaris" alt="Equites Caesaris" />
							</td><td>
								<img src="img/x.gif" class="unit u7" title="Battering Ram" alt="Battering Ram" />
							</td><td>
								<img src="img/x.gif" class="unit u8" title="Fire Catapult" alt="Fire Catapult" />
							</td><td>
								<img src="img/x.gif" class="unit u9" title="Senator" alt="Senator" />
							</td><td>
								<img src="img/x.gif" class="unit u10" title="Settler" alt="Settler" />

							</td></tr>
				</thead>
				<tbody>
					<tr>
						<th>
							Troops
						</th>
                                <td class="none">
									<?php if (!$form->getValue('a2_1')) { echo "0"; }else{ echo $form->getValue('a2_1');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_2')) { echo "0"; }else{ echo $form->getValue('a2_2');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_3')) { echo "0"; }else{ echo $form->getValue('a2_3');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_4')) { echo "0"; }else{ echo $form->getValue('a2_4');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_5')) { echo "0"; }else{ echo $form->getValue('a2_5');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_6')) { echo "0"; }else{ echo $form->getValue('a2_6');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_7')) { echo "0"; }else{ echo $form->getValue('a2_7');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_8')) { echo "0"; }else{ echo $form->getValue('a2_8');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_9')) { echo "0"; }else{ echo $form->getValue('a2_9');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_10')) { echo "0"; }else{ echo $form->getValue('a2_10');} ?>
								</td></tr>
					<tr>
						<th>
							Casualties
						</th><td class="none">
									<?php
                                    $troops = $form->getValue('a2_1');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_2');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_3');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_4');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_5');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_6');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_7');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_8');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_9');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_10');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td></tr>
				</tbody>
			</table>