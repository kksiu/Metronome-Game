//
//  MainViewController.m
//  TestObjectiveC
//
//  Created by Kenneth Siu on 9/21/13.
//  Copyright (c) 2013 Kenneth Siu. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize beatsPerSec, label, timer, audioPlayer, switchLabel, metronomeSwitch, timerGame, count, isGameDone, pressButton, playAgain, countOfTime, countLabel, secondsClose, slider;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        TestMainView *viewCont = [[TestMainView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
        
        //make weak pointer to point to label
        label = viewCont.showMetronomeCount;
        
        switchLabel = viewCont.switchLabel;
        
        switchLabel.text = @"Is Metronome: Off";
        [viewCont.metronomeSwitch setOn:NO];
        
        pressButton = viewCont.pressButton;
        
        playAgain = viewCont.playAgain;
        
        metronomeSwitch = viewCont.metronomeSwitch;
        
        countLabel = viewCont.countLabel;
        
        secondsClose = viewCont.results;
        slider = viewCont.metronomeCount;
        
        viewCont.metronomeCount.minimumValue = 30;
        viewCont.metronomeCount.maximumValue = 150;
        viewCont.metronomeCount.value = viewCont.metronomeCount.maximumValue / 2;
        beatsPerSec = viewCont.metronomeCount.value;

        
        [self updateLabel:viewCont.metronomeCount.value];
        
        
        //set up what happens when the slider is changed
        [viewCont.metronomeCount addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
        
        
        //set up what happens when button is pressed
        [viewCont.pressButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchDown];
        
        [viewCont.pressButton addTarget:self action:@selector(buttonDepressed:) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
        
        //set up switch
        [viewCont.metronomeSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
        
        NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Hi.mp3", [[NSBundle mainBundle] resourcePath]]];
        
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        
        //initialize count array
        countOfTime = [[NSMutableArray alloc] init];
        
        isGameDone = NO;
        
        [playAgain addTarget:self action:@selector(playAgain:) forControlEvents:UIControlEventTouchDown];
        
        self.view = viewCont;
    }
    return self;
}

-(IBAction)sliderChanged:(UISlider*)slid {
    
    beatsPerSec = roundf(slider.value);
    [self updateLabel:beatsPerSec];
    
    if(metronomeSwitch.isOn) {
        [self updateTimer];
    }
    
}

-(IBAction)buttonPressed:(UIButton*)button {
    button.backgroundColor = [UIColor blueColor];
    
    if([countOfTime count] == 0) {
        [self startGame];
        [countOfTime addObject:[NSDate date]];
    }
    else {
        [countOfTime addObject:[NSDate date]];
        
    }

}

-(IBAction) playAgain:(UIButton*)button {
    [playAgain setHidden:YES];
    countOfTime = [[NSMutableArray alloc] init];
    [pressButton setEnabled:YES];
    secondsClose.hidden = YES;
}

-(IBAction)buttonDepressed:(UIButton*)button {
    button.backgroundColor = [UIColor blackColor];
}

-(IBAction)switchChanged:(UISwitch*) mSwitch {
    
    if(mSwitch.isOn) {
        
        playAgain.enabled = NO;
        pressButton.enabled = NO;
        switchLabel.text = @"Is Metronome: On";
        [self updateTimer];
        isGameDone = YES;
    }
    else {
        switchLabel.text = @"Is Metronome: Off";
        if(timer != nil) {
            [timer invalidate];
        }
        playAgain.enabled = YES;
        
        if(playAgain.hidden) {
            pressButton.enabled = YES;
        }
    }
    
}


- (void)startGame {
    timerGame = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(gameTimer:) userInfo:nil repeats:YES];
    
    countLabel.text = @"5";
    countLabel.hidden = NO;
    
    slider.enabled = NO;
    metronomeSwitch.enabled = NO;
    
    
}

- (void)endGame {
    [timerGame invalidate];
    count = 0;
    countLabel.hidden = YES;
    
    [pressButton setEnabled:NO];
    
    [playAgain setHidden:NO];
    
    
    NSMutableArray *differences = [[NSMutableArray alloc] init];
    
    for(int i = 1; i < [countOfTime count]; i++) {
        
        NSDate *date2 = [countOfTime objectAtIndex:i];
        NSDate *date1 = [countOfTime objectAtIndex:i - 1];
        
        NSTimeInterval secondsBetween = [date2 timeIntervalSinceDate:date1];
        
        [differences addObject:[NSNumber numberWithDouble:secondsBetween]];
    }
    
    //now average out differences
    
    if([differences count] == 0) {
        secondsClose.text = @"YOU BARELY PRESSED THE BUTTON!";

    }
    else {
        double avgInterval = 0;
        
        for(NSNumber *num in differences) {
            avgInterval += [num doubleValue];
        }
        
        avgInterval /= [differences count];
        
        double howClose = avgInterval - (60.0 / beatsPerSec);
        
        if(howClose < 0) {
            howClose *= -1;
        }
        
        secondsClose.text = [NSString stringWithFormat:@"Your average was %.3f seconds close to being with a real metronome!", howClose];
    }
    
    secondsClose.hidden = NO;
    
    slider.enabled = YES;
    metronomeSwitch.enabled = YES;
    
}

- (void)updateTimer {
    
    if(timer != nil) {
        [timer invalidate];
    }
    
    timer = [NSTimer scheduledTimerWithTimeInterval:(60.0 / beatsPerSec) target:self selector:@selector(playSound:) userInfo:nil repeats:YES];
}

- (IBAction)gameTimer:(NSTimer*) tr {
    if(count >= 4) {
        [self endGame];
    }
    else {
        count++;
        countLabel.text = [NSString stringWithFormat:@"%i", 5 -count];
    }
}

- (IBAction)playSound:(NSTimer*) tr {
    [audioPlayer play];
}

-(void)updateLabel:(int)value {
    label.text = [NSString stringWithFormat:@"%i", value];

}

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
