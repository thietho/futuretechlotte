<div class="section" id="sitemaplist">

	<div class="section-title"><?php echo $this->document->title?></div>
    
    <div class="section-content padding1">
    
    	<form name="frm" id="frm" action="<?php echo $action?>" method="post" enctype="multipart/form-data">
        	
            
        	<div class="button right">
            	<input type="button" value="Lưu" class="button" onClick="save('')"/>
                 <input type="button" value="Bỏ qua" class="button" onclick="linkto('?route=quanlykho/phieuxuat')"/>  
     	        <input type="hidden" name="id" value="<?php echo $item['id']?>">
                
            </div>
            <div class="clearer">^&nbsp;</div>
        	<div id="error" class="error" style="display:none"></div>
        	<div id="container">
            	<ul>
                    <li class="tabs-selected"><a href="#fragment-movieinfo" ><span>Movie info</span></a></li>
                    <li><a href="#fragment-timeshow"><span>Time Show</span></a></li>
                    <li><a href="#fragment-cenimalocation"><span>Cenima location</span></a></li>
                    <li><a href="#fragment-ticketprice"><span>Ticket price</span></a></li>
                    
                </ul>
                <div id="fragment-movieinfo">
                	<p>
                        <label>Tên film</label><br />
                        <input type="text" id="tennhacungcap" name="tennhacungcap" value="<?php echo $item['tennhacungcap']?>" class="text" size=60/>
                        
                    </p>
                    <p>
                        <label>Icon</label>
                        
                        <input type="hidden" id="icone_fileid" name="icone_fileid" value="<?php echo $item['icone']?>"/><br />
                        <img id="icone_preview" src=""/>
                        <input type="button" class="button" value="<?php echo $entry_photo ?>" onclick="browserFile('icone','any')"/>
                        
                        
                    </p>
                    <p>
                        <label>Banner</label>
                        <input type="hidden" id="banner_fileid" name="banner_fileid" value="<?php echo $item['banner']?>"/><br />
                        <img id="banner_preview" src=""/>
                        <input type="button" class="button" value="<?php echo $entry_photo ?>" onclick="browserFile('banner','any')"/>
                    </p>
                    <p>
                        <label>Image</label>
                        <input type="hidden" id="image_fileid" name="image_fileid" value="<?php echo $item['image']?>"/><br />
                        <img id="image_preview" src=""/>
                        <input type="button" class="button" value="<?php echo $entry_photo ?>" onclick="browserFile('image','any')"/>
                    </p>
                    <p>
                    	<label>Movie info</label><br />
                    	<textarea class="text" id="movieinfo" name="movieinfo"><?php echo $post['movieinfo']?></textarea>
                    </p>
                    

                </div>
                <div id="fragment-timeshow">
                	<textarea class="text" id="timeshow" name="timeshow"><?php echo $post['timeshow']?></textarea>
                </div>
                <div id="fragment-cenimalocation">
                	<textarea class="text" id="cinemalocation" name="cinemalocation"><?php echo $post['cinemalocation']?></textarea>
                </div>
                <div id="fragment-ticketprice">
                	<textarea class="text" id="ticketprice" name="ticketprice"><?php echo $post['ticketprice']?></textarea>
                </div>
            </div>
            
        </form>
    
    </div>
    
</div>
<script type="text/javascript" charset="utf-8">
function save()
{
	$.blockUI({ message: "<h1><?php echo $announ_infor ?></h1>" }); 
	var oEditor = CKEDITOR.instances['editor1'] ;
	var pageValue = oEditor.getData();
	$('textarea#editor1').val(pageValue);
	<?php if($hasSummary) {?>
	var oEditor = CKEDITOR.instances['summary'] ;
	var pageValue = oEditor.getData();
	$('textarea#summary').val(pageValue);
	<?php } ?>
	$.post("?route=core/postcontent/savepost",$('#frmPost').serialize(),
		function(data){
			if(data=="true")
			{
				window.location = "<?php echo $DIR_CANCEL.'&page='.$_GET['page']?>";
				
			}
			else
			{
				$('#error').html(data).show('slow');
				$.unblockUI();
			}
			
		});
}




$(document).ready(function() { 
	setCKEditorType('movieinfo',2);
	setCKEditorType('timeshow',2);
	setCKEditorType('cinemalocation',2);
	setCKEditorType('ticketprice',2);
	$('#container').tabs({ fxSlide: true, fxFade: true, fxSpeed: 'slow' });
	
});
</script>

