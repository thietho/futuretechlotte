<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $language; ?>" xml:lang="<?php echo $language; ?>">
<head>
<link type="image/x-icon" href="<?php echo HTTP_SERVER.DIR_IMAGE?>icon.png" rel="icon">
<link type="image/x-icon" href="<?php echo HTTP_SERVER.DIR_IMAGE?>icon.png" rel="shortcut icon">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
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

<body oncontextmenu="return false">
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
