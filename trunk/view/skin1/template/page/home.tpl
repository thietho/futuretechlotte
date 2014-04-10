			<div class="ben-section">
            	<div id="ben-maincontent">
                	<div >
                    	<img id="ben-main-banner" src="<?php echo $listfilm[0]['bannerthumbnail']?>" width="1080px" height="486px"/>
                    </div>
                    <div id="ben-info-right">
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
						<div id="nowshowing"><center><h2>NOW SHOWING</h2></center></div>
                    	<div class="marquee" id="mycrawler">

                            <table>
                                <tr>
                                    <?php foreach($listfilm as $key => $film){ ?>
                                    <td>
                                        <a onclick="clearTimeout(t);showFilm(<?php echo $key?>)"><img src="<?php echo $film['iconethumbnail']?>" width="173" height="173" /></a>
                                    </td>
                                    <script language="javascript">
										arrkey["<?php echo $key?>"] = "<?php echo $film['id']?>";
									</script>
                                    <?php } ?>
                                    
                                    
                                </tr>
                            </table>
                            
                            
                            
                        </div>
                        <script type="text/javascript">
$(document).ready(function(e) {
	
    setTimeout('runbanner()',1000);

});
function runbanner()
{
	marqueeInit({
		uniqueid: 'mycrawler',
		style: {
			
			
			'height': '173px',
			'width': '100%',
			
		},
		inc: 5, //speed - pixel increment for each iteration of this marquee's movement
		mouse: 'cursor driven', //mouseover behavior ('pause' 'cursor driven' or false)
		moveatleast: 2,
		neutral: 150,
		savedirection: true,
		random: true
	})
}
</script>
                    </div>
                    <div id="ben-info">
                    	<div id="ben-info-left" >
                        	<div id="ben-info-movie" class="ben-item">
                            	<table class="ben-tabs">
                                	<tr>
                                    	<td class="timeshowing" ref="timeshowing">
                                        	<img src="view/skin1/image/timeshowing.png" />
                                        </td>
                                        <td class="cinemaloction" ref="cinemaloction">
                                        	<img src="view/skin1/image/cinemaloction.png" />
                                        </td>
                                        <td ref="movieinfo" class="movieinfo curent">
                                        	<img src="view/skin1/image/movieinfo.png" />
                                        </td>
                                        <td class="ticketprice" ref="ticketprice">
                                        	<img src="view/skin1/image/ticketprice.png" />
                                        </td>
                                    </tr>
                                </table>
                                <div class="ben-tabs-show">
                                	
                                </div>
                                <div id="timeshowing" class="ben-tabs-item">
                                    
                                </div>
                                <div id="cinemaloction" class="ben-tabs-item">
                                    <center><img src="<?php echo HTTP_IMAGE.$CinemaLocation['filepath']?>" /></center>
                                </div>
                                <div id="movieinfo" class="ben-tabs-item">
                                    <div id="movieinfo-image" class="ben-left">
                                    	<table height="560px">
                                        	<tr>
                                            	<td>
                                        			<img id="imagefilm" src="<?php echo $listfilm[0]['imagethumbnail']?>" width="214px"/>
                                                </td>
                                        	</tr>
                                        </table>
                                    </div>
                                    <div id="moviecontent" class="ben-right">
                                        <?php echo html_entity_decode($listfilm[0]['movieinfo'])?>
                                    </div>
                                    <div class="clearer">&nbsp;</div>
                                </div>
                                <div id="ticketprice" class="ben-tabs-item">
                                    <center><img src="<?php echo HTTP_IMAGE.$TicketPrice['filepath']?>" /></center>
                                </div>
                            </div>
                            
                            
                            <script language="javascript">
							$('.ben-tabs td').click(function(e) {
								//$('.ben-tabs td').removeClass('curent');
								//$(this).addClass('curent');
                                showTabItem($(this).attr("ref"));
								
                            });
							function showTabItem(str)
							{
								$('.ben-tabs td').removeClass('curent');
								$('.'+str).addClass('curent');
								$(".ben-tabs-show").fadeOut('slow',function(){
									var html = $('#'+str).html();
									
									//html=html.replace(/<video/g,'<embed');
									//html=html.replace(/\/video/g,'/embed');
									//alert(html)
									$(".ben-tabs-show").html(html);
									$(".ben-tabs-show").fadeIn('slow',function(){
										//$('.ben-tabs-show video').each(function(index, element) {
                                           
                                        //});
										
										//$('.ben-tabs-show video').removeAttr("controls");
										//$('.ben-tabs-show video').attr("autoplay","autoplay");
									});
								})
								
								
								
							}
							showTabItem('movieinfo');
							function showFilm(pos)
							{
								/*$('#ben-main-banner').attr('src',$('#film'+pos+' #banner').html());
								$('#timeshowing').html($('#film'+pos+' #film_timeshowing').html());
								$('#cinemaloction').html($('#film'+pos+' #film_cinemaloction').html());
								$('#movieinfo').html($('#film'+pos+' #film_movieinfo').html());
								$('#ticketprice').html($('#film'+pos+' #film_ticketprice').html());*/
								var id = arrkey[pos];
								
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
										$('#moviecontent').html(data.movies[0].movieinfo);
										
										$('#timeshowing').html(data.movies[0].timeshow);
										//$('#cinemaloction').html(data.movies[0].cinemalocation);
										//$('#ticketprice').html(data.movies[0].ticketprice);
										showTabItem('movieinfo');
										$('embed').attr('width','820');
										$('embed').attr('height','461');
									});
								
							}
							
							var countfilm = Number("<?php echo count($listfilm)?>");
							
							var t;
							function showFilm1(pos)
							{
								if(pos >= countfilm)
									pos = 0;
								//alert(pos);
								showFilm(pos);
								setTimeout('runShowFilm('+ Number(pos+1) +')',180*1000);
							}
							function runShowFilm(pos)
							{
								if(pos >= countfilm)
									pos = 0;
								//alert(pos);
								showFilm(pos);
								t = setTimeout('runShowFilm('+ Number(pos+1) +')',20000);
							}
							
							runShowFilm(0)
							</script>
                            
                            
                            
                            <div class="ben-info-banner ben-item">
                            	<table>
                                	<tr>
                                    	<?php for($i=1;$i<=4;$i++){ ?>
                                    	<td><a onclick="$('#ben-main-banner').attr('src',$('#qcbanner<?php echo $i?>').html());clearTimeout(t);"><img src="<?php echo HTTP_IMAGE.$qc[$i]['filepath']?>" width="250" height="250" /></a></td>
                                        <?php }?>
                                    </tr>
                                </table>
                            	<div style="display:none">
                                	<?php for($i=1;$i<=4;$i++){ ?>
                                    <div id="qcbanner<?php echo $i?>">
                                    	<?php echo HTTP_IMAGE.$qcbanner[$i]['filepath']?>
                                    </div>
                                    <?php }?>
                                </div>
                            </div>
                           
                        </div>
                        
                    </div>
                </div>
            </div>