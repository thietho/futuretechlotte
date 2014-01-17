			<div class="ben-section">
            	<div id="ben-maincontent">
                	<div id="ben-main-banner">
                    	<img src="<?php echo $curentfilm['bannerthumbnail']?>" width="1045px" height="540px"/>
                		
                    </div>
                    <div id="ben-info">
                    	<div id="ben-info-left" class="ben-left">
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
                        <div id="ben-info-right" class="ben-right">
                        	<?php foreach($listfilm as $key => $film){ ?>
                        	<div class="film-item ben-item">
                            	<a href="?pos=<?php echo $key?>"><img src="<?php echo $film['iconethumbnail']?>" width="262" height="262" /></a>
                            </div>
                            <?php }?>
                        </div>
                    </div>
                </div>
            </div>