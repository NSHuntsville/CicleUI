//
// Created by Blackmon, Matthew H CTR (US) on 5/28/13.
// Copyright (c) 2013 Blackmon, Matthew H. AMRDEC/PPT. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CicleUI.h"
#define ToRad(deg) 		( (M_PI * (deg)) / 180.0 )
#define ToDeg(rad)		( (180.0 * (rad)) / M_PI )
#define SQR(x)			( (x) * (x) )


//Sourcecode from Apple example clockControl
//Calculate the direction in degrees from a center point to an arbitrary position.
static inline float AngleFromNorth(CGPoint p1, CGPoint p2, BOOL flipped) ;

@interface CicleUI ()
@property(nonatomic, strong) UIImageView *arrow;
@end

@implementation CicleUI {

}



- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor redColor]];
        UIImageView *arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow.png"]];
        [arrow setCenter:self.center];
        [arrow setUserInteractionEnabled:YES];
        self.arrow = arrow;
        [self addSubview:arrow];
    }

    return self;
}

- (void)updateWithNewAngle:(float)angle {
    [UIView animateWithDuration:0.2 animations:^{
        [self.arrow setTransform:CGAffineTransformMakeRotation(ToRad(angle)) ];
        self.currentAngle = angle;
    }];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    float offSetAngle = AngleFromNorth([self center],[touch locationInView:self],  NO);
    NSLog(@"offSetAngle = %f", offSetAngle);
    [self updateWithNewAngle:offSetAngle];
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    float offSetAngle = AngleFromNorth([self center], [touch locationInView:self], NO);
    NSLog(@"offSetAngle = %f", offSetAngle);
    [self updateWithNewAngle:offSetAngle];
    return YES;
}


//Sourcecode from Apple example clockControl
//Calculate the direction in degrees from a center point to an arbitrary position.
static inline float AngleFromNorth(CGPoint p1, CGPoint p2, BOOL flipped) {
    CGPoint v = CGPointMake(p2.x-p1.x,p2.y-p1.y);
    float vmag = sqrt(SQR(v.x) + SQR(v.y)), result = 0;
    v.x /= vmag;
    v.y /= vmag;
    double radians = atan2(v.y,v.x);
    result = ToDeg(radians);
    result = result + 90;
    return (result >=0  ? result : result + 360.0);
}


@end