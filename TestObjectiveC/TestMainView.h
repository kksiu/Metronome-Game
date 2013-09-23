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

//switch to either use as game or metronome
@property UISwitch *metronomeSwitch;

//label to say whether or not switch is on or off
@property UILabel *switchLabel;

//button to say play again when needed
@property UIButton *playAgain;

//label to show next to button
@property UILabel *countLabel;

//show results of game
@property UILabel *results;

@end
