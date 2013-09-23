//
//  MainViewController.h
//  TestObjectiveC
//
//  Created by Kenneth Siu on 9/21/13.
//  Copyright (c) 2013 Kenneth Siu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestMainView.h"
#import <AVFoundation/AVFoundation.h>

@interface MainViewController : UIViewController

//indicates the beats per Second
@property int beatsPerSec;

@property (nonatomic, weak) UILabel *label;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@property (nonatomic, weak) UILabel *switchLabel;

@property (nonatomic, weak) UISwitch *metronomeSwitch;

@property (nonatomic, strong) NSTimer *timerGame;

@property (nonatomic, weak) UIButton *pressButton;

@property (nonatomic, weak) UIButton *playAgain;

@property (nonatomic, weak) UILabel *countLabel;

@property (nonatomic, weak) UILabel *secondsClose;

@property (nonatomic, weak) UISlider *slider;

@property BOOL isGameDone;

@property int count;

@property (nonatomic, strong) NSMutableArray *countOfTime;

@end
