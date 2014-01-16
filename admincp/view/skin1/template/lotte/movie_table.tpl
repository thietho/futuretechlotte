				<?php echo $pager?>
                <table class="data-table" cellpadding="0" cellspacing="0">
                <thead>
                    <tr class="tr-head">
                    	<?php if($dialog!=true){ ?>
                        <th width="1%">
                        	
                        	<input id="inputchk" type="checkbox" onclick="$('input[name*=\'delete\']').attr('checked', this.checked);">
                           
                        </th>
                        <?php } ?>
                        <th>STT</th>
                        <th>Tên film</th>
                        <th>Icon</th>
                        <th>Banner</th>
                        <th>Hình</th>
                        
                        <?php if($dialog!=true){ ?>
                        <th>Control</th>     
                        <?php } ?>
                    </tr>
                </thead>
                <tbody>
        
        
        <?php
            foreach($datas as $key => $item)
            {
        ?>
                    <tr class="item" id="<?php echo $item['id']?>" moviename="<?php echo $item['moviename']?>" icone="<?php echo $item['icone']?>" banner="<?php echo $item['banner']?>" image="<?php echo $item['image']?>">
                    	<?php if($dialog!=true){ ?>
                        <td class="check-column"><input class="inputchk" type="checkbox" name="delete[<?php echo $item['id']?>]" value="<?php echo $item['id']?>" ></td>
                        <?php } ?>
                        <td><?php echo $key+1 ?></td>
                        <td><?php echo $item['moviename']?></td>
                        <td><?php echo $item['icone']?></td>
        				<td><?php echo $item['banner']?></td>
                        <td><?php echo $item['image']?></td>
                       	
                        <?php if($dialog!=true){ ?>
                        <td class="link-control">
                            <?php if($this->user->checkPermission("quanlykho/sanpham/update")==true){ ?>
                            <input type="button" class="button" name="btnEdit" value="<?php echo $item['text_edit']?>" onclick="showNhaCungCapForm(<?php echo $item['id']?>,'searchForm()')"/>
                            <?php } ?>
                           
                            
                        </td>
                        <?php } ?>
                    </tr>
        <?php
            }
        ?>
                        
                                                    
                </tbody>
                </table>
                <?php echo $pager?>

<?php if($dialog){ ?>
<script language="javascript">
	intSelectMovie()
</script>
<?php } ?>