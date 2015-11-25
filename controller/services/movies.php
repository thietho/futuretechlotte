<?php
class ControllerServicesMovies extends Controller
{	
	public function getMovies()
	{
		
		$col = $this->request->get['col'];
		$val = $this->request->get['val'];
		$operator = $this->request->get['operator'];
		$from = (int)@$this->request->get['from']; 
		$to = (int)@$this->request->get['to'];
		$operator = $this->request->get['operator'];
		if($operator == "")
			$operator = "equal";
		$this->load->model("lotte/movie");
		$this->load->model("core/file");
		$this->load->helper('image');
		$where = "";
		if($col !="")
		{
			switch($operator)
			{
				case "equal":
					$where = " AND ".$col." = '".$val."'";
					break;
				case "like":
					$where = " AND ".$col." like '%".$val."%'";
					break;
				case "other":
					$where = " AND ".$col." <> '".$val."'";
					break;
				case "in":
					$where = " AND ".$col." in  (".$val.")";
					break;
				
			}
		}
		
		$datas = $this->model_lotte_movie->getList($where,$from,$to);
		foreach($datas as $key => $item)
		{
			$film = $this->model_lotte_movie->getItem($item['id']);
				
			$file = $this->model_core_file->getFile($item['icone']);
			$datas[$key]['iconethumbnail'] = HelperImage::resizePNG($file['filepath'], 173, 173);
			
			$file = $this->model_core_file->getFile($item['banner']);
			$datas[$key]['bannerthumbnail'] = HelperImage::resizePNG($file['filepath'], 1045, 540);
			
			$file = $this->model_core_file->getFile($item['image']);
			$datas[$key]['imagethumbnail'] = HelperImage::resizePNG($file['filepath'], 214, 0);
			
			$file = $this->model_core_file->getFile($item['movieinfo']);
			$datas[$key]['movieinfo_path'] = HTTP_IMAGE.$file['filepath'];
			
			
			
			$datas[$key]['timeshow'] = html_entity_decode($item['timeshow']);
			$datas[$key]['cinemalocation'] = html_entity_decode($item['cinemalocation']);
			$datas[$key]['movieinfo'] = html_entity_decode($item['movieinfo']);
			$datas[$key]['ticketprice'] = html_entity_decode($item['ticketprice']);
		}
		
		$this->data['output'] = json_encode(array('movies' => $datas));
		
		
		$this->id="movies";
		$this->template="common/output.tpl";
		$this->render();
	}
}
?>