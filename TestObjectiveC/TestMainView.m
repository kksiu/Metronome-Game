//
//  TestMainView.m
//  TestObjectiveC
//
//  Created by Kenneth Siu on 9/21/13.
//  Copyright (c) 2013 Kenneth Siu. All rights reserved.
//

#import "TestMainView.h"

#define VERTICAL_FRAME 100
#define HORIZONTAL_FRAME 70
#define SLIDER_WIDTH 500
#define SHOWMETCOUNT_WIDTH 30
#define SHOWMETCOUNT_HEIGHT 30
#define BUTTON_WIDTH 300
#define BUTTON_HEIGHT 300
#define PLAYAGAIN_WIDTH 150
#define PLAYAGAIN_HEIGHT 50
#define SWITCH_WIDTH 50
#define SWITCHLABEL_WIDTH 175
#define LABEL_WIDTH 30
#define LABEL_HEIGHT 30
#define RESULTS_WIDTH 580


@implementation TestMainView

@synthesize metronomeCount, showMetronomeCount, pressButton, metronomeSwitch, switchLabel, playAgain, countLabel, results;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //set up sizes for uiviews
        metronomeCount = [[UISlider alloc] initWithFrame:CGRectMake(HORIZONTAL_FRAME, VERTICAL_FRAME, SLIDER_WIDTH, SHOWMETCOUNT_HEIGHT)];
        
        showMetronomeCount = [[UILabel alloc] initWithFrame:CGRectMake(metronomeCount.frame.origin.x + metronomeCount.frame.size.width + HORIZONTAL_FRAME, VERTICAL_FRAME, SHOWMETCOUNT_WIDTH, SHOWMETCOUNT_HEIGHT)];

        pressButton = [[UIButton alloc] initWithFrame:CGRectMake((self.frame.size.width / 2) - (BUTTON_WIDTH / 2), (self.frame.size.height / 2) - (BUTTON_HEIGHT / 2), BUTTON_WIDTH, BUTTON_HEIGHT)];
        
        metronomeSwitch = [[UISwitch alloc] initWithFrame:CGRectMake((self.frame.size.width / 2) - (SWITCH_WIDTH / 2), self.frame.size.height - 100, SWITCH_WIDTH, 0)];
        
        switchLabel = [[UILabel alloc] initWithFrame:CGRectMake(metronomeSwitch.frame.origin.x - SWITCHLABEL_WIDTH, metronomeSwitch.frame.origin.y, SWITCHLABEL_WIDTH, 30)];
        
        playAgain = [[UIButton alloc] initWithFrame:CGRectMake(pressButton.frame.origin.x + (pressButton.frame.size.width / 2) - (PLAYAGAIN_WIDTH / 2), pressButton.frame.origin.y + pressButton.frame.size.height + VERTICAL_FRAME - 50, PLAYAGAIN_WIDTH, PLAYAGAIN_WIDTH)];
        
        countLabel = [[UILabel alloc] initWithFrame:CGRectMake(pressButton.frame.origin.x - 100, pressButton.frame.origin.y + (pressButton.frame.size.height / 2), LABEL_WIDTH, LABEL_HEIGHT)];
        
        results = [[UILabel alloc] initWithFrame:CGRectMake(pressButton.frame.origin.x + (pressButton.frame.size.width / 2) - (RESULTS_WIDTH / 2), pressButton.frame.origin.y - 50, (RESULTS_WIDTH), LABEL_HEIGHT)];
        
        showMetronomeCount.text = @"200";
        
        [pressButton setTitle:@"PRESS HERE TO TEST" forState:UIControlStateNormal];
        [pressButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        pressButton.backgroundColor = [UIColor blackColor];
        pressButton.layer.cornerRadius = 10;
        pressButton.clipsToBounds = YES;
        
        [playAgain setTitle:@"Play Again?" forState:UIControlStateNormal];
        [playAgain setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        playAgain.backgroundColor = [UIColor blackColor];
        playAgain.layer.cornerRadius = 10;
        playAgain.clipsToBounds = YES;
        playAgain.hidden = YES;
        
        countLabel.text = @"5";
        countLabel.hidden = YES;
        
        switchLabel.text = @"TEMPORARY TEXT";
        
        results.text = @"YOU WERE THIS seconds CLOSE";
        results.hidden = YES;

        
        [self addSubview:showMetronomeCount];
        [self addSubview:metronomeCount];
        [self addSubview:pressButton];
        [self addSubview:metronomeSwitch];
        [self addSubview:switchLabel];
        [self addSubview:playAgain];
        [self addSubview:countLabel];
        [self addSubview:results];
        
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
