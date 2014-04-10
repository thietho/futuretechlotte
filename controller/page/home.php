<?php
class ControllerPageHome extends Controller
{
	function __construct() 
	{
		//$this->iscache = true;
	 	$arr=array();
		foreach($_GET as $key => $val)
			$arr[] = $key."=".$val;
	 	$this->name ="PageHome".implode("_",$arr);
   	}
	public function index()
	{
		if($this->cachehtml->iscacht($this->name) == false)
		{
			$this->load->model('lotte/movie');
			$this->load->model('core/file');
			$this->load->helper('image');
			$this->document->title = $this->document->setup['Title'] ." - ". $this->document->setup['Slogan'];
			//print_r($this->document->setup);
			$arr_filmid = split(',',$this->document->setup['listfilm']);
			//print_r($arr_filmid);
			foreach($arr_filmid as $filmid)
			{
				//$filmid=$this->document->setup['film'.$i];
				$film = $this->model_lotte_movie->getItem($filmid);
				
				$file = $this->model_core_file->getFile($film['icone']);
				$film['iconethumbnail'] = HelperImage::resizePNG($file['filepath'], 173, 173);
				
				$file = $this->model_core_file->getFile($film['banner']);
				$film['bannerthumbnail'] = HelperImage::resizePNG($file['filepath'], 1080, 486);
				
				$file = $this->model_core_file->getFile($film['image']);
				$film['imagethumbnail'] = HelperImage::resizePNG($file['filepath'], 214, 0);
				
				$this->data['listfilm'][]=$film;
			}
			$arr_filmid = split(',',$this->document->setup['listfilmcoming']);
			//print_r($arr_filmid);
			foreach($arr_filmid as $filmid)
			{
				//$filmid=$this->document->setup['film'.$i];
				$film = $this->model_lotte_movie->getItem($filmid);
				
				$file = $this->model_core_file->getFile($film['icone']);
				$film['iconethumbnail'] = HelperImage::resizePNG($file['filepath'], 173, 173);
				
				$file = $this->model_core_file->getFile($film['banner']);
				$film['bannerthumbnail'] = HelperImage::resizePNG($file['filepath'], 1080, 486);
				
				$file = $this->model_core_file->getFile($film['image']);
				$film['imagethumbnail'] = HelperImage::resizePNG($file['filepath'], 214, 0);
				
				$this->data['listfilmcoming'][]=$film;
			}
			for($i=1;$i<=6;$i++)
			{	
				$fileid = $this->document->setup['qc'.$i];	
				$this->data['qc'][$i] = $this->model_core_file->getFile($fileid);
				$fileid = $this->document->setup['qcbanner'.$i];
				$this->data['qcbanner'][$i] = $this->model_core_file->getFile($fileid);
				//$this->data['qc'][$i]['imagethumbnail'] = HelperImage::resizePNG($this->data['qc'][$i]['filepath'], 100, 0);
				
			}
			$cur = $this->request->get['pos'];
			
			$fileid = $this->document->setup['CinemaLocation'];	
			$this->data['CinemaLocation'] = $this->model_core_file->getFile($fileid);
			$fileid = $this->document->setup['TicketPrice'];
			$this->data['TicketPrice'] = $this->model_core_file->getFile($fileid);
			
			
		}
		
		$this->id="content";
		$this->template="page/home.tpl";
		$this->layout="layout/home";
		$this->render();
	}
	
	private function loadSiteBar()
	{
		//Left sitebar
		$arr = array('san-pham');
		$this->data['leftsitebar']['produtcategory'] = $this->loadModule('sitebar/catalogue','index',$arr);
		$this->data['leftsitebar']['search'] = $this->loadModule('sitebar/searchproduct');
		$this->data['leftsitebar']['dknhantinh'] = $this->loadModule('sitebar/dangkynhantin');
		
		//$this->data['leftsitebar']['exchange'] = $this->loadModule('sitebar/exchange');
		
		$this->data['leftsitebar']['hitcounter'] = $this->loadModule('sitebar/hitcounter');
		
		//Rigth sitebar
		$this->data['rightsitebar']['cart'] = $this->loadModule('sitebar/cart');
		$this->data['rightsitebar']['login'] = $this->loadModule('sitebar/login');
		$this->data['rightsitebar']['supportonline'] = $this->loadModule('sitebar/supportonline');
		
		$template = array(
						  'template' => "sitebar/news.tpl",
						  'width' => 50,
						  'height' =>50
						  
						  );
		$arr = array('tin-tuc-san-pham',10,'',$template);
		$this->data['rightsitebar']['newsproduct'] = $this->loadModule('sitebar/news','index',$arr);
		$this->data['rightsitebar']['weblink'] = $this->loadModule('sitebar/weblink');
		//$this->data['rightsitebar']['search'] = $this->loadModule('sitebar/search');
		
		//$this->data['rightsitebar']['banner'] = $this->loadModule('sitebar/banner');
		//$this->data['rightsitebar']['question'] = $this->loadModule('sitebar/question');
	}
	
	function getHomeMedias($mediatype)
	{
		
		$this->load->model('core/media');
		//$siteid = $this->member->getSiteId();
		//$sitemaps = $this->model_core_sitemap->getListByModule("module/product", $siteid);
		//$arrsitemapid = $this->string->matrixToArray($sitemaps,"sitemapid");
		$queryoptions = array();
		$queryoptions['mediaparent'] = '';
		$queryoptions['mediatype'] = $mediatype;
		$queryoptions['refersitemap'] = '%';
		$data = $this->model_core_media->getPaginationList($queryoptions,$step=0,$to=0);
		
		return $data;
	}
	
	function getProduct($status)
	{
		$this->load->model('core/media');
		//$siteid = $this->member->getSiteId();
		//$sitemaps = $this->model_core_sitemap->getListByModule("module/product", $siteid);
		//$arrsitemapid = $this->string->matrixToArray($sitemaps,"sitemapid");
		$queryoptions = array();
		$queryoptions['mediaparent'] = '';
		$queryoptions['mediatype'] = 'module/product';
		$queryoptions['refersitemap'] = '%';
		$queryoptions['groupkeys'] = $status;
		$data = $this->model_core_media->getPaginationList($queryoptions, $step=0, $to=0);
		
		return $data;
	}
}
?>