			<div class="ben-section">
            	<div id="ben-maincontent">
                	<div >
                    	<img id="ben-main-banner" src="<?php echo $listfilm[0]['bannerthumbnail']?>" width="1045px" height="540px"/>
                    </div>
                    <div id="ben-info-right">
                    	<style>
						#ben-sileshowproduct img
						{
							margin-right:10px;	
						}
						</style>
						<script type='text/javascript' language='javascript' src='<?php echo HTTP_SERVER.DIR_VIEW?>js/crawler.js'></script>
                    	<div class="marquee" id="mycrawler">

                            <table>
                                <tr>
                                    <?php foreach($listfilm as $key => $film){ ?>
                                    <td>
                                        <a onclick="clearTimeout(t);runShowFilm(<?php echo $key?>)"><img src="<?php echo $film['iconethumbnail']?>" width="173" height="173" /></a>
                                    </td>
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
			
			
			'height': '208px',
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
                                    <?php echo html_entity_decode($listfilm[0]['timeshow'])?>
                                </div>
                                <div id="cinemaloction" class="ben-tabs-item">
                                    <?php echo html_entity_decode($listfilm[0]['cinemalocation'])?>
                                </div>
                                <div id="movieinfo" class="ben-tabs-item">
                                    <div id="movieinfo-image" class="ben-left">
                                        <img src="<?php echo $listfilm[0]['imagethumbnail']?>" width="214px" height="403px"/>
                                    </div>
                                    <div id="moviecontent" class="ben-right">
                                        <?php echo html_entity_decode($listfilm[0]['movieinfo'])?>
                                    </div>
                                    <div class="clearer">&nbsp;</div>
                                </div>
                                <div id="ticketprice" class="ben-tabs-item">
                                    <?php echo html_entity_decode($listfilm[0]['ticketprice'])?>
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
									$(".ben-tabs-show").html($('#'+str).html());
									$(".ben-tabs-show").fadeIn('slow');
								})
								
								
								
							}
							showTabItem('movieinfo');
							function showFilm(pos)
							{
								$('#ben-main-banner').attr('src',$('#film'+pos+' #banner').html());
								$('#timeshowing').html($('#film'+pos+' #film_timeshowing').html());
								$('#cinemaloction').html($('#film'+pos+' #film_cinemaloction').html());
								$('#movieinfo').html($('#film'+pos+' #film_movieinfo').html());
								$('#ticketprice').html($('#film'+pos+' #film_ticketprice').html());
								showTabItem('movieinfo');
							}
							
							var countfilm = Number("<?php echo count($listfilm)?>");
							
							var t;
							function runShowFilm(pos)
							{
								if(pos >= countfilm)
									pos = 0;
								//alert(pos);
								showFilm(pos);
								t = setTimeout('runShowFilm('+ Number(pos+1) +')',5000);
							}
							runShowFilm(0)
							</script>
                            
                            <div style="display:none">
                            	<?php foreach($listfilm as $key => $film){ ?>
                            	<div id="film<?php echo $key?>">
                                	<div id="banner"><?php echo $film['bannerthumbnail']?></div>
                                    <div id="film_timeshowing">
                                    	<?php echo html_entity_decode($film['timeshow'])?>
                                    </div>
                                    <div id="film_cinemaloction">
                                        <?php echo html_entity_decode($film['cinemalocation'])?>
                                    </div>
                                    <div id="film_movieinfo">
                                        <div id="movieinfo-image" class="ben-left">
                                            <img src="<?php echo $film['imagethumbnail']?>" width="214px" height="403px"/>
                                        </div>
                                        <div id="moviecontent" class="ben-right">
                                            <?php echo html_entity_decode($film['movieinfo'])?>
                                        </div>
                                        <div class="clearer">&nbsp;</div>
                                    </div>
                                    <div id="film_ticketprice" class="ben-tabs-item">
                                        <?php echo html_entity_decode($film['ticketprice'])?>
                                    </div>
                                </div>
                                <?php } ?>
                            </div>
                            <div class="ben-info-banner ben-item">
                            	<table>
                                	<tr>
                                    	<?php for($i=1;$i<=4;$i++){ ?>
                                    	<td><img src="<?php echo HTTP_IMAGE.$qc[$i]['filepath']?>" width="250" height="250" /></td>
                                        <?php }?>
                                    </tr>
                                </table>
                            	
                            </div>
                           
                        </div>
                        
                    </div>
                </div>
            </div>