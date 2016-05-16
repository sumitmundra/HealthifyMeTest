//
//  ViewController.h
//  HealthMeFy
//
//  Created by Sumit mundra on 5/14/16.
//  Copyright (c) 2016 Sumit mundra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong) IBOutlet UITableView *tblView;
@property (nonatomic, strong) NSMutableArray *dataArray;


@property (nonatomic, strong) NSMutableDictionary *expendDict;

@end

