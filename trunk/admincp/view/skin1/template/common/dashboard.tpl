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
            	<!--<h3>Trang chủ</h3>-->
                 <input type="hidden" id="listselectfile" name="listselectfile" />
                 
                
                
                 <p>
                    <label><?php echo $lbl_image ?></label><br />
                    <div id="brochure">
                        <?php echo $item['brochure']?>
                    </div>
                    <input type="hidden" id="brochure_filepath" name="brochure" value="<?php echo $item['brochure']?>"/>
                    <input type="button" class="button" value="<?php echo $entry_photo ?>" onclick="browserFile('brochure','any')"/>
                    <input type="button" class="button" value="Remove" onclick="$('#brochure_filepath').val('');$('#brochure').html('')"/>
                </p>
                <p>
                    <label>Background</label><br />
                    <div id="background">
                        <?php echo $item['background']?>
                    </div>
                    <input type="hidden" id="background_filepath" name="background" value="<?php echo $item['background']?>"/>
                    <input type="button" class="button" value="<?php echo $entry_photo ?>" onclick="browserFile('background','any')"/>
                    <input type="button" class="button" value="Remove" onclick="$('#background_filepath').val('');$('#background').html('')"/>
                </p>
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
				window.location.reload();
			}
			$.unblockUI();
		}
	);
}

</script>
