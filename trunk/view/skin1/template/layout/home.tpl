<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $language; ?>" xml:lang="<?php echo $language; ?>">
<head>
<link type="image/x-icon" href="<?php echo HTTP_SERVER.DIR_IMAGE?>logo-small.png" rel="icon">
<link type="image/x-icon" href="<?php echo HTTP_SERVER.DIR_IMAGE?>logo-small.png" rel="shortcut icon">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="robots" content="INDEX,FOLLOW" />
<meta http-equiv="REFRESH" content="5400" />
<meta name="description" content="<?php echo $meta_description?>" />
<meta name="keywords" content="<?php echo $meta_keyword?>" />		
<title><?php echo $title?></title>
<meta property="og:title" content="<?php echo $title?>">
<meta property="og:type" content="Website">
<meta property="og:url" content="<?php echo $url?>">
<meta property="og:description" content="<?php echo $meta_description?>">
<?php echo $meta_image?>

</head>

<link href="view/skin1/css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="stylesheet">
<script src="view/skin1/js/jquery-1.9.1.js"></script>
<script src="view/skin1/js/jquery-ui-1.10.3.custom.js"></script>

<link href="view/skin1/css/style.css" rel="stylesheet">
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
	$('.day').html(day);
	$('.date').html(today);
	$('.time').html(h+":"+m);
	clocktime=setTimeout("time()","1000","JavaScript");
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
<body>
	<div id="ben-body">
    <div id="ben-main">
    	<?php echo $header?>
        <div id="ben-content">
            <?php echo $content?>
        </div>
        
    </div>
</div>
</body>
</html>
