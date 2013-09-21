//
//  TestMainView.h
//  TestObjectiveC
//
//  Created by Kenneth Siu on 9/21/13.
//  Copyright (c) 2013 Kenneth Siu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface TestMainView : UIView

//this will hold the count of how many beats there are per minute
@property UISlider *metronomeCount;

//this will show the beats per minute based on the slider
@property UILabel *showMetronomeCount;

//this will be pressed when user wants to play their note
@property UIButton *pressButton;

@end
