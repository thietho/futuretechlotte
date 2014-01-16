<?php
class ControllerCommonDashboard extends Controller
{
	function __construct() 
	{
		$this->data['rowmainbanner'] = 4;
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
		
		for($i=1;$i<=5;$i++)
		{
			$filmid = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'film'.$i);
			$this->data['film'][$i] = $this->model_lotte_movie->getItem($filmid);
			
			$file = $this->model_core_file->getFile($this->data['film'][$i]['icone']);
			$this->data['film'][$i]['iconethumbnail'] = HelperImage::resizePNG($file['filepath'], 100, 0);
			
			$file = $this->model_core_file->getFile($this->data['film'][$i]['banner']);
			$this->data['film'][$i]['bannerthumbnail'] = HelperImage::resizePNG($file['filepath'], 100, 0);
			
			$file = $this->model_core_file->getFile($this->data['film'][$i]['image']);
			$this->data['film'][$i]['imagethumbnail'] = HelperImage::resizePNG($file['filepath'], 100, 0);
		}
		//print_r($this->data['film']);
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
		for($i=1;$i<=5;$i++)
		{
			$this->model_core_media->saveInformation($data['mediaid'],"film".$i,$data['film'.$i]);
		}
		$this->data['output'] = "true";
		
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
	}
}
?>