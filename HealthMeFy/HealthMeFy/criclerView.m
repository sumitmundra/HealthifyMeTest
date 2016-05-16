//
//  criclerView.m
//  criclerprogress
//
//  Created by Sumit mundra on 5/14/16.
//  Copyright (c) 2016 Sumit mundra. All rights reserved.
//

#import "criclerView.h"

@implementation criclerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor grayColor];
        
        // Determine our start and stop angles for the arc (in radians)
        startAngle = M_PI * 1.5;
        endAngle = startAngle + (M_PI * 2);
        
        
        
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Display our percentage as a string
    
    self.backgroundColor = [UIColor grayColor];
    
    // Determine our start and stop angles for the arc (in radians)
    startAngle = M_PI * 1.5;
    endAngle = startAngle + (M_PI * 2);
    
    UIImageView *tempImgView = [[UIImageView alloc]initWithFrame:rect];
    tempImgView.backgroundColor = [UIColor clearColor];
    [tempImgView setImage:[UIImage imageNamed:@"Weight_graph_icon"]];
    tempImgView.layer.cornerRadius = 25;
    tempImgView.layer.masksToBounds = YES;
    
    [self addSubview:tempImgView];
    
    
    
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    
    // Create our arc, with the correct angles
    [bezierPath addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2)
                          radius:rect.size.width/2-10
                      startAngle:startAngle
                        endAngle:(endAngle - startAngle) * (_percent / 100.0) + startAngle
                       clockwise:YES];
    
    
    UIColor *fillColor = [UIColor purpleColor];
    [fillColor setFill];
    [bezierPath fill];
    // Set the display for the path, and stroke it
    bezierPath.lineWidth = 5;
    [[UIColor redColor] setStroke];
    
    [bezierPath stroke];
    
  

    
    // Text Drawing
    CGRect textRect = CGRectMake((rect.size.width / 2.0) - 71/2.0, (rect.size.height / 2.0) - 45/2.0, 71, 45);
    [[UIColor blackColor] setFill];
   
    
    tempImgView.frame = CGRectMake(15,15,rect.size.width-30, rect.size.height-30);
    tempImgView.layer.cornerRadius = tempImgView.frame.size.width/2;
    tempImgView.layer.masksToBounds = YES;

    
   }

@end
