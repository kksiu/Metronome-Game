//
//  TestMainView.m
//  TestObjectiveC
//
//  Created by Kenneth Siu on 9/21/13.
//  Copyright (c) 2013 Kenneth Siu. All rights reserved.
//

#import "TestMainView.h"

#define VERTICAL_FRAME 100
#define HORIZONTAL_FRAME 50
#define SLIDER_WIDTH 500
#define SHOWMETCOUNT_WIDTH 30
#define SHOWMETCOUNT_HEIGHT 30
#define BUTTON_WIDTH 300
#define BUTTON_HEIGHT 300

@implementation TestMainView

@synthesize metronomeCount, showMetronomeCount, pressButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        metronomeCount = [[UISlider alloc] initWithFrame:CGRectMake(HORIZONTAL_FRAME, VERTICAL_FRAME, SLIDER_WIDTH, SHOWMETCOUNT_HEIGHT)];
        
        showMetronomeCount = [[UILabel alloc] initWithFrame:CGRectMake(metronomeCount.frame.origin.x + metronomeCount.frame.size.width + HORIZONTAL_FRAME, VERTICAL_FRAME, SHOWMETCOUNT_WIDTH, SHOWMETCOUNT_HEIGHT)];

        pressButton = [[UIButton alloc] initWithFrame:CGRectMake((self.frame.size.width / 2) - (BUTTON_WIDTH / 2), (self.frame.size.height / 2) - (BUTTON_HEIGHT / 2), BUTTON_WIDTH, BUTTON_HEIGHT)];
        
        showMetronomeCount.text = @"200";
        
        [pressButton setTitle:@"HIHIHI" forState:UIControlStateNormal];
        [pressButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        pressButton.backgroundColor = [UIColor blackColor];
        pressButton.layer.cornerRadius = 10;
        pressButton.clipsToBounds = YES;
        
        [self addSubview:showMetronomeCount];
        [self addSubview:metronomeCount];
        [self addSubview:pressButton];
        
        
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
