<script src="<?php echo DIR_COMPONENT?>flowplayer/flowplayer-3.2.13.min.js"></script>	
<script type="text/javascript" src="<?php echo DIR_COMPONENT?>webcamjs/webcam.js"></script>
            <div class="ben-section">
            	<div id="ben-maincontent">
                	<div >
                    	<img id="ben-main-banner" src="<?php echo $listfilm[0]['bannerthumbnail']?>" width="1080px" height="500px"/>
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
                                        <a onclick="showFilm1(<?php echo $pindex++ ?>)"><img src="<?php echo $film['iconethumbnail']?>" width="196" height="279" /></a>
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
	$('body').css('overflow','hidden');
});
$('body').click(function(e) {
    clearTimeout(t);
	//if($())
	t = setTimeout(function(){
			$('.ben-tabs td').removeClass('curent');
			$('.movieinfo').addClass('curent');
			showTabItem('movieinfo');
			$f().play();
		},30000);
});
function runbanner()
{
	marqueeInit({
		uniqueid: 'mycrawler',
		style: {
			'height': '295px',
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
			'height': '295px',
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
                        	<div id="ben-info-movie" >
                            	
                                <div class="ben-item">
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
									if(!$(this).hasClass('movieinfo'))
										$f().pause();
									else
										$f().play();
									$('.ben-tabs td').removeClass('curent');
									$(this).addClass('curent');
									showTabItem($(this).attr("ref"));
								}
                            });
							
							function showTabItem(str)
							{
								
								$(".ben-tabs-item").fadeOut(function(){
									$('#'+str).fadeIn();
								})
								
								
								
							}
							showTabItem('movieinfo');
							function showFilm(id)
							{	
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
											
										});
										
										
										$('#timeshowing').html(data.movies[0].timeshow);
										showTabItem('movieinfo');
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
                                        <a onclick="showFilm1(<?php echo $pindex++ ?>)"><img src="<?php echo $film['iconethumbnail']?>" width="196" height="279" /></a>
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
                                <td><a onclick="$('#ben-main-banner').attr('src',$('#qcbanner<?php echo $i?>').html());"><img src="<?php echo HTTP_IMAGE.$qc[$i]['filepath']?>" width="258" height="143" /></a></td>
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
