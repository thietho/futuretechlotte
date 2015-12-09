<?php
class ControllerCommonDashboard extends Controller
{
	function __construct() 
	{
		$this->data['numbanner'] = 6;
		$this->load->helper('image');
	}
	function index()
	{	
		$this->getForm();
		$this->id='content';
		$this->template='common/dashboard.tpl';
		$this->layout="layout/center";
		$this->render();
	}
	
	private function getForm()
	{
		
		$this->load->model("core/media");
		$this->load->model("core/category");
		$this->load->model("lotte/movie");
		$this->data['item']['mediaid'] = "setting";
		$this->data['item']['Title'] = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'Title');
		$this->data['item']['Slogan'] = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'Slogan');
		$this->data['item']['Currency'] = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'Currency');
		$this->data['item']['EmailContact'] = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'EmailContact');
		$this->data['item']['Keyword'] = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'Keyword');
		$this->data['item']['Description'] = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'Description');
		
		
		$this->data['item']['brochure'] = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'brochure');
		$this->data['item']['background'] = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'background');
		$listfilm = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'listfilm');
		$arr_filmid = split(',',$listfilm);
		foreach($arr_filmid as $i => $filmid)
		{
			//$filmid = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'film'.$i);
			$this->data['data_listfilm'][$i] = $this->model_lotte_movie->getItem($filmid);
			
			$file = $this->model_core_file->getFile($this->data['data_listfilm'][$i]['icone']);
			$this->data['data_listfilm'][$i]['iconethumbnail'] = HelperImage::resizePNG($file['filepath'], 100, 0);
			
			$file = $this->model_core_file->getFile($this->data['data_listfilm'][$i]['banner']);
			$this->data['data_listfilm'][$i]['bannerthumbnail'] = HelperImage::resizePNG($file['filepath'], 100, 0);
			
			$file = $this->model_core_file->getFile($this->data['data_listfilm'][$i]['image']);
			$this->data['data_listfilm'][$i]['imagethumbnail'] = HelperImage::resizePNG($file['filepath'], 100, 0);
		}
		
		$listfilm = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'listfilmcoming');
		$arr_filmid = split(',',$listfilm);
		foreach($arr_filmid as $i => $filmid)
		{
			//$filmid = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'film'.$i);
			$this->data['data_listfilmcoming'][$i] = $this->model_lotte_movie->getItem($filmid);
			
			$file = $this->model_core_file->getFile($this->data['data_listfilmcoming'][$i]['icone']);
			$this->data['data_listfilmcoming'][$i]['iconethumbnail'] = HelperImage::resizePNG($file['filepath'], 100, 0);
			
			$file = $this->model_core_file->getFile($this->data['data_listfilmcoming'][$i]['banner']);
			$this->data['data_listfilmcoming'][$i]['bannerthumbnail'] = HelperImage::resizePNG($file['filepath'], 100, 0);
			
			$file = $this->model_core_file->getFile($this->data['data_listfilmcoming'][$i]['image']);
			$this->data['data_listfilmcoming'][$i]['imagethumbnail'] = HelperImage::resizePNG($file['filepath'], 100, 0);
		}
		
		for($i=1;$i<=$this->data['numbanner'];$i++)
		{	
			$fileid = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'qc'.$i);	
			$this->data['qc'][$i] = $this->model_core_file->getFile($fileid);
			$this->data['qc'][$i]['imagethumbnail'] = HelperImage::resizePNG($this->data['qc'][$i]['filepath'], 100, 0);
			$fileid = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'qcbanner'.$i);	
			$this->data['qcbanner'][$i] = $this->model_core_file->getFile($fileid);
			$this->data['qcbanner'][$i]['imagethumbnail'] = HelperImage::resizePNG($this->data['qcbanner'][$i]['filepath'], 100, 0);
			
		}
		$fileid = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'CinemaLocation');	
		$this->data['CinemaLocation'] = $this->model_core_file->getFile($fileid);
		$this->data['CinemaLocation']['imagethumbnail'] = HelperImage::resizePNG($this->data['CinemaLocation']['filepath'], 100, 0);
		
		$fileid = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'TicketPrice');	
		$this->data['TicketPrice'] = $this->model_core_file->getFile($fileid);
		$this->data['TicketPrice']['imagethumbnail'] = HelperImage::resizePNG($this->data['TicketPrice']['filepath'], 100, 0);
		
		$fileid = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'Event');	
		$this->data['Event'] = $this->model_core_file->getFile($fileid);
		$this->data['Event']['imagethumbnail'] = HelperImage::resizePNG($this->data['Event']['filepath'], 100, 0);
		
		$this->data['Webcam'] = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'Webcam');	
		
	}
	
	public function save()
	{
		$data = $this->request->post;
		
		$this->load->model("core/media");
		//Save setting
		$this->model_core_media->saveInformation($data['mediaid'],"Title",$data['Title']);
		$this->model_core_media->saveInformation($data['mediaid'],"Slogan",$data['Slogan']);
		$this->model_core_media->saveInformation($data['mediaid'],"Currency",$data['Currency']);
		$this->model_core_media->saveInformation($data['mediaid'],"EmailContact",$data['EmailContact']);
		$this->model_core_media->saveInformation($data['mediaid'],"Keyword",$data['Keyword']);
		$this->model_core_media->saveInformation($data['mediaid'],"Description",$data['Description']);
		
		$this->model_core_media->saveInformation($data['mediaid'],"brochure",$data['brochure']);
		$this->model_core_media->saveInformation($data['mediaid'],"background",$data['background']);
		
		
		if(count($data['listfilm']))
		{
			$listfilm = implode(',',$data['listfilm']);
			$this->model_core_media->saveInformation($data['mediaid'],"listfilm",$listfilm);
		}
		if(count($data['listfilmcoming']))
		{
			$listfilm = implode(',',$data['listfilmcoming']);
			$this->model_core_media->saveInformation($data['mediaid'],"listfilmcoming",$listfilm);
		}
		for($i=1;$i<=$this->data['numbanner'];$i++)
		{
			$this->model_core_media->saveInformation($data['mediaid'],"qc".$i,$data['qc'.$i.'_fileid']);
			$this->model_core_media->saveInformation($data['mediaid'],"qcbanner".$i,$data['qcbanner'.$i.'_fileid']);
		}
		$this->model_core_media->saveInformation($data['mediaid'],"CinemaLocation",$data['CinemaLocation_fileid']);
		$this->model_core_media->saveInformation($data['mediaid'],"TicketPrice",$data['TicketPrice_fileid']);
		$this->model_core_media->saveInformation($data['mediaid'],"Event",$data['Event_fileid']);
		
		$this->model_core_media->saveInformation($data['mediaid'],"Webcam",$data['Webcam']);
		$this->data['output'] = "true";
		
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
	}
}
?>