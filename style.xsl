<?xml version = "1.0" encoding = "UTF-8"?>  
<xsl:stylesheet version = "1.0" xmlns:xsl = "http://www.w3.org/1999/XSL/Transform">     
    <xsl:template match = "/">  
       <html>  
	   <head>
	   <title>NY Times</title>
	   </head>
	   <style>
	/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 100; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
/* Modal Header */
.modal-header {
    padding: 2px 16px;
    background-color: #010105;
    color: white;
}

/* Modal Body */
.modal-body {padding: 2px 16px;}

/* Modal Footer */
.modal-footer {
    padding: 2px 16px;
    background-color: #010105;
    color: white;
}   
	 #mbody{
	background:#ffffff;
}  
	.modal-content1 {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
	top:0%;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop1;
    animation-duration: 0.4s
}   
	   
	  /* Add Animation */
@-webkit-keyframes animatetop1 {
    from {top: -300px; opacity: 0} 
    to {top: 0%; opacity: 1}
}

@keyframes animatetop1 {
    from {top: -300px; opacity: 0}
    to {top: 0%; opacity: 1}
} 
	   .close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
	width:20px;
}

	   .close:hover,
.close:focus {
    color: red;
    text-decoration: none;
    cursor: pointer;
}
.inews
{
    float: left;
   width:23%;
   height:66%;
	display:table;
	box-sizing: border-box;
	
	padding-top:5px;
	padding-bottom:10px;
	margin:10px;
	 background: #fff;
  -webkit-box-shadow: 0 0 9px rgba(0, 0, 0, 0.5), inset 0 0 50px rgba(0, 0, 0, 0.1);
	-moz-box-shadow: 0 0 9px rgba(0, 0, 0, 0.5), inset 0 0 50px rgba(0, 0, 0, 0.1);
	box-shadow: 0 0 9px rgba(0, 0, 0, 0.5), inset 0 0 50px rgba(0, 0, 0, 0.1);
	
}
.table{
width:23%;
height:70%;
display:table-cell;
vertical-align:middle;
}
.myButton{
	float:none;
   box-shadow: rgb(16, 150, 168) 1px 1px 22px -25px inset; 
   background: linear-gradient(rgb(113, 173, 237) 5%, rgb(23, 35, 166) 100%) rgb(113, 173, 237); 
   border-radius: 8px; border: 1px solid rgb(39, 214, 214);
   display: inline; 
   cursor: pointer; 
   color: rgb(255, 255, 255);
   font-family: Arial; 
   font-size: 12px; 
   
   padding: 4px; 
   width:33%
   text-decoration: none;
   margin:0px 2px 0px 2px;
   }
   .myButton:hover{
	float:none;
   box-shadow: rgb(16, 150, 168) 1px 1px 22px -25px inset; 
   background: linear-gradient(rgb(93, 93, 207) 5%, rgb(23, 35, 166) 100%) rgb(93, 93, 207); 
   border-radius: 18px; border: 1px solid rgb(39, 214, 214);
   color: rgb(233, 233, 233);
   font-family: Arial; 
   font-size: 12px; 
   font-weight: bold; 
   padding: 4px; 
   width:33%
   text-decoration: none;
   margin:0px 2px 0px 2px;
   }
	   </style>
          <body> 
		      <div style="position:absolute;top:0%;width:100%;background:#100909;color:white;height:75px;">
			  <img src="icon.png" width="50" height="50" style="position:absolute;top:10px;left:10px;"/>
			  <center><span style="position:absolute;top:20px;font-size:30px;left:45%;">The New York Times</span></center>
			  </div>
				<div id="mModal" class="modal">
				<div class="modal-content1">
				<div class="modal-header">
				<span class="close">X</span>
				<center><h2 id="sylheader">News Page</h2></center>
				</div>

				<div class="modal-body" id="mbody" style="width=100%;">
				<iframe id="newsframe" width="1050" height="800"></iframe>
				</div>
				<div class="modal-header">
				<center><h2><xsl:value-of select = "/nodes/copyright"/></h2></center>
				</div>
				</div>
				</div>
          <div id="selection" style="position:absolute;top:110px;float: right;">Sort By: <select id="selector" onchange="myselection()" style="width:300px;height:30px;">
  <option value="nothing"></option>
  <option value="section">Section</option>
  <option value="byline">Byline</option>
  <option value="published_date">Date</option>
</select>
<input type="text" id="searchbox"/><button onclick="mysearch()" class="myButton">Search</button>
</div>
		<div id="newscontent" style="margin-top:150px;">
			 <xsl:for-each select = "/nodes/results/node">
				<div class="inews">
				<table class="table">
				<tr><td colspan="2"><span style="text-align:center;font-weight:bold;padding:10px; margin: auto;font-family: 'Lucida Sans Unicode'"><u><xsl:value-of select = "title"/></u></span></td></tr>
				<tr><td style="position:relative;left:5%;"><span style="font-size:12px;margin-top:15px;"><xsl:value-of select = "byline"/></span></td><td><span style="font-size:14px;margin-top:15px;font-style: italic;"><xsl:value-of select = "section"/></span></td></tr>
				<tr><td colspan="2" style="text-align:center;"><img><xsl:attribute name="src">
        <xsl:value-of select="multimedia/node[2]/url"/>
			</xsl:attribute></img></td></tr>
			<xsl:variable name="URL" select="url"/>
				<tr><td colspan="2"><span style="text-align:center;padding:10px; margin: auto;font-family: 'Times New Roman';font-size:15px;"><xsl:value-of select = "abstract"/></span></td></tr>
				<tr><td colspan="2" style="text-align:right;"><span style="padding:10px;">on <xsl:value-of select = "published_date"/></span></td></tr>
				<tr><td style="text-align:center;" colspan="2"><span class="myButton" onclick="showNews('{$URL}')">View Page</span></td></tr>
				</table>
				</div>
			</xsl:for-each> 
			</div>
            <br/>
			
         </body>
		 
<script>
		 var modal = document.getElementById('mModal');
		 var span = document.getElementsByClassName("close")[0];
		span.style.display="none";

span.onclick = function() {
    modal.style.display = "none";
}

function showNews(url){
	var f=document.getElementById("newsframe");
	f.src=url;
	modal.style.display = "block";
	var span = document.getElementsByClassName("close")[0];
	span.style.display="inline";
	

}

function myselection(){
RenderXSLT(document.getElementById("selector").value);
}
function mysearch(){
SRenderXSLT(document.getElementById("searchbox").value);
}
function loadXMLDoc(filename) {
          if (window.ActiveXObject) {
            xhttp = new ActiveXObject("Msxml2.XMLHTTP");
          } else {
            xhttp = new XMLHttpRequest();
          }
          xhttp.open("GET", filename, false);
          try {
            xhttp.responseType = "msxml-document"
          } catch (err) {} // Helping IE11
          xhttp.send("");
          return xhttp.responseXML;
        }

function RenderXSLT(sortparameter) {
          xml = loadXMLDoc("home1.xml");
          xslt = loadXMLDoc("stylesort.xslt");
		  
    if (window.ActiveXObject || xhttp.responseType == "msxml-document") {
        var template = new ActiveXObject('Msxml2.XslTemplate');
        template.stylesheet = xslt;
        var proc = template.createProcessor();
        proc.input = xml;
        proc.addParameter('sortp', sortparameter);
        proc.transform();
        document.getElementById("newscontent").innerHTML = proc.output;
      }
          else {
		
        var xsltProcessor = new XSLTProcessor();
		xsltProcessor.setParameter(null, "sortp", sortparameter);
        xsltProcessor.importStylesheet(xslt);

        var resultFragment = xsltProcessor.transformToFragment(xml, document);
		
		document.getElementById("newscontent").innerHTML="";
        document.getElementById("newscontent").appendChild(resultFragment);
      }
        }
		
		
		function SRenderXSLT(search) {
          xml = loadXMLDoc("home1.xml");
          xslt = loadXMLDoc("stylesearch.xslt");
		  
    if (window.ActiveXObject || xhttp.responseType == "msxml-document") {
        var template = new ActiveXObject('Msxml2.XslTemplate');
        template.stylesheet = xslt;
        var proc = template.createProcessor();
        proc.input = xml;
        proc.addParameter('sortp', sortparameter);
        proc.transform();
        document.getElementById("newscontent").innerHTML = proc.output;
      }
          else {
		
        var xsltProcessor = new XSLTProcessor();
		xsltProcessor.setParameter(null, "search", search);
        xsltProcessor.importStylesheet(xslt);

        var resultFragment = xsltProcessor.transformToFragment(xml, document);
		
		document.getElementById("newscontent").innerHTML="";
        document.getElementById("newscontent").appendChild(resultFragment);
      }
        }
</script>
       </html>  
    </xsl:template>  
 </xsl:stylesheet> 