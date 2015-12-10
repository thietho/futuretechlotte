<script src="<?php echo DIR_COMPONENT?>flowplayer/flowplayer-3.2.13.min.js"></script>	
<script type="text/javascript" src="<?php echo DIR_COMPONENT?>webcamjs/webcam.js"></script>
            <div class="ben-section">
            	<div id="ben-maincontent">
                	<div >
                    	<img id="ben-main-banner" src="<?php echo $listfilm[0]['bannerthumbnail']?>" width="1080px" height="450px"/>
                    </div>
                    
					<style>
                    #ben-sileshowproduct img
                    {
                        margin-right:10px;	
                    }
                    </style>
                    <script type='text/javascript' language='javascript' src='<?php echo HTTP_SERVER.DIR_VIEW?>js/crawler.js'></script>
                    <script language="javascript">
                    var arrkey = Array();
					
                    </script>
                	<?php $pindex = 0;?>
                    <div id="nowshowing">
                    	<div class="ben-show-title ben-left">
                            <img src="view/skin1/image/nowshowing.png">
                        </div>
                        <div class="marquee ben-right" id="mycrawler">
                            <table class="ben-table-run">
                                <tr>
                                    <?php foreach($listfilm as $key => $film){ ?>
                                    <td>
                                        <a onclick="showFilm1(<?php echo $pindex++ ?>)"><img src="<?php echo $film['iconethumbnail']?>" width="196" height="304" /></a>
                                    </td>
                                    <script language="javascript">
                                        arrkey.push("<?php echo $film['id']?>");
                                        
                                    </script>
                                        
                                    <?php } ?>
                                    
                                    
                                </tr>
                            </table>
                        </div>
                        <div class="clearer"></div>
                    </div>
                    
                    
                    <script type="text/javascript">
var t;
$(document).ready(function(e) {
	
    setTimeout('runbanner()',1000);

});
$('body').click(function(e) {
    clearTimeout(t);
	//if($())
	t = setTimeout(function(){
			$('.ben-tabs td').removeClass('curent');
			$('.movieinfo').addClass('curent');
			showTabItem('movieinfo');
		},5000);
});
function runbanner()
{
	marqueeInit({
		uniqueid: 'mycrawler',
		style: {
			'height': '320px',
			'width': '1030px',
			'background':'#7A7C7E'
		},
		inc: 5, //speed - pixel increment for each iteration of this marquee's movement
		mouse: 'cursor driven', //mouseover behavior ('pause' 'cursor driven' or false)
		moveatleast: 2,
		neutral: 150,
		savedirection: true,
		random: true
	});
	marqueeInit({
		uniqueid: 'mycrawlercoming',
		style: {
			'height': '320px',
			'width': '1030px',
			'background':'#7A7C7E'
		},
		inc: 5, //speed - pixel increment for each iteration of this marquee's movement
		mouse: 'cursor driven', //mouseover behavior ('pause' 'cursor driven' or false)
		moveatleast: 2,
		neutral: 150,
		savedirection: true,
		random: true
	});
	
}
</script>
                    
                    <div id="ben-info">
                    	<div id="ben-info-left" >
                        	<div id="ben-info-movie" class="ben-item">
                            	
                                
                                
                                <div id="event" class="ben-tabs-item" style="display:none">
                                    <center><img src="<?php echo HTTP_IMAGE.$Event['filepath']?>" width="1080px" height="419px"/></center>
                                </div>
                                <div id="cinemaloction" class="ben-tabs-item" style="display:none">
                                    <center><img src="<?php echo HTTP_IMAGE.$CinemaLocation['filepath']?>" width="1080px" height="419px"/></center>
                                </div>
                                <div id="movieinfo" class="ben-tabs-item">
                                    <div id="movieinfo-image" class="ben-left">
                                    	<table>
                                        	<tr>
                                            	<td>
                                        			<img id="imagefilm" src="<?php echo $listfilm[0]['imagethumbnail']?>" width="344px" height="420px"/>
                                                </td>
                                                <td>
                                                	<div id="moviecontent" class="ben-right">
                                                        <?php echo html_entity_decode($listfilm[0]['movieinfo'])?>
                                                    </div>
                                                </td>
                                        	</tr>
                                        </table>
                                    </div>
                                    
                                    <div class="clearer">&nbsp;</div>
                                </div>
                                <div id="ticketprice" class="ben-tabs-item" style="display:none">
                                    <center><img src="<?php echo HTTP_IMAGE.$TicketPrice['filepath']?>" width="1080px" height="419px"/></center>
                                </div>
                                <table class="ben-tabs">
                                	<tr>
                                    	<td class="movieinfo curent" ref="movieinfo">
                                        	<img src="view/skin1/image/button/movieinfo.png" />
                                        </td>
                                        <td class="event" ref="event">
                                        	<img src="view/skin1/image/button/event.png" />
                                        </td>
                                        <td ref="cinemaloction" class="cinemaloction">
                                        	<img src="view/skin1/image/button/layout.png" />
                                        </td>
                                        <td class="ticketprice" ref="ticketprice">
                                        	<img src="view/skin1/image/button/ticket.png" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            
                            
                            
                            <script language="javascript">
							$('.ben-tabs td').click(function(e) {
								if(!$(this).hasClass('curent'))
								{
									$('.ben-tabs td').removeClass('curent');
									$(this).addClass('curent');
									showTabItem($(this).attr("ref"));
								}
                            });
							/*$('.webcam').click(function(e) {
                                $f().pause();
								var eid = "webcamform";
								$('body').append('<div id="'+eid+'" style="display:none"></div>');
								$('body').css('overflow','hidden');
								$("#"+eid).attr('title','Webcam');
									$("#"+eid).dialog({
										autoOpen: false,
										show: "blind",
										hide: "explode",
										width: 670,
										height: 595,
										modal: true,
										close:function()
											{
												Webcam.reset();
												Webcam.set({
													width: 258,
													height: 193,
													image_format: 'jpeg',
													jpeg_quality: 90
												});
												Webcam.attach( '#bottomcam' );
												$("#"+eid).remove();
												$('body').css('overflow','auto');
												$('#moviecontent').show();
												$f().play();
												
											},
										buttons: {
											
											'Đóng': function() 
											{
												
												$("#"+eid).dialog( "close" );
												
											},
										}
									});
								
									
									$("#"+eid).html('<div id="my_camera"></div>');
									//$("#"+eid).html($('#bottomcam').html());
									$("#"+eid).dialog("open");
									$('#moviecontent').hide();
									Webcam.reset();
									Webcam.set({
										width: 640,
										height: 480,
										image_format: 'jpeg',
										jpeg_quality: 90
									});
									Webcam.attach( '#my_camera' );
                            });
							$('.cinemaloction').click(function(e) {
								$f().pause();
								var eid = "mediaform";
								$('body').append('<div id="'+eid+'" style="display:none"></div>');
								$('body').css('overflow','hidden');
								$("#"+eid).attr('title','Cinema Location');
									$("#"+eid).dialog({
										autoOpen: false,
										show: "blind",
										hide: "explode",
										width: window.innerWidth,
										height: window.innerHeight,
										modal: true,
										close:function()
											{
												$("#"+eid).remove();
												$('body').css('overflow','auto');
												$('#moviecontent').show();
												$f().play();
											},
										buttons: {
											
											'Đóng': function() 
											{
												
												$("#"+eid).dialog( "close" );
												
											},
										}
									});
									$('#moviecontent').hide();
									$("#"+eid).dialog("open");
									$("#"+eid).html($('#cinemaloction').html());
									
                            });
							$('.ticketprice').click(function(e) {
								
                                $f().pause();
								var eid = "mediaform";
								$('body').append('<div id="'+eid+'" style="display:none"></div>');
								$('body').css('overflow','hidden');
								$("#"+eid).attr('title','Ticket Price');
									$("#"+eid).dialog({
										autoOpen: false,
										show: "blind",
										hide: "explode",
										width: window.innerWidth,
										height: window.innerHeight,
										modal: true,
										close:function()
											{
												$("#"+eid).remove();
												$('body').css('overflow','auto');
												$('#moviecontent').show();
												$f().play();
											},
										buttons: {
											
											'Đóng': function() 
											{
												
												$("#"+eid).dialog( "close" );
												
											},
										}
									});
									$('#moviecontent').hide();
									$("#"+eid).dialog("open");
									$("#"+eid).html($('#ticketprice').html());
								
                            });
							$('.event').click(function(e) {
                                $f().pause();
								var eid = "eventform";
								$('body').append('<div id="'+eid+'" style="display:none"></div>');
								$('body').css('overflow','hidden');
								$("#"+eid).attr('title','Event');
									$("#"+eid).dialog({
										autoOpen: false,
										show: "blind",
										hide: "explode",
										width: window.innerWidth,
										height: window.innerHeight,
										modal: true,
										close:function()
											{
												$("#"+eid).remove();
												$('body').css('overflow','auto');
												$('#moviecontent').show();
												$f().play();
											},
										buttons: {
											
											'Đóng': function() 
											{
												
												$("#"+eid).dialog( "close" );
												
											},
										}
									});
									$('#moviecontent').hide();
									$("#"+eid).dialog("open");
									$("#"+eid).html($('#allbanner').html());
									
                            });
							
							$('.timeshowing').click(function(e) {
                                $f().pause();
								var eid = "mediaform";
								$('body').append('<div id="'+eid+'" style="display:none"></div>');
								$('body').css('overflow','hidden');
								$("#"+eid).attr('title','Time Show');
									$("#"+eid).dialog({
										autoOpen: false,
										show: "blind",
										hide: "explode",
										width: window.innerWidth,
										height: window.innerHeight,
										modal: true,
										close:function()
											{
												$("#"+eid).remove();
												$('body').css('overflow','auto');
												$('#moviecontent').show();
												$f().play();
											},
										buttons: {
											
											'Đóng': function() 
											{
												
												$("#mediaform").dialog( "close" );
												
											},
										}
									});
									$('#moviecontent').hide();
									$("#"+eid).dialog("open");
									$("#"+eid).html($('#timeshowing').html());
                            });*/
							function showTabItem(str)
							{
								//$('.ben-tabs td').removeClass('curent');
								//$('.'+str).addClass('curent');
								$(".ben-tabs-item").hide(function(){
									$('#'+str).show();
									//var html = $('#'+str).html();
									
									//html=html.replace(/<video/g,'<embed');
									//html=html.replace(/\/video/g,'/embed');
									//alert(html)
									//$(".ben-tabs-show").html(html);
									//$(".ben-tabs-show").fadeIn('slow',function(){
										//$('.ben-tabs-show video').each(function(index, element) {
                                           
                                        //});
										
										//$('.ben-tabs-show video').removeAttr("controls");
										//$('.ben-tabs-show video').attr("autoplay","autoplay");
									//});
								})
								
								
								
							}
							showTabItem('movieinfo');
							function showFilm(id)
							{
								/*$('#ben-main-banner').attr('src',$('#film'+pos+' #banner').html());
								$('#timeshowing').html($('#film'+pos+' #film_timeshowing').html());
								$('#cinemaloction').html($('#film'+pos+' #film_cinemaloction').html());
								$('#movieinfo').html($('#film'+pos+' #film_movieinfo').html());
								$('#ticketprice').html($('#film'+pos+' #film_ticketprice').html());*/
								//var id = arrkey[pos];
								
								$.getJSON("?route=services/movies/getMovies",
									{
										col:'id',
										val:id
									},
									function(data)
									{
										//alert(data.movies[0].moviename)
										$(".ben-tabs-show").html('');
										$('#ben-main-banner').attr('src',data.movies[0].bannerthumbnail);
										$('#imagefilm').attr('src',data.movies[0].imagethumbnail);
										$('#moviecontent').html('<a href="'+data.movies[0].movieinfo_path+'" class="player" style="display:block;width:721px;height:420px;z-index:0" id="player"></a>');
										flowplayer("player", "<?php echo DIR_COMPONENT?>flowplayer/flowplayer-3.2.18.swf", {
											clip: {
												// these two configuration variables does the trick
												autoPlay: true,
												autoBuffering: true // <- do not place a comma here
											},
											onLoad: function() {
												//$("#moviecontent object").attr("wmode","transparent");
											},
											onFinish: function() {
												
												
												//alert( 'player unloaded upon onFinish()');
												this.unload();
												cur++
												showFilm1(cur);
											},
											onError: function(){
												
												this.unload();
												cur++
												showFilm1(cur);
											},
											// disable Fullscreen
											onBeforeFullscreen:function() {
												return false;
											},
											
											// disable default controls
       										//plugins: {controls: null},
											/*onBeforePause: function() {
												return false;
											}*/
										});
										
										//$('#moviecontent').html(data.movies[0].movieinfo);
										
										/*jwplayer("moviecontent").setup({
        
											file: data.movies[0].movieinfo_path,
											height: 479,
											width: 820,
											autostart: true,
											modes: [
												
												{ type: "flash", src: "<?php echo DIR_COMPONENT?>player/player.swf" }
											],
											onComplete:function(event) { alert('Complete!'); return true; }
										});
										jwplayer("moviecontent").play();
   										jwplayer().onComplete( function(event) { alert('Complete!'); return true; } );*/
										$('#timeshowing').html(data.movies[0].timeshow);
										//$('#cinemaloction').html(data.movies[0].cinemalocation);
										//$('#ticketprice').html(data.movies[0].ticketprice);
										showTabItem('movieinfo');
										/*$('embed').attr('width','820');
										$('embed').attr('height','479');*/
									});
								
							}
							
							var countfilm = Number("<?php echo count($listfilm)?>");
							
							
							function showFilm1(pos)
							{
								if(pos >= countfilm)
									pos = 0;
								//alert(pos);
								cur=pos;
								showFilm(arrkey[pos]);
								//setTimeout('runShowFilm('+ Number(pos+1) +')',180*1000);
							}
							function runShowFilm(pos)
							{
								if(pos >= arrkey.length)
									pos = 0;
								//alert(pos);
								showFilm(arrkey[pos]);
								//t = setTimeout('runShowFilm('+ Number(pos+1) +')',20000);
							}
							var cur = 0;
							showFilm1(cur);
							//runShowFilm(arrkey[0])
							</script>
                            
                            
                            
                            
                           
                        </div>
                        
                    </div>
                    <div id="comingsoon">
                    	<div  class="ben-show-title ben-left">
                            <img src="view/skin1/image/comingsoon.png">
                        </div>
                        <div class="marquee ben-right" id="mycrawlercoming">
                            <table class="ben-table-run">
                                <tr>
                                    <?php foreach($listfilmcoming as $key => $film){ ?>
                                    <td>
                                        <a onclick="showFilm1(<?php echo $pindex++ ?>)"><img src="<?php echo $film['iconethumbnail']?>" width="196" height="304" /></a>
                                    </td>
                                    <script language="javascript">
                                        arrkey.push("<?php echo $film['id']?>");
                                    </script>
                                    <?php } ?>
                                </tr>
                            </table>
                        </div>
                        <div class="clearer"></div>
                    </div>
                    
                    
                    <div id="ben-header-bottom"></div>
                    <div class="ben-info-banner ben-item">
                    	<?php if($Webcam){ ?>
                        <table class="table-promotion">
                            <tr>
                                <?php for($i=1;$i<=3;$i++){ ?>
                                <td><a onclick="$('#ben-main-banner').attr('src',$('#qcbanner<?php echo $i?>').html());clearTimeout(t);"><img src="<?php echo HTTP_IMAGE.$qc[$i]['filepath']?>" width="258" height="143" /></a></td>
                                <?php }?>
                                <td>
                                	<div id="camview">
                                		<div id="bottomcam"></div>
                                    </div>
                                </td>
                            </tr>
                            
                        </table>
<script language="javascript">
$(document).ready(function(e) {
    Webcam.set({
		width: 258,
		height: 193,
		image_format: 'jpeg',
		jpeg_quality: 90
	});
	Webcam.attach( '#bottomcam' );
});

</script>
                        <?php }else{?>
                        <table class="table-promotion">
                            <tr>
                                <?php for($i=1;$i<=4;$i++){ ?>
                                <td><a onclick="$('#ben-main-banner').attr('src',$('#qcbanner<?php echo $i?>').html());clearTimeout(t);"><img src="<?php echo HTTP_IMAGE.$qc[$i]['filepath']?>" width="258" height="143" /></a></td>
                                <?php }?>
                                
                            </tr>
                            
                        </table>
                        <?php } ?>
                        <div style="display:none">
                            <?php for($i=1;$i<=6;$i++){ ?>
                            <div id="qcbanner<?php echo $i?>">
                                <?php echo HTTP_IMAGE.$qcbanner[$i]['filepath']?>
                            </div>
                            <?php }?>
                        </div>
                        <div id="allbanner" style="display:none">
                            <?php for($i=1;$i<=6;$i++){ ?>
                            <div class="qcbanner ben-left">
                                <a onclick="$('#ben-main-banner').attr('src',$('#qcbanner<?php echo $i?>').html());clearTimeout(t);closeEvent();"><img src="<?php echo HTTP_IMAGE.$qcbanner[$i]['filepath']?>" width="258" height="143"></a>
                            </div>
                            <?php }?>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
            </div>
