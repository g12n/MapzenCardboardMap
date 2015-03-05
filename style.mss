// Languages: name (local), name_en, name_fr, name_es, name_de
@name: '[name_en]';
// Common Colors //
@water: #c3e6ff;
@park: #cec;


Map {
  background-color:#ddd;
  background-image:url("textures/paper-texture.jpg");
  buffer-size: 100;
}

// Water Features //
#water {
 [kind='ocean'],
    [kind='riverbank'], 
    [kind='water'],
    [kind='reservoir '] {
  polygon-fill: @water;
  polygon-gamma: 0.6;
  polygon-pattern-file: url("textures/water.jpg");
  comp-op: multiply;
  ::highlight{
    polygon-fill: #fff;
    polygon-opacity:0.7;
    image-filters: agg-stack-blur(10,20);
   // image-filters-inflate: true;
	comp-op: screen;
  }
  }
}
#water {
[kind="river"],
    [kind="canal"]{
    line-color:@water ;
    line-width: 1;
    [zoom>=12] { line-width: 2; }
    [zoom>=14] { line-width: 2; }
    [zoom>=16] { line-width: 18; }
  }
  [kind='stream'] {
      line-color:@water ;
    line-width: 0.5;
    [zoom>=10] { line-width: 1; }
    [zoom>=16] { line-width: 2; }
    [zoom>=18] { line-width: 3; }
  }
}

// Parks //
#landuse {
  [kind='park'], 
    [kind='forest']{
     ::texture{
  		polygon-pattern-file: url("textures/green.jpg");	
    }
  }
}


#roads,
#tunnel,
#bridge {
    line-color: #000;
    line-width: 1;
    comp-op: multiply;
    opacity:0.2;
   	line-simplify:1;
  	line-smooth: 1;
    [class='motorway'],
    [class='main'] {
      [zoom>=12] {line-width:2}
      [zoom>=14] {line-width:3}
      [zoom>=16] {line-width:5}
    }
    [class='street'],
    [class='street_limited'] {
    	[zoom>=3] {line-width:2}
      	[zoom>=16]{line-width:5}
 	}
  	
  ::inset{
    	line-color:#fff;
      	line-width:1;
      	line-offset:0;
       	line-simplify:1;
  		line-smooth: 1;
     	line-geometry-transform: "translate(2, 0)";
        image-filters: agg-stack-blur(1,1);
    	[zoom<=5] {line-width:0}
    }
}

#buildings {
 [zoom>=10] {
    building-height: 2; 
    building-fill: #ddd;
    building-fill-opacity: 1;
    opacity: 0.8;
    comp-op: darken   ;
        


  }
}