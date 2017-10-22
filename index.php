<?php
$response = file_get_contents("https://api.nytimes.com/svc/topstories/v2/home.json?api-key=f85eb08255384dbca8de5ffcbb447e4a");
$response = json_decode($response);
//$response = new SimpleXMLElement($response);
class XMLSerializer {

    // functions adopted from http://www.sean-barton.co.uk/2009/03/turning-an-array-or-object-into-xml-using-php/

    public static function generateValidXmlFromObj(stdClass $obj, $node_block='nodes', $node_name='node',$no=0) {
        $arr = get_object_vars($obj);
        return self::generateValidXmlFromArray($arr, $node_block, $node_name);
    }

    public static function generateValidXmlFromArray($array, $node_block='nodes', $node_name='node',$no=0) {
        if($no==0){
		$xml = '<?xml version="1.0" encoding="UTF-8" ?><?xml-stylesheet type="text/xsl" href="style.xsl"?>';
		}else{
		$xml = '<?xml version="1.0" encoding="UTF-8" ?>';
		}
        $xml .= '<' . $node_block . '>';
        $xml .= self::generateXmlFromArray($array, $node_name);
        $xml .= '</' . $node_block . '>';

        return $xml;
    }

    private static function generateXmlFromArray($array, $node_name) {
        $xml = '';

        if (is_array($array) || is_object($array)) {
            foreach ($array as $key=>$value) {
                if (is_numeric($key)) {
                    $key = $node_name;
                }

                $xml .= '<' . $key . '>' . self::generateXmlFromArray($value, $node_name) . '</' . $key . '>';
            }
        } else {
            $xml = htmlspecialchars($array, ENT_QUOTES);
        }

        return $xml;
    }

}
$response1=XMLSerializer::generateValidXmlFromObj($response,'nodes','node',0);
$file1 = fopen("home.xml","w");
fwrite($file1,$response1);
fclose($file1);
$response2=XMLSerializer::generateValidXmlFromObj($response,'nodes','node',1);
$file2 = fopen("home1.xml","w");
fwrite($file2,$response2);
fclose($file2);
header("Location:home.xml");
?>