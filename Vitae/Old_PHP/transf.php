<?php 
	function getTextBetweenTags($string, $tagname) {
		$pattern = "/<$tagname>([\w\W]*?)<\/$tagname>/";
		preg_match_all($pattern, $string, $matches);
		return $matches[0];
	}
	$xmlA = new DOMDocument;
	$xmlA->load('VHannibalisLAT.xml');
	$xsl = new DOMDocument;
	$xsl->load('VHS.xsl');
	
	// Configure the transformer
	$proc = new XSLTProcessor;
	$proc->importStyleSheet($xsl); // attach the xsl rules
	$tranfs = $proc->transformToXML($xmlA);
	$sectionA = 'e'.$_POST['section'].'.1';
	$parts = getTextBetweenTags($tranfs,'p');
	foreach ($parts as $part) {
		if (strpos($part, $sectionA) > 0) $str = $part;
	}
	
	$xmlB = new DOMDocument;
	$xmlB->load('VHannibalisCAST.xml');
	$tranfs = $proc->transformToXML($xmlB);
	$sectionB = 'l'.$_POST['section'].'.1';
	$parts = getTextBetweenTags($tranfs,'p');
	
	foreach ($parts as $part) {
		if (strpos($part, $sectionB) > 0) $str .= '##'.$part;
	}
	
	echo $str;

?>