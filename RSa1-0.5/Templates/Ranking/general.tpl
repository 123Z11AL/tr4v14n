<?php
$ranking = $ranking->procGeneralArray();
?>
<table cellpadding="1" cellspacing="1" id="world_player" class="world">
    <thead>
     <tr><th colspan="2">Player</th></tr>
     </thead>
     <tbody>
     <tr>
      <th>Registered players</th>
      <td><?php echo $ranking['totalUsers']?></td>
     </tr>
     <tr>
      <th>Active players</th>
      <td><?php echo $ranking['activeUsers']?></td>
     </tr>
     <tr>
      <th>Players online</th>
      <td><?php echo $ranking['onlineUsers']?></td>
     </tr>
    </tbody>
   </table>
 
   <table cellpadding="1" cellspacing="1" id="world_tribes" class="world">
    <thead>
     <tr><th colspan="3">Tribes</th></tr>
     <tr>
      <td>Tribe</td>
      <td>Registered</td>
      <td>Percent</td>
     </tr>
     </thead>
     <tbody>
     <tr>
      <td>Romans</td>
      <td><?php echo $ranking['tribe1Users']?></td>
      <td><?php echo $ranking['percentTribe1']?></td>
     </tr>
     <tr>
      <td>Teutons</td>
      <td><?php echo $ranking['tribe2Users']?></td>
      <td><?php echo $ranking['percentTribe2']?></td>
     </tr>
     <tr>
      <td>Gauls</td>
      <td><?php echo $ranking['tribe3Users']?></td>
      <td><?php echo $ranking['percentTribe3']?></td>
     </tr>
    </tbody>
   </table>
 
   <table cellpadding="1" cellspacing="1" id="world_misc" class="world">
    <thead>
     <tr><th colspan="3">Miscellaneous</th></tr>
     <tr>
      <td>Attacks</td>
      <td>Casualties</td>
      <td>Date</td>
     </tr>
     <tr>
      <td colspan="3">Don't Works!!! Slope combat system</td>
      </tr>           
     </thead>
     <tbody>
         </tbody>
   </table>
<div>
