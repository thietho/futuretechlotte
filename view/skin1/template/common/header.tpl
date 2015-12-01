		<div id="ben-header">
            <div id="ben-top">
            	<div id="ben-header-date">
                	<div class="date"></div> 
                    <div class="time"></div>
                	
                </div>
                <div class="ben-left" id="ben-logo">
                	<img src="view/skin1/image/logo.png" />
                </div>
                <div class="clearer">&nbsp;</div>
            </div>
            <div id="ben-header-bottom">
            	
            </div>
        </div>
<script type="text/javascript">
function time() {
	var today = new Date();
	var weekday=new Array(7);
	weekday[0]="Sunday";
	weekday[1]="Monday";
	weekday[2]="Tuesday";
	weekday[3]="Wednesday";
	weekday[4]="Thursday";
	weekday[5]="Friday";
	weekday[6]="Saturday";
	var month=new Array(12);
	month[1] = "JAN";
	month[2] = "FEB";
	month[3] = "MAR";
	month[4] = "APR";
	month[5] = "MAY";
	month[6] = "JUN";
	month[7] = "JUL";
	month[8] = "AUG";
	month[9] = "SEP";
	month[10] = "OCT";
	month[11] = "NOV";
	month[12] = "SEP";
	var day = weekday[today.getDay()]; 
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	var h=today.getHours();
	var m=today.getMinutes();
	var s=today.getSeconds();
	m=checkTime(m);
	s=checkTime(s);
	nowTime = h+":"+m+":"+s;
	if(dd<10){dd='0'+dd} if(mm<10){mm='0'+mm} today = dd+'.'+mm+'.'+yyyy;
	
	//tmp='<span class="date">'+today+' | '+nowTime+'</span>';
	
	//document.getElementById("clock").innerHTML=tmp;
	//$('.day').html(day);
	var showday = dd+"/"+month[mm]+"/"+yyyy;
	$('.date').html(showday);
	$('.time').html(h+":"+m);
	clocktime=setTimeout("time()","1000");
	function checkTime(i)
	{
	if (i<10)
	  {
	  i="0" + i;
	  }
	return i;
	}
}
$(document).ready(function(e) {
    time();
});
</script>
<script language="javascript">
/*var arrcolor = new Array('#FFF',"#0F0","#fb0303","#ecfb03");
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
});*/

</script>