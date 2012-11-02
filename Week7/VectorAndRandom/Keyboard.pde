class Keyboard {

  Keyboard() {

    //    println("The thick Stroke is " + canvas.width/400);
    int j = 49;  

    String[] row1= {
      "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "+", "delete"
    };
    String[] row2= {
      "tab", "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "[", "]"
    };
    String[] row3= {
      "caps lock", "A", "S", "D", "F", "G", "H", "J", "K", "L", ";", "'", "return"
    };
    String[] row4= {
      "shift", "Z", "X", "C", "V", "B", "N", "M", ",", ".", "?", "shift "
    };

    String[] row5= {
      "ctrl", "opt", "cmd", " ", "cmd ", "opt "
    };

    int keySpacing=30;

    //______________________ROW 1____________________________//
    keysArray=new ArrayList();

    for (int i=0; i<row1.length;i++) {
      if (i<row1.length-1) {
        keysArray.add(
        new Key(
        gridN1.modules[1][0].x+i*(gridN1.modules[1][0].x/2-keySpacing), 
        gridN1.modules[1][17].y, 
        gridN1.modules[1][0].w/2, 
        gridN1.modules[1][0].w/2, 
        row1[i]
          )
          );
      }
      //DELETE KEY LARGER WIDTH 
      else if (i==row1.length-1) {
        keysArray.add(  
        new Key(
        gridN1.modules[1][0].x+i*(gridN1.modules[1][0].x/2-keySpacing), 
        gridN1.modules[1][17].y, 
        gridN1.modules[1][0].w, 
        gridN1.modules[1][0].w/2, 
        row1[i]
          )
          );
      }
    }


    //______________________ROW 2____________________________//
    for (int i=0; i<row2.length;i++) {
      if (i<1) {
        keysArray.add(
        new Key(
        gridN1.modules[1][0].x-gridN1.modules[1][0].w/4, 
        gridN1.modules[1][17].y+gridN1.modules[1][0].w/2+keySpacing, 
        gridN1.modules[1][0].w, 
        gridN1.modules[1][0].w/2, 
        row2[i]
          ));
      }
      else if (i>=1) {
        keysArray.add(
        new Key(
        gridN1.modules[1][0].x-gridN1.modules[1][0].w/4+gridN1.modules[1][0].w/2+i*(gridN1.modules[1][0].w/2+keySpacing), 
        gridN1.modules[1][17].y+gridN1.modules[1][0].w/2+keySpacing, 
        gridN1.modules[1][0].w/2, 
        gridN1.modules[1][0].w/2, 
        row2[i]
          ));
      }
    } 


    //______________________ROW 3____________________________//
    for (int i=0; i<row3.length;i++) {
      if (i<1) {
        keysArray.add(
        new Key(
        gridN1.modules[1][0].x-gridN1.modules[1][0].w/4+keySpacing, 
        gridN1.modules[1][17].y+gridN1.modules[1][0].w+keySpacing*2, 
        gridN1.modules[1][0].w+keySpacing*2, 
        gridN1.modules[1][0].w/2, 
        row3[i]
          ));
      }
      if (i>=1 && i<(row3.length-1)) {
        keysArray.add(
        new Key( 
        gridN1.modules[1][0].x-gridN1.modules[1][0].w+keySpacing*2+gridN1.modules[1][0].w+keySpacing*2+keySpacing+i*(gridN1.modules[1][0].w/2+keySpacing), 
        gridN1.modules[1][17].y+gridN1.modules[1][0].w+keySpacing*2, 
        gridN1.modules[1][0].w/2, 
        gridN1.modules[1][0].w/2, 
        row3[i]
          ));
      }
      else if (i==row3.length-1) {
        keysArray.add(
        new Key(
        gridN1.modules[1][0].x-gridN1.modules[1][0].w/4+gridN1.modules[1][0].w/2+keySpacing*3+i*(gridN1.modules[1][0].w/2+keySpacing), 
        gridN1.modules[1][17].y+gridN1.modules[1][0].w+keySpacing*2, 
        gridN1.modules[1][0].w-keySpacing*2, 
        gridN1.modules[1][0].w/2, 
        row3[i]
          ));
      }
    } 

    //______________________ROW 4____________________________//
    for (int i=0; i<row4.length;i++) {
      if (i<1) {
        keysArray.add(
        new Key(
        gridN1.modules[1][0].x-gridN1.modules[1][0].w/4+keySpacing*3, 
        gridN1.modules[1][17].y+gridN1.modules[1][0].w*2-keySpacing, 
        gridN1.modules[1][0].w+keySpacing*3, 
        gridN1.modules[1][0].w/2, 
        row4[i]
          ));
      }
      if (i>=1 && i<(row4.length-1)) {
        keysArray.add(
        new Key( 
        gridN1.modules[1][0].x-gridN1.modules[1][0].w+keySpacing*4+gridN1.modules[1][0].w+keySpacing*3+keySpacing+i*(gridN1.modules[1][0].w/2+keySpacing), 
        gridN1.modules[1][17].y+gridN1.modules[1][0].w*2-keySpacing, 
        gridN1.modules[1][0].w/2, 
        gridN1.modules[1][0].w/2, 
        row4[i]
          ));
      }
      else if (i==row4.length-1) {
        keysArray.add(
        new Key(
        gridN1.modules[1][0].x-gridN1.modules[1][0].w/4+gridN1.modules[1][0].w/2+keySpacing*5+i*(gridN1.modules[1][0].w/2+keySpacing)+keySpacing, 
        gridN1.modules[1][17].y+gridN1.modules[1][0].w*2-keySpacing, 
        gridN1.modules[1][0].w+keySpacing*3, 
        gridN1.modules[1][0].w/2, 
        row4[i]
          ));
      }
    } 

    //______________________ROW 5____________________________//
    for (int i=0; i<row5.length;i++) {
      if (i<3) {
        keysArray.add(
        new Key(
        gridN1.modules[2][0].x-keySpacing+i*(gridN1.modules[1][0].w/2)+i*keySpacing, 
        gridN1.modules[1][17].y+gridN1.modules[1][0].w*4/2+keySpacing*4, 
        gridN1.modules[1][0].w/2, 
        gridN1.modules[1][0].w/2, 
        row5[i]
          ));
      }
      if (i==3) {
        keysArray.add(
        new Key( 
        gridN1.modules[2][0].x-keySpacing+i*(gridN1.modules[1][0].w/2)+i*keySpacing, 
        gridN1.modules[1][17].y+gridN1.modules[1][0].w*4/2+keySpacing*4, 
        gridN1.modules[1][0].w*3+keySpacing, 
        gridN1.modules[1][0].w/2, 
        row5[i]
          ));
      }
      else if (i>3 && i< row5.length) {
        keysArray.add(
        new Key(
        gridN1.modules[2][0].x-keySpacing+gridN1.modules[1][0].w*2.5+keySpacing+i*(gridN1.modules[1][0].w/2)+i*keySpacing, 
        gridN1.modules[1][17].y+gridN1.modules[1][0].w*4/2+keySpacing*4, 
        gridN1.modules[1][0].w/2, 
        gridN1.modules[1][0].w/2, 
        row5[i]
          ));
      }
    }
  ///_____________SET PARAMETERS ABOUT KEYS:COLOR AND STATE_____________////
    for (int i=0; i<keysArray.size(); i++) {
      Key k= (Key) keysArray.get(i);
      if (
      k.c=="1" || 
        k.c=="2" || 
        k.c=="3" || 
        k.c=="4" ||
        k.c=="tab" ||
        k.c=="caps lock" ||
        k.c=="shift"||
        k.c=="ctrl"|| 
        k.c=="opt" || 
        k.c=="cmd"||
        k.c=="Q"||
        k.c=="W"||
        k.c=="E"||
        k.c=="A"||
        k.c=="S"||
        k.c=="W"||
        k.c=="D"||
        k.c=="Z"||
        k.c=="X"
        ) {
        k.keyColor=c1;
        k.percentage=.25/12;
        k.selected=true;
      }

      //_______COLOR YELLOW KEYS_______//
      if (
      k.c=="5" || 
        k.c=="6" || 
        k.c=="R" || 
        k.c=="T" || 
        k.c=="F" || 
        k.c=="G" || 
        k.c=="C" || 
        k.c=="V") {
        k.keyColor=c2;
        k.percentage=.25;
        k.selected=true;
      }
      //_______COLOR LIGHT GREEN KEYS_______//
      if (
      k.c=="7" || 
        k.c=="8" || 
        k.c=="Y" ||
        k.c=="U" || 
        k.c=="H" || 
        k.c=="J" ||
        k.c=="B" || 
        k.c=="N") {
        k.keyColor=c3;
        k.percentage=.25;
        k.selected=true;
      }

      if (
      k.c=="9" || 
        k.c=="0" || 
        k.c=="-" || 
        k.c=="+" ||
        k.c=="delete" ||
        k.c=="I" ||
        k.c=="O"||
        k.c=="P"|| 
        k.c=="[" || 
        k.c=="]"||
        k.c=="K"||
        k.c=="L"||
        k.c==";"||
        k.c=="'"||
        k.c=="return"||
        k.c=="M"||
        k.c==","||
        k.c=="."||
        k.c=="?"||
        k.c=="shift "||
        k.c=="opt "||
        k.c=="cmd "
        ) {
        k.keyColor=c5;
        k.percentage=.25;
        k.selected=true;
      }

      if (
      k.c==" ") {
        k.keyColor=c6;
        k.percentage=0;
      }

      //_______SET KEY WHICH I IGNORE______//
      if ( 
        k.c=="1" ||
        k.c=="2" ||
        k.c=="3" ||
        k.c=="4" ||
        k.c=="5" ||
        k.c=="6" ||
        k.c=="7" ||
        k.c=="8" ||
        k.c=="9" ||
        k.c=="0" ||
        k.c=="tab" ||
        k.c=="caps lock" ||
        k.c=="shift"||
        k.c=="ctrl"|| 
        k.c=="opt" || 
        k.c=="cmd"||
        k.c=="[" || 
        k.c=="]"||
        k.c=="-" || 
        k.c=="+" ||
        k.c=="delete" ||
        k.c==";"||
        k.c=="'"||
        k.c=="return"||
        k.c=="M"||
        k.c==","||
        k.c=="."||
        k.c=="?"||
        k.c=="shift "||
        k.c=="opt "||
        k.c=="cmd "||
        k.c==" "
        ) {
        k.percentage=0;
        k.selected=false;
        k.used=true;
      }
    }
    
    
  }

  void display() {
    for (int i=0; i<keysArray.size(); i++) {
      Key k= (Key) keysArray.get(i);
      k.display();
    }
  }
}

