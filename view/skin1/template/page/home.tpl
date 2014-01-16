			<div class="ben-section">
            	<div id="ben-maincontent">
                	<div id="ben-main-banner">
                		<img src="view/skin1/image/bannermain.png" />
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
                                    Time Show
                                </div>
                                <div id="cinemaloction" class="ben-tabs-item">
                                    Cinema location
                                </div>
                                <div id="movieinfo" class="ben-tabs-item">
                                    <div id="movieinfo-image" class="ben-left">
                                        <img src="view/skin1/image/movieimage.png" />
                                    </div>
                                    <div id="moviecontent" class="ben-right">
                                        Sau khi vị chủ tướng của mình bị giết oan, 47 ronin (hay còn được gọi là lãng nhân) đã cùng nhau lên kế hoạch trả thù cho sư phụ của mình đồng thời lấy lại danh dự cho thế giới samurai. Từ quê hương, họ lên đường vượt qua nghìn trùng để tìm kiếm sự giúp đỡ của Kai (Reeves), người đã từng bị họ từ chối gia nhập nhóm Ronin.
Những lãng nhân này phải đối mặt với những thế lực đầy mờ ám nơi những kẻ khủng bố cùng những truyền nhân mang trong mình ma thuật cao cường luôn vây quanh nhằm hãm hại và tiêu diệt họ.
                                        <center>
                                        	
                                            <video width="100%"  controls>
                                              <source src="view/skin1/video/47 Ronin - Official Trailer (HD) Keanu Reeves.MP4" type="video/mp4">
                                              
                                            Your browser does not support the video tag.
                                            </video>
                                        </center>
                                        Sau khi vị chủ tướng của mình bị giết oan, 47 ronin (hay còn được gọi là lãng nhân) đã cùng nhau lên kế hoạch trả thù cho sư phụ của mình đồng thời lấy lại danh dự cho thế giới samurai. Từ quê hương, họ lên đường vượt qua nghìn trùng để tìm kiếm sự giúp đỡ của Kai (Reeves), người đã từng bị họ từ chối gia nhập nhóm Ronin.
Những lãng nhân này phải đối mặt với những thế lực đầy mờ ám nơi những kẻ khủng bố cùng những truyền nhân mang trong mình ma thuật cao cường luôn vây quanh nhằm hãm hại và tiêu diệt họ.
Sau khi vị chủ tướng của mình bị giết oan, 47 ronin (hay còn được gọi là lãng nhân) đã cùng nhau lên kế hoạch trả thù cho sư phụ của mình đồng thời lấy lại danh dự cho thế giới samurai. Từ quê hương, họ lên đường vượt qua nghìn trùng để tìm kiếm sự giúp đỡ của Kai (Reeves), người đã từng bị họ từ chối gia nhập nhóm Ronin.
Những lãng nhân này phải đối mặt với những thế lực đầy mờ ám nơi những kẻ khủng bố cùng những truyền nhân mang trong mình ma thuật cao cường luôn vây quanh nhằm hãm hại và tiêu diệt họ.
Sau khi vị chủ tướng của mình bị giết oan, 47 ronin (hay còn được gọi là lãng nhân) đã cùng nhau lên kế hoạch trả thù cho sư phụ của mình đồng thời lấy lại danh dự cho thế giới samurai. Từ quê hương, họ lên đường vượt qua nghìn trùng để tìm kiếm sự giúp đỡ của Kai (Reeves), người đã từng bị họ từ chối gia nhập nhóm Ronin.
Những lãng nhân này phải đối mặt với những thế lực đầy mờ ám nơi những kẻ khủng bố cùng những truyền nhân mang trong mình ma thuật cao cường luôn vây quanh nhằm hãm hại và tiêu diệt họ.
                                        
                                    </div>
                                    <div class="clearer">&nbsp;</div>
                                </div>
                                <div id="ticketprice" class="ben-tabs-item">
                                    Ticet price
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
                            	<img src="view/skin1/image/banner1.png" width="765" height="263" />
                            </div>
                            <div class="ben-info-banner ben-item">
                            	<img src="view/skin1/image/banner2.png" width="765" height="263" />
                            </div>
                        </div>
                        <div id="ben-info-right" class="ben-right">
                        	<div class="film-item ben-item">
                            	<img src="view/skin1/image/film1.png" width="262" height="262" />
                            </div>
                            <div class="film-item ben-item">
                            	<img src="view/skin1/image/film2.png" width="262" height="262" />
                            </div>
                            <div class="film-item ben-item">
                            	<img src="view/skin1/image/film3.png" width="262" height="262" />
                            </div>
                            <div class="film-item ben-item">
                            	<img src="view/skin1/image/film4.png" width="262" height="262" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>