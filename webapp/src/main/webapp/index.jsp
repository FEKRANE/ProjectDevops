<head>
    <script>
    
        var Noeuds=[];
        
        function ajouterNoeud(e){
            var v_canvas=document.getElementById("graphCanvas");
            var v_context=v_canvas.getContext("2d");
            var x=e.clientX-v_canvas.getBoundingClientRect().left;
            var y=e.clientY-v_canvas.getBoundingClientRect().top;
            v_context.beginPath();
            v_context.fillRect(x,y,10,10);
            v_context.fillStyle="black";
            v_context.font ="20px bold Arial";
            v_context.fillText('N'+Noeuds.length,x,y);
            Noeuds.push({name:'N'+Noeuds.length,cord:[x,y],color:"black",adjacent:[]});
        };
        
        function connecter(){
            x=document.getElementById("N1").value.toUpperCase();
            y=document.getElementById("N2").value.toUpperCase();
            if(x && y){
            var v_canvas=document.getElementById("graphCanvas");
            var v_context=v_canvas.getContext("2d");
            v_context.beginPath();
            var n1=searchByname(x);
            var n2=searchByname(y);
            v_context.lineWidth=3;
            v_context.moveTo(n1.cord[0]+5,n1.cord[1]+5);
            v_context.lineTo(n2.cord[0]+5,n2.cord[1]+5);
            if(n1.adjacent.indexOf(n2.name)==-1)
                n1.adjacent[n1.adjacent.length]=n2.name;
            if(n2.adjacent.indexOf(n1.name)==-1)
                n2.adjacent[n2.adjacent.length]=n1.name;
            v_context.stroke();
            };
        };
        
        function searchByname(name){
            for(x in Noeuds){
                if(Noeuds[x].name==name)
                    return Noeuds[x];
            };
        };
        
        
        function colorsOfadjacents(v){ 
            var v_list=[];
            for(x in Noeuds){
                if(Noeuds[x].adjacent.indexOf(v)>-1)
                    v_list.push(Noeuds[x].color);
            };
            return v_list;
        };
        
        
        function colourNoeuds(){
            for(v in Noeuds){
                var v_canvas=document.getElementById("graphCanvas");
                var v_context=v_canvas.getContext("2d");
                var x=Noeuds[v].cord[0];
                var y=Noeuds[v].cord[1];
                v_context.fillStyle=Noeuds[v].color;
                v_context.beginPath();
                v_context.fillRect(x,y,10,10);
                v_context.closePath();
            };
        };
        
            
        
        
        function colourGraph(){
            v_colours=["green","blue","red","yellow","white","orange","purple","grey","brown","pink"]
            cond=0;
            for (v in Noeuds){
                var v_list=colorsOfadjacents(Noeuds[v].name);
                var i=0;
                cond=0;
                while(cond==0 && i<v_colours.length){
                    if(v_list.indexOf(v_colours[i])>-1){
                        cond=0;
                        i+=1;
                    }
                    else{
                        cond=1;
                        Noeuds[v].color=v_colours[i];
                    };
                };
            };
            colourNoeuds();
        };
        
        function enter(e){
            if(e.keyCode==13)
                connecter();
        };
        
        
        function clearGraph(){
        var v_canvas=document.getElementById("graphCanvas");
            var v_context=v_canvas.getContext("2d");
            v_context.clearRect(0, 0, v_canvas.width, v_canvas.height);
            v_context.fillStyle='black';
            Noeuds = [];
            document.getElementById("N1").value = '';
            document.getElementById("N2").value = '';
        
        };
        
        </script>

    <style>
         body 
    {background-image: linear-gradient( 135deg, #ABDCFF 10%, #0396FF 100%);}

    canvas{
      font-weight:lighter;
      -moz-box-shadow: 2px 2px 6px #888;  
      -webkit-box-shadow: 2px 2px 6px #888;  
      box-shadow:2px 2px 6px #888;  
      text-align:center;
      display:block;
    }
    .header{
      text-align: center;
      text-shadow: -1px -1px #000, 1px 1px #060, -3px 0 4px #000;
      font-family:Arial, Helvetica, sans-serif;
      color: #d9d9d9;
      padding:10px;
      font-weight:lighter;
      -moz-box-shadow: 2px 2px 6px #888;  
      -webkit-box-shadow: 2px 2px 6px #888;  
      box-shadow:2px 2px 6px #888;  
      text-align:center;
      display:block;
      margin:16px;
    }
    .header img {
     display: inline;
     width: 50px;
     height:50px;
   }

   .header h1 {
    position: relative;
    display: inline;
    font-size: 28px;
    top: 7px;
  }

  .connect {
    color:white;
    font:2.4em Futura, ‘Century Gothic’, AppleGothic, sans-serif;
    font-size:70%;
    padding:9px;
    background-color:rgba(147, 66, 245,1);
    border:1px solid rgb(147, 66, 245);
    -moz-border-radius:10px;
    -webkit-border-radius:10px;
    border-radius:10px;
    border-bottom:1px solid #9f9f9f;
    -moz-box-shadow:inset 0 1px 0 rgba(255,255,255,0.5);
    -webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,0.5);
    box-shadow:inset 0 1px 0 rgba(255,255,255,0.5);
    cursor:pointer;
  }
  .connect:hover {
    background-color:rgba(147, 66, 245,0.8);
  }

  .colour {
    color:white;
    font:2.4em Futura, ‘Century Gothic’, AppleGothic, sans-serif;
    font-size:70%;
    padding:9px;
    background-color:rgba(232, 171, 2,1);
    border:1px solid rgb(232, 171, 2);
    -moz-border-radius:10px;
    -webkit-border-radius:10px;
    border-radius:10px;
    border-bottom:1px solid #9f9f9f;
    -moz-box-shadow:inset 0 1px 0 rgba(255,255,255,0.5);
    -webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,0.5);
    box-shadow:inset 0 1px 0 rgba(255,255,255,0.5);
    cursor:pointer;
  }
  .colour:hover {
    background-color:rgba(232, 171, 2,0.8);
  }
  .clear {
    color:white;
    font:2.4em Futura, ‘Century Gothic’, AppleGothic, sans-serif;
    font-size:70%;
    padding:9px;
    background-color:rgba(191, 255, 0,1);
    border:1px solid rgb(191, 255, 0);
    -moz-border-radius:10px;
    -webkit-border-radius:10px;
    border-radius:10px;
    border-bottom:1px solid #9f9f9f;
    -moz-box-shadow:inset 0 1px 0 rgba(255,255,255,0.5);
    -webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,0.5);
    box-shadow:inset 0 1px 0 rgba(255,255,255,0.5);
    cursor:pointer;
  }
  .clear:hover {
    background-color:rgba(191, 255, 0,0.8);
  }
    </style>
  </head>
  <body>
  
  
    <header>
      <div class="header">
        <img src="logo.png" alt="logo" />
        <h1>TEST GRAPH COLORING</h1>
      </div>
    </header>
  
    <canvas id="graphCanvas" width="600" height="460" style="border:3px solid; color:#d9d9d9
    ; margin:auto; margin-top:15px; display: block;
    cursor:crosshair;" onclick="ajouterNoeud(event)"></canvas>
    <div style = "margin:  auto;    display: table; margin-top: 20px;
    " width="300"   >
      <input type="text" id="N1" style="width:50px; height:20px; margin:5px" onkeydown="enter(event)">
      <input type="text" id="N2" style="width:50px; height:20px;  margin:5px" onkeydown="enter(event)">
      <button class="connect" style="width:70px;"  onclick="connecter()"> connect</button> 
      <button class="colour" style="margin-left:3px; width:70px;" onclick="colourGraph()">colour</button>
          <button class="clear" style="margin-left:3px; width:70px;" onclick="clearGraph()">clear</button>
  
    </div>
  </body>
  
  






