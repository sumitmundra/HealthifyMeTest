//
//  CalTblCell.m
//  HealthMeFy
//
//  Created by Sumit mundra on 5/15/16.
//  Copyright © 2016 Sumit mundra. All rights reserved.
//

#import "CalTblCell.h"
#import "DateTblCell.h"
#import "FitnessTblCell.h"
#import "AppDelegate.h"
#import "criclerView.h"
@implementation CalTblCell

- (void)awakeFromNib {
    // Initialization code
    
    
    
    
    
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(void)setContainent
{
    if([self.typeStr isEqualToString:@"1"])
    {
        
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"EatView"  owner:self options:nil];
        
        UIView *tempView = [nib objectAtIndex:0];
        
        for (int i =1; i<5; i++) {
        
            criclerView *tempCriclView = [tempView viewWithTag:10+i];
            
            tempCriclView.percent = 20;
            
            UILabel *tempLbl = (UILabel*)[tempView viewWithTag:20+i];
            
            tempLbl.text = @"20 grams";
            
            
        }
         AppDelegate *appdelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        [tempView setFrame:CGRectMake(0, 0, appdelegate.window.frame.size.width, 148)];
        
        [self.tempScView addSubview:tempView];
        
        NSArray *nib1 = [[NSBundle mainBundle] loadNibNamed:@"DateTblCell"  owner:self options:nil];
        
        UIView *tempView1 = [nib1 objectAtIndex:0];
        
        
        
        [tempView1 setFrame:CGRectMake(appdelegate.window.frame.size.width, 0, appdelegate.window.frame.size.width, appdelegate.window.frame.size.height)];
        
        [self.tempScView addSubview:tempView1];
        [self.tempScView setContentSize:CGSizeMake(self.numberOfRow*appdelegate.window.frame.size.width, 0)];

        
        
    }else
    {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DateTblCell"  owner:self options:nil];
        
        UIView *tempView = [nib objectAtIndex:0];
        
        AppDelegate *appdelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        
        
        [tempView setFrame:CGRectMake(0, 0, appdelegate.window.frame.size.width, appdelegate.window.frame.size.height)];
        
        [self.tempScView addSubview:tempView];
        

        NSArray *nib1 = [[NSBundle mainBundle] loadNibNamed:@"FitnessTblCell"  owner:self options:nil];
        
        UIView *tempView1 = [nib1 objectAtIndex:0];
        
        [tempView1 setFrame:CGRectMake(appdelegate.window.frame.size.width, 0, appdelegate.window.frame.size.width, appdelegate.window.frame.size.height)];
        
        [self.tempScView addSubview:tempView1];
        
        [self.tempScView setContentSize:CGSizeMake(self.numberOfRow*appdelegate.window.frame.size.width, 0)];
        
    }
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.tempScView.frame.size.width;
    NSInteger page = (NSInteger)floor((self.tempScView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
     AppDelegate *appdelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.pageController.currentPage = page;
    
    [self.tempScView setContentOffset:CGPointMake(page*appdelegate.window.frame.size.width, 0)];
}


@end
