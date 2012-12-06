void initControls() {

// 2D SLIDER for TARGET  
  stripesTarget = controlP5.addSlider2D("StripeTarget", 0, gridN1Cols-1, 0, gridN1Rows-1, gridN1Cols/2, gridN1Rows/2, 10, 10, 100, 100);
  stripesTarget.setArrayValue(new float[] {
    (gridN1Cols-1)/2, (gridN1Rows-1)/2
  }
  );  
  stripesTarget.setWindow(controlWindow);
  
  
  // 2D SLIDER for TITLE AND TAG  
  titleTarget = controlP5.addSlider2D("TitlePlacement", 0, gridN1Cols-1, 0, gridN1Rows-1, gridN1Cols/2, gridN1Rows/2, 120, 10, 100, 100);
  titleTarget.setArrayValue(new float[] {
    (gridN1Cols-1)/2, (gridN1Rows-1)/2
  }
  );  
  titleTarget.setWindow(controlWindow);
  
  
  // INDIVIDUAL SLIDERS FOR COPY SIZE
//  controlP5.addSlider("variable to be changed", minValue, maxValue, defaultValue, Xlocation, Ylocation, width, height);
  
//  ///TITLE SIZE
//  S1 = controlP5.addSlider("titleSize", 400, 900, 500, 240, 10, 100, 10);
//  S1.setNumberOfTickMarks(500);
//  S1.setSliderMode(Slider.FLEXIBLE);
//  S1.setWindow(controlWindow);
////  
//  ///TAGLINE SIZE
//  S2 = controlP5.addSlider("taglineSize", 100, 200, 80, 240, 40, 100, 10);
//  S2.setNumberOfTickMarks(100);
//  S2.setSliderMode(Slider.FLEXIBLE);
//  S2.setWindow(controlWindow);
//  
//  ///DETAILS SIZE
//  S3 = controlP5.addSlider("detailsSize", 100, 200, 150, 240, 80, 100, 10);
//  S3.setNumberOfTickMarks(100);
//  S3.setSliderMode(Slider.FLEXIBLE);
//  S3.setWindow(controlWindow);
//
//  //Masking Rect Properties
//  S4 = controlP5.addSlider("rectWidth", 2121, 2170, 2121, 240, 120, 100, 10);
//  S4.setNumberOfTickMarks(50);
//  S4.setSliderMode(Slider.FLEXIBLE);
//  S4.setWindow(controlWindow);  
//  
//  S5 = controlP5.addSlider("rectHeight", 1500, 2000, 1550, 240, 160, 100, 10);
//  S5.setNumberOfTickMarks(500);
//  S5.setSliderMode(Slider.FLEXIBLE);
//  S5.setWindow(controlWindow);
  

}

