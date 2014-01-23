			<div class="ben-section">
            	<div id="ben-maincontent">
                	<div id="ben-main-banner">
                    	<img src="<?php echo $curentfilm['bannerthumbnail']?>" width="1045px" height="540px"/>
                		
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
                                        <a href="?pos=<?php echo $key?>"><img src="<?php echo $film['iconethumbnail']?>" width="173" height="173" /></a>
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
                                    	<td ref="timeshowing">
                                        	<img src="view/skin1/image/timeshowing.png" />
                                        </td>
                                        <td ref="cinemaloction">
                                        	<img src="view/skin1/image/cinemaloction.png" />
                                        </td>
                                        <td ref="movieinfo" class="curent">
                                        	<img src="view/skin1/image/movieinfo.png" />
                                        </td>
                                        <td ref="ticketprice">
                                        	<img src="view/skin1/image/ticketprice.png" />
                                        </td>
                                    </tr>
                                </table>
                                <div class="ben-tabs-show">
                                	
                                </div>
                                <div id="timeshowing" class="ben-tabs-item">
                                    <?php echo html_entity_decode($curentfilm['timeshow'])?>
                                </div>
                                <div id="cinemaloction" class="ben-tabs-item">
                                    <?php echo html_entity_decode($curentfilm['cinemalocation'])?>
                                </div>
                                <div id="movieinfo" class="ben-tabs-item">
                                    <div id="movieinfo-image" class="ben-left">
                                        <img src="<?php echo $curentfilm['imagethumbnail']?>" width="214px" height="403px"/>
                                    </div>
                                    <div id="moviecontent" class="ben-right">
                                        <?php echo html_entity_decode($curentfilm['movieinfo'])?>
                                    </div>
                                    <div class="clearer">&nbsp;</div>
                                </div>
                                <div id="ticketprice" class="ben-tabs-item">
                                    <?php echo html_entity_decode($curentfilm['ticketprice'])?>
                                </div>
                            </div>
                            <script language="javascript">
							$('.ben-tabs td').click(function(e) {
								$('.ben-tabs td').removeClass('curent');
								$(this).addClass('curent');
                                showTabItem($(this).attr("ref"));
								
                            });
							function showTabItem(str)
							{
								$(".ben-tabs-show").fadeOut('slow',function(){
									$(".ben-tabs-show").html($('#'+str).html());
									$(".ben-tabs-show").fadeIn('slow');
								})
								
								
								
							}
							showTabItem('movieinfo');
							
							</script>
                            
                            <div class="ben-info-banner ben-item">
                            	<img src="<?php echo HTTP_IMAGE.$qc[1]['filepath']?>" width="765" height="263" />
                            </div>
                            <div class="ben-info-banner ben-item">
                            	<img src="<?php echo HTTP_IMAGE.$qc[2]['filepath']?>" width="765" height="263" />
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>