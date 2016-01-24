
<?php 
/* This is the only PHP script of the infrastructure. Its function is to recover
the content of certain elements through their identifiers*/
	function getTextBetweenTags($string, $tagname) {
		$pattern = "/<$tagname>([\w\W]*?)<\/$tagname>/";
		preg_match_all($pattern, $string, $matches);
		return $matches[0];
	}
	$xmlA = new DOMDocument;
	/*Here it is loading the XML-TEI files dynamically*/
	$xmlA->load('VHannibalisLAT.xml');
	$xsl = new DOMDocument;
	/*And here it is tranforming the XML-TEI into HTML through the XSLT file transform.xsl*/
	$xsl->load('../transform.xsl');
	
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