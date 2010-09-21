res_d2
<table class="results defender" cellpadding="1" cellspacing="1">
				<thead>
					<tr>
						<td class="role">
							Defender
						</td><td>
								<img src="img/x.gif" class="unit u11" title="Clubswinger" alt="Clubswinger" />
							</td><td>
								<img src="img/x.gif" class="unit u12" title="Spearman" alt="Spearman" />
							</td><td>
								<img src="img/x.gif" class="unit u13" title="Axeman" alt="Axeman" />
							</td><td>
								<img src="img/x.gif" class="unit u14" title="Scout" alt="Scout" />
							</td><td>
								<img src="img/x.gif" class="unit u15" title="Paladin" alt="Paladin" />
							</td><td>
								<img src="img/x.gif" class="unit u16" title="Teutonic Knight" alt="Teutonic Knight" />
							</td><td>
								<img src="img/x.gif" class="unit u17" title="Ram" alt="Ram" />
							</td><td>
								<img src="img/x.gif" class="unit u18" title="Catapult" alt="Catapult" />
							</td><td>
								<img src="img/x.gif" class="unit u19" title="Chief" alt="Chief" />
							</td><td>
								<img src="img/x.gif" class="unit u20" title="Settler" alt="Settler" />
							</td></tr>
				</thead>
				<tbody>
					<tr>
						<th>
							Troops
						</th>
                        		<td class="none">
									<?php if (!$form->getValue('a2_11')) { echo "0"; }else{ echo $form->getValue('a2_11');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_12')) { echo "0"; }else{ echo $form->getValue('a2_12');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_13')) { echo "0"; }else{ echo $form->getValue('a2_13');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_14')) { echo "0"; }else{ echo $form->getValue('a2_14');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_15')) { echo "0"; }else{ echo $form->getValue('a2_15');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_16')) { echo "0"; }else{ echo $form->getValue('a2_16');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_17')) { echo "0"; }else{ echo $form->getValue('a2_17');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_18')) { echo "0"; }else{ echo $form->getValue('a2_18');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_19')) { echo "0"; }else{ echo $form->getValue('a2_19');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_20')) { echo "0"; }else{ echo $form->getValue('a2_20');} ?>
								</td></tr>
					<tr>
						<th>
							Casualties
						</th><td class="none">
									<?php
                                    $troops = $form->getValue('a2_11');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_12');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_13');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_14');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_15');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_16');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_17');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_18');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_19');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_20');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td></tr>
				</tbody>
			</table>