<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title>Edición digital textos bifronte</title>
    <link href="VHS.css" rel="stylesheet"></link>
    <link href='https://fonts.googleapis.com/css?family=Cuprum' rel='stylesheet' type='text/css'>
  	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> 
  	<script language="javascript">
		$(document).ready(function() {
			$('.menu li a').click(function(e) {
                var id = $(this).attr('href');
				id = id.replace('#l','');
				$.ajax({  
					type: "POST",  
					url: "transf.php",  
					data: { section: id },  
					success: function(response) { 
						var arr = response.split('##');
						$('#left2').html(arr[0]); 	
						$('#right2').html(arr[1]); 				
					}  
				});		
            });			
        });
    </script>
  </head>
  <body>
    <div id="Header">  
    
    <h2>Alfonso de Palencia, <i>Vidas de Aníbal y Escipión</i></h2>
    <img src="hannibalscipio.jpg"/>
       
	 </div>
    
    <div id="content">
   <div id="left1">
   		<div class="Infos">Plutarco, <i>Parallelae, sive Vitae illustrium virorum</i>, 2 vols., Venezia: Nicholas Jenson, 2 enero 1478.</div>
        	<div class="menu">
				 <ul>
					 <li><a href="#l1">1</a></li>
					 <li><a href="#l2">2</a></li>
					 <li><a href="#l3">3</a></li>
					 <li><a href="#l4">4</a></li>
					 <li><a href="#l5">5</a></li>
					 <li><a href="#l6">6</a></li>
					 <li><a href="#l7">7</a></li>
					 <li><a href="#l8">8</a></li>
					 <li><a href="#l9">9</a></li>
					 <li><a href="#l10">10</a></li>
					 
				 </ul>
        	</div>
        
        <div id="left2"> 
		 <p>Clique el parágrafo a consultar. </p>
	    </div>
     </div>
    
		 <div id="right1">
		 <div class="Infos">Plutarco, [<i>Parallelae sive Vitae illustrium virorum</i>], trad. Alfonso de Palencia, 2 vols., Sevilla: Cuatro
compañeros alemanes, 2 julio 1491</div>
		 <div class="menu">
   			 <ul>
   			 <li><a href="#l1">1</a></li>
   			 <li><a href="#l2">2</a></li>
   			 <li><a href="#l3">3</a></li>
   			 <li><a href="#l4">4</a></li>
   			 <li><a href="#l5">5</a></li>
   			 <li><a href="#l6">6</a></li>
   			 <li><a href="#l7">7</a></li>
   			 <li><a href="#l8">8</a></li>
   			 <li><a href="#l9">9</a></li>
   			 <li><a href="#l10">10</a></li>
   			 </ul>
        </div>
		<div id="right2">
		 <p>Clique el parágrafo a consultar. </p>
	</div>
	</div> 
</div>
  </body>
</html>