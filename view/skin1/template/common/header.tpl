		<div id="ben-header">
            <div id="ben-top">
            	<div id="ben-header-date">
                	<table>
                    	<tr>
                        	<td>
                    			<div class="day"></div>
                    			<div class="date"></div>        
                            </td>
                            <td>
                            	<div class="time"></div>
                            </td>
                        </tr>
                	
                    </table>
                </div>
                <div class="ben-left" id="ben-logo">
                	<img src="view/skin1/image/logo.png" />
                </div>
                <div class="clearer">&nbsp;</div>
            </div>
            <div id="ben-header-bottom">
            	<center><h1>VUI LÒNG CHẠM VÀO ĐỂ BIẾT THÔNG TIN CHI TIẾT</h1></center>
            </div>
        </div>
<script language="javascript">
var arrcolor = new Array('#FFF',"#0F0","#fb0303","#ecfb03");
var incolor = 0;
function runChangeColor()
{
	//alert(incolor)
	$('#ben-header-bottom').css('color',arrcolor[incolor]);
	incolor++;
	
	if(incolor>=arrcolor.length)
	{
		incolor = 0;
	}
	setTimeout('runChangeColor();',500);
}
$(document).ready(function(e) {
    runChangeColor();
});

</script>