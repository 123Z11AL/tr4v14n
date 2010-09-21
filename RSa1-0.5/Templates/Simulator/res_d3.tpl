res_d3
<table class="results defender" cellpadding="1" cellspacing="1">
				<thead>
					<tr>

						<td class="role">
							Defender
						</td><td>
								<img src="img/x.gif" class="unit u21" title="Phalanx" alt="Phalanx" />
							</td><td>
								<img src="img/x.gif" class="unit u22" title="Swordsman" alt="Swordsman" />
							</td><td>
								<img src="img/x.gif" class="unit u23" title="Pathfinder" alt="Pathfinder" />
							</td><td>
								<img src="img/x.gif" class="unit u24" title="Theutates Thunder" alt="Theutates Thunder" />
							</td><td>
								<img src="img/x.gif" class="unit u25" title="Druidrider" alt="Druidrider" />
							</td><td>
								<img src="img/x.gif" class="unit u26" title="Haeduan" alt="Haeduan" />
							</td><td>
								<img src="img/x.gif" class="unit u27" title="Ram" alt="Ram" />
							</td><td>
								<img src="img/x.gif" class="unit u28" title="Trebuchet" alt="Trebuchet" />
							</td><td>
								<img src="img/x.gif" class="unit u29" title="Chieftain" alt="Chieftain" />
							</td><td>
								<img src="img/x.gif" class="unit u30" title="Settler" alt="Settler" />
							</td></tr>
				</thead>
				<tbody>
					<tr>
						<th>

							Troops
						</th>
                        		<td class="none">
									<?php if (!$form->getValue('a2_21')) { echo "0"; }else{ echo $form->getValue('a2_21');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_22')) { echo "0"; }else{ echo $form->getValue('a2_22');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_23')) { echo "0"; }else{ echo $form->getValue('a2_23');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_24')) { echo "0"; }else{ echo $form->getValue('a2_24');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_25')) { echo "0"; }else{ echo $form->getValue('a2_25');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_26')) { echo "0"; }else{ echo $form->getValue('a2_26');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_27')) { echo "0"; }else{ echo $form->getValue('a2_27');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_28')) { echo "0"; }else{ echo $form->getValue('a2_28');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_29')) { echo "0"; }else{ echo $form->getValue('a2_29');} ?>
								</td><td class="none">
									<?php if (!$form->getValue('a2_30')) { echo "0"; }else{ echo $form->getValue('a2_30');} ?>
								</td></tr>
					<tr>

						<th>
							Casualties
						</th>
						</th><td class="none">
									<?php
                                    $troops = $form->getValue('a2_21');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_22');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_23');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_24');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_25');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_26');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_27');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_28');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_29');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td><td class="none">
									<?php
                                    $troops = $form->getValue('a2_30');
                                    $dead = $troops * $_POST['result'][2]; 
                                    echo round($dead);     
                                    ?>
								</td></tr>

				</tbody>
			</table>