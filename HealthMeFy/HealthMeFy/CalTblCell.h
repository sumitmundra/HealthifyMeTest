//
//  CalTblCell.h
//  HealthMeFy
//
//  Created by Sumit mundra on 5/15/16.
//  Copyright © 2016 Sumit mundra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalTblCell : UITableViewCell<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *tempScView;

@property (nonatomic, strong) IBOutlet UIPageControl *pageController;

@property (nonatomic, strong) NSString *typeStr;

@property NSInteger numberOfRow;


-(void)setContainent;

@end
