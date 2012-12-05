void initControls() {

  canvasSelector = controlP5.addDropdownList("canvasSelect", 10, 500, 380, 120);
  canvasSelector.setBackgroundColor(color(190));
  canvasSelector.setItemHeight(15);
  canvasSelector.setBarHeight(15);
  canvasSelector.captionLabel().set("Canvas");
  canvasSelector.addItem("Canvas 1", 1);
  canvasSelector.addItem("Canvas 2", 2);
  canvasSelector.addItem("Canvas 3", 3);
  canvasSelector.moveTo(controlWindow);
  //  println(canvasSelector);


  //CONTROL SET1
  speechBubble1 = controlP5.addSlider2D("Speech Bubble 1", 0, gridN1Cols-1, 0, gridN1Rows-1, gridN1Cols/2, gridN1Rows/2, 10, 10, 100, 100);
  speechBubble1.setArrayValue(new float[] {
    (gridN1Cols-1)/2, (gridN1Rows-1)/2
  }
  );  
  speechBubble1.setWindow(controlWindow);


  S1 = controlP5.addSlider("Speech_Bubble_1_Height", 0, gridN1Cols, gridN1Cols/2, 120, 10, 100, 10);
  S1.setNumberOfTickMarks(gridN1Cols);
  S1.setSliderMode(Slider.FLEXIBLE);
  S1.setWindow(controlWindow);

  S2 = controlP5.addSlider("Speech_Bubble_1_Width", 0, gridN1Rows, gridN1Rows/2, 120, 50, 100, 10);
  S2.setNumberOfTickMarks(gridN1Rows);
  S2.setSliderMode(Slider.FLEXIBLE);
  S2.setWindow(controlWindow);
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup()) {
    // check if the Event was triggered from a ControlGroup
    if (theEvent.group().name() == "canvasSelect") {
      selectedCanvas = "Canvas "+String.valueOf(int(theEvent.group().value()));
    }
  } 
  else if (theEvent.isController()) {
    selectedCanvas = "Canvas ";
  }
}
