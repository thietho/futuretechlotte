<div class="section" id="sitemaplist">

	<div class="section-title"><?php echo $dash_header ?></div>
    
    <div class="section-content padding1">
    
    	<form name="frm" id="frm" action="<?php echo $action?>" method="post" enctype="multipart/form-data">
        
        	<div class="button right">
            	<input type="button" value="<?php echo $button_save ?>" class="button" onClick="save()"/>   
     	        <input type="hidden" name="mediaid" value="<?php echo $item['mediaid']?>">
                
            </div>
            <div class="clearer">^&nbsp;</div>
        	<div id="error" class="error" style="display:none"></div>
        	<div>
            	<h3><?php echo $dash_infor_header ?></h3><br />
            	<p>
            		<label><?php echo $dash_title ?></label><br />
					<input type="text" name="Title" value="<?php echo $item['Title']?>" class="text" size=60 />
            	</p>
                <p>
            		<label><?php echo $dash_slogan ?></label><br />
					<input type="text" name="Slogan" value="<?php echo $item['Slogan']?>" class="text" size=60 />
            	</p>
                  
                <p>
            		<label><?php echo $dash_currency ?></label><br />
					<input type="text" name="Currency" value="<?php echo $item['Currency']?>" class="text" size=60 />
            	</p>
                
                <p>
            		<label><?php echo $dash_email ?></label><br />
					<input type="text" name="EmailContact" value="<?php echo $item['EmailContact']?>" class="text" size=60 />
            	</p>
                <p>
                    <label>Keyword</label><br />
                    <textarea name="Keyword"><?php echo $item['Keyword']?></textarea>
                        
                </p>
				<p>
                    <label>Mô tả</label><br />
                    <textarea name="Description"><?php echo $item['Description']?></textarea>
                        
                </p>
            </div>
            <div>
            	<?php for($i=1;$i<=5;$i++){?>
            	<p>
                    <label>Film <?php echo $i?></label>
                    <input type="hidden" id="film<?php echo $i?>" name="film<?php echo $i?>" value="<?php echo $film[$i]['id']?>"/>
                    <span id="film<?php echo $i?>_name"><?php echo $film[$i]['moviename']?></span>
                    <img id="film<?php echo $i?>_icon" src="<?php echo $film[$i]['iconethumbnail']?>"/>
                    <input type="button" class="button" value="Chọn film" onclick="selectFilm('film<?php echo $i?>')"/>
                        
                </p>
                <?php }?>
                
                <?php for($i=1;$i<=4;$i++){?>
            	<p>
                    <label>Quảng cáo <?php echo $i?>(250px x 250px)</label>
                    <input type="hidden" id="qc<?php echo $i?>_fileid" name="qc<?php echo $i?>_fileid" value="<?php echo $qc[$i]['fileid']?>"/><br />
                        <img id="qc<?php echo $i?>_preview" src="<?php echo $qc[$i]['imagethumbnail']?>"/>
                        <input type="button" class="button" value="<?php echo $entry_photo ?>" onclick="browserFile('qc<?php echo $i?>','single')"/>
                        
                </p>
                <?php }?>
            </div>
        </form>
    
    </div>
    
</div>

<script language="javascript">

function save()
{
	$.blockUI({ message: "<h1><?php echo $announ_infor ?></h1>" }); 
	/*var oEditor = CKEDITOR.instances['editor1'] ;
	var pageValue = oEditor.getData();
	$('textarea#editor1').val(pageValue);*/
	$.post("?route=common/dashboard/save", $("#frm").serialize(),
		function(data){
			if(data == "true")
			{
				//window.location.reload();
			}
			$.unblockUI();
		}
	);
}
function intSelectMovie()
{
	$('.item').click(function(e) {
        var eid = $('#handler').val();
		$('#'+eid).val($(this).attr('id'));
		$('#'+eid+'_name').html($(this).attr('moviename'));
		$('#'+eid+'_icon').attr('src',$(this).attr('icone'));
		
		$("#filmform").dialog( "close" );
    });
}
</script>
