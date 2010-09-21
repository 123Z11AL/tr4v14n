<?php
include("Templates/Plus/pmenu.tpl");
?>
 
<script type="text/javascript"> 
<!--
function loadProductGroup(group_id) {
    if (group_id.length == 0){
        path='';
    } else {
        path='?group='+group_id;
    }
 
    location.href=path;
}
//-->
</script> 
 
<form> 
    <p id="product_selection"> 
        <label>Select Country</label> 
        <select class="dropdown"
                name="group"
                onchange="loadProductGroup(this.form.elements[0].value)"
                target="_parent._top"
                onclick="this.focus()"> 
                        <option value="21">International - English</option> 
                        <option value="">--Select Country--</option> 
                        <option value="21">International - English</option> 
                        <option value="322">Australia - English</option> 
                        <option value="108">Österreich - Deutsch</option> 
                        <option value="111">België - Dutch</option> 
                        <option value="114">???????? - Bulgarian</option> 
                        <option value="117">Ceská republika - Czech</option> 
                        <option value="124">Danmark - Danish</option> 
                        <option value="126">Eesti - Estonian</option> 
                        <option value="133">Suomi - Finnish</option> 
                        <option value="137">France - French</option> 
                        <option value="120">Deutschland - Deutsch</option> 
                        <option value="138">????da - Greek</option> 
                        <option value="141">Magyarország - Hungarian</option> 
                        <option value="344">India - English</option> 
                        <option value="202">Ireland - English</option> 
                        <option value="149">Latvia - Latvian</option> 
                        <option value="144">Lietuvoje - Lithuanian</option> 
                        <option value="153">Nederland - Dutch</option> 
                        <option value="155">Polska - Polish</option> 
                        <option value="158">Portugal - Portuguese</option> 
                        <option value="161">România - Romanian</option> 
                        <option value="171">Slovensko - Slovak</option> 
                        <option value="169">Slovenija - Slovenian</option> 
                        <option value="129">España - Spanish</option> 
                        <option value="164">Sverige - Swedish</option> 
                        <option value="174">United Kingdom - English</option> 
 
        </select> 
    </p> 
</form> 
 
 
 
<p id="orders_link"> 
    <a href="?show=active">&laquo;Active Orders&raquo;</a> 
</p> 
 
<div id="products"> 
 
            <table class="product lang_ltr" cellpadding="1" cellspacing="1"> 
                <thead> 
                    <tr> 
                        <th>Package A</th> 
                    </tr> 
                </thead> 
                <tbody> 
                    <tr> 
                        <td class="pic"><a href="?product=117"><img src="http://content.tg-payment.com/content/img/products/Travian_com_a.jpg" style="width:100px; height:100px;"
                         alt="Package A" /></a></td> 
                    </tr> 
                    <tr> 
                        <td>30&nbsp;Gold</td> 
                    </tr> 
                    <tr> 
                        <td>2.49&nbsp;USD</td> 
                    </tr> 
                    <tr> 
                        <td><a href="?product=117">&raquo; next</a></td> 
                    </tr> 
                </tbody> 
            </table> 
 
            <table class="product lang_ltr" cellpadding="1" cellspacing="1"> 
                <thead> 
                    <tr> 
                        <th>Package B</th> 
                    </tr> 
                </thead> 
                <tbody> 
                    <tr> 
                        <td class="pic"><a href="?product=118"><img src="http://content.tg-payment.com/content/img/products/Travian_com_b.jpg" style="width:100px; height:100px;"
                         alt="Package B" /></a></td> 
                    </tr> 
                    <tr> 
                        <td>100&nbsp;Gold</td> 
                    </tr> 
                    <tr> 
                        <td>5.99&nbsp;USD</td> 
                    </tr> 
                    <tr> 
                        <td><a href="?product=118">&raquo; next</a></td> 
                    </tr> 
                </tbody> 
            </table> 
 
            <table class="product lang_ltr" cellpadding="1" cellspacing="1"> 
                <thead> 
                    <tr> 
                        <th>Package C</th> 
                    </tr> 
                </thead> 
                <tbody> 
                    <tr> 
                        <td class="pic"><a href="?product=119"><img src="http://content.tg-payment.com/content/img/products/Travian_com_c.jpg" style="width:100px; height:100px;"
                         alt="Package C" /></a></td> 
                    </tr> 
                    <tr> 
                        <td>250&nbsp;Gold</td> 
                    </tr> 
                    <tr> 
                        <td>12.99&nbsp;USD</td> 
                    </tr> 
                    <tr> 
                        <td><a href="?product=119">&raquo; next</a></td> 
                    </tr> 
                </tbody> 
            </table> 
 
            <table class="product lang_ltr" cellpadding="1" cellspacing="1"> 
                <thead> 
                    <tr> 
                        <th>Package D</th> 
                    </tr> 
                </thead> 
                <tbody> 
                    <tr> 
                        <td class="pic"><a href="?product=120"><img src="http://content.tg-payment.com/content/img/products/Travian_com_d.jpg" style="width:100px; height:100px;"
                         alt="Package D" /></a></td> 
                    </tr> 
                    <tr> 
                        <td>600&nbsp;Gold</td> 
                    </tr> 
                    <tr> 
                        <td>24.99&nbsp;USD</td> 
                    </tr> 
                    <tr> 
                        <td><a href="?product=120">&raquo; next</a></td> 
                    </tr> 
                </tbody> 
            </table> 
 
            <table class="product lang_ltr" cellpadding="1" cellspacing="1"> 
                <thead> 
                    <tr> 
                        <th>SMS</th> 
                    </tr> 
                </thead> 
                <tbody> 
                    <tr> 
                        <td class="pic"><a href="?product=122"><img src="http://content.tg-payment.com/content/img/products/Travian_com_sms.jpg" style="width:100px; height:100px;"
                         alt="SMS" /></a></td> 
                    </tr> 
                    <tr> 
                        <td>20&nbsp;Gold</td> 
                    </tr> 
                    <tr> 
                        <td>2.49&nbsp;USD</td> 
                    </tr> 
                    <tr> 
                        <td><a href="?product=122">&raquo; next</a></td> 
                    </tr> 
                </tbody> 
            </table> 
 
            <table class="product lang_ltr" cellpadding="1" cellspacing="1"> 
                <thead> 
                    <tr> 
                        <th>Phone</th> 
                    </tr> 
                </thead> 
                <tbody> 
                    <tr> 
                        <td class="pic"><a href="?product=121"><img src="http://content.tg-payment.com/content/img/products/Travian_com_aud.jpg" style="width:100px; height:100px;"
                         alt="Phone" /></a></td> 
                    </tr> 
                    <tr> 
                        <td>25&nbsp;Gold</td> 
                    </tr> 
                    <tr> 
                        <td>2.49&nbsp;USD</td> 
                    </tr> 
                    <tr> 
                        <td><a href="?product=121">&raquo; next</a></td> 
                    </tr> 
                </tbody> 
            </table> 
 
            <table class="product lang_ltr" cellpadding="1" cellspacing="1"> 
                <thead> 
                    <tr> 
                        <th>Voucher</th> 
                    </tr> 
                </thead> 
                <tbody> 
                    <tr> 
                        <td class="pic"><a href="#" onclick="window.open('/tgpay/index.php?product=485&provider=40','tgpay','scrollbars=yes,status=yes,resizable=yes,toolbar=yes,width=800,height=600');return false;"><img src="http://content.tg-payment.com/content/img/products/Travian_voucher_a.jpg" style="width:100px; height:100px;" alt="Voucher" /></a></td> 
                    </tr> 
                    <tr> 
                        <td>Voucher</td> 
                    </tr> 
                    <tr> 
                        <td><a href="#" onclick="window.open('/tgpay/index.php?product=485&provider=40','tgpay','scrollbars=yes,status=yes,resizable=yes,toolbar=yes,width=800,height=600');return false;">&raquo; Buy</a></td> 
                    </tr> 
                    <tr> 
                        <td><a href="#" onclick="window.open('/tgpay/index.php?product=485&provider=40','tgpay','scrollbars=yes,status=yes,resizable=yes,toolbar=yes,width=800,height=600');return false;">&raquo; Redeem</a></td> 
                    </tr> 
                </tbody> 
            </table> 
 
<div class="clear"></div> 
 
<div style="margin-top: 10px; font-size: 11px; font-style: italic;"> 
All prices listed are final sales amounts.
</div> 
 
</div> 
</div> 