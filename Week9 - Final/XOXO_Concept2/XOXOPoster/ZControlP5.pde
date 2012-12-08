void initControls() {

  // 2D SLIDER for TITLE AND TAG  
  //  titleTarget = controlP5.addSlider2D("TitlePlacement", 0, gridN1Cols-1, 0, gridN1Rows-1, gridN1Cols/2, gridN1Rows/2, 120, 10, 100, 100);
  //  titleTarget.setArrayValue(new float[] {
  //    (gridN1Cols-1)/2, (gridN1Rows-1)/2
  //  }
  //  );  
  //  titleTarget.setWindow(controlWindow);

  // INDIVIDUAL SLIDERS FOR COPY SIZE
  //  controlP5.addSlider("variable to be changed", minValue, maxValue, defaultValue, Xlocation, Ylocation, width, height);

  //  ///TITLE SIZE
  S1 = controlP5.addSlider("triSize", 0, 50, 25, 240, 10, 100, 10);
  S1.setNumberOfTickMarks(50);
  S1.setSliderMode(Slider.FLEXIBLE);
  S1.setWindow(controlWindow);
  //  
  ///TAGLINE SIZE
  S2 = controlP5.addSlider("taglineSize", 100, 300, 212, 240, 40, 100, 10);
  S2.setNumberOfTickMarks(200);
  S2.setSliderMode(Slider.FLEXIBLE);
  S2.setWindow(controlWindow);

  ///DETAILS SIZE
  S3 = controlP5.addSlider("detailsSize", 200, 250, 236, 240, 80, 100, 10);
  S3.setNumberOfTickMarks(50);
  S3.setSliderMode(Slider.FLEXIBLE);
  S3.setWindow(controlWindow);
}

