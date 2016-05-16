//
//  DateTblCell.m
//  HealthMeFy
//
//  Created by Sumit mundra on 5/15/16.
//  Copyright © 2016 Sumit mundra. All rights reserved.
//

#import "DateTblCell.h"

@implementation DateTblCell

- (void)awakeFromNib {
    // Initialization code
    
    
   
    
      NSArray * allDatesOfThisWeek = [self daysThisWeek];
    
    NSLog(@"%@",allDatesOfThisWeek);
    
    for(int i= 1; i<8; i++)
    {
        
        UILabel *tempLbl = (UILabel*)[_tempView viewWithTag:i];
        
        tempLbl.layer.cornerRadius = tempLbl.frame.size.width/2;
        tempLbl.layer.borderColor = [UIColor blackColor].CGColor;
        tempLbl.layer.borderWidth = 2;
        
      
        [tempLbl setText:[allDatesOfThisWeek objectAtIndex:i-1]];
        
    }
    
}


-(NSArray*)daysThisWeek
{
    return  [self daysInWeek:0 fromDate:[NSDate date]];
}


-(NSArray*)daysInWeek:(int)weekOffset fromDate:(NSDate*)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    //ask for current week
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    comps=[calendar components:NSWeekCalendarUnit|NSYearCalendarUnit fromDate:date];
    //create date on week start
    NSDate* weekstart=[calendar dateFromComponents:comps];
    
    NSDateComponents* moveWeeks=[[NSDateComponents alloc] init];
    moveWeeks.weekOfYear=weekOffset;
    weekstart=[calendar dateByAddingComponents:moveWeeks toDate:weekstart options:0];
    
    
    //add 7 days
    NSMutableArray* week=[NSMutableArray arrayWithCapacity:7];
    for (int i=2; i<=8; i++) {
        NSDateComponents *compsToAdd = [[NSDateComponents alloc] init];
        compsToAdd.day=i;
        NSDate *nextDate = [calendar dateByAddingComponents:compsToAdd toDate:weekstart options:0];
        
        NSDateComponents* components1 = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:nextDate];
        

        
        [week addObject:[NSString stringWithFormat:@"%ld",[components1 day]-1]];
        
    }
    return [NSArray arrayWithArray:week];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}





@end
