//
//  ViewController.m
//  HealthMeFy
//
//  Created by Sumit mundra on 5/14/16.
//  Copyright (c) 2016 Sumit mundra. All rights reserved.
//

#import "ViewController.h"
#import "DateTblCell.h"
#import "WaightTblCell.h"
#import "CalTblCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.title = @"Today";
    
    self.expendDict = [[NSMutableDictionary alloc]init];
    
    for(int i =0 ; i< 5 ; i++)
    {
        [self.expendDict setObject:@"0" forKey:[NSString stringWithFormat:@"%d",i]];
    }
    
    
    
    NSMutableDictionary *tempDict = [[NSMutableDictionary alloc]init];
    [tempDict setObject:@"100 of 1200 cal eaten" forKey:@"title"];
    
    [tempDict setObject:[NSString stringWithFormat:@"%f",0.5] forKey:@"progress"];
    
    NSMutableDictionary *tempDict1 = [[NSMutableDictionary alloc]init];
    [tempDict1 setObject:@"0 of 12 Glass Consumed" forKey:@"title"];
    
    [tempDict1 setObject:[NSString stringWithFormat:@"%d",0] forKey:@"progress"];
    
    
    NSMutableDictionary *tempDict2 = [[NSMutableDictionary alloc]init];
    [tempDict2 setObject:@"0 of 367 cal burnt" forKey:@"title"];
    
    [tempDict2 setObject:[NSString stringWithFormat:@"%d",0] forKey:@"progress"];
    
    NSMutableDictionary *tempDict3 = [[NSMutableDictionary alloc]init];
    [tempDict3 setObject:@"0 of 4.6 Kgs Losts" forKey:@"title"];
    
    [tempDict3 setObject:[NSString stringWithFormat:@"%d",0] forKey:@"progress"];
    
    NSMutableDictionary *tempDict4 = [[NSMutableDictionary alloc]init];
    [tempDict4 setObject:@"0 of 60000 Step" forKey:@"title"];
    
    [tempDict4 setObject:[NSString stringWithFormat:@"%d",0] forKey:@"progress"];
    
    self.dataArray = [[NSMutableArray alloc]initWithObjects:tempDict,tempDict1,tempDict2,tempDict3,tempDict4, nil];
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if([[self.expendDict objectForKey:[NSString stringWithFormat:@"%ld",(long)section]] isEqualToString:@"0"])
        return 0;
    else
        return 1;
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 85;
}


-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSArray *viewArray =  [[NSBundle mainBundle] loadNibNamed:@"TableHeader" owner:self options:nil];
    UIView *view = [viewArray objectAtIndex:0];
    
    
    
    UILabel *titleLbl = (UILabel*)[view viewWithTag:2];
    NSDictionary *tempDict = [self.dataArray objectAtIndex:section];
    
    titleLbl.text = [tempDict objectForKey:@"title"];
    
    UIProgressView *progressView = (UIProgressView*)[view viewWithTag:3];
    [progressView setProgress:[[tempDict objectForKey:@"progress"] floatValue]];
    
    UIButton *btn = (UIButton*)[view viewWithTag:6];
    btn.tag = section;
    [btn addTarget:self action:@selector(expandView:) forControlEvents:UIControlEventTouchUpInside];
    
    
    if(section==1)
    {
        UIButton *tempBtn = (UIButton*)[view viewWithTag:4];
        
        tempBtn.hidden = YES;
    }
    
    
    
   
    return view;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section<3)
        return 170;
    
    return 150;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0 ||indexPath.section==2)
    {
        static NSString *CellIdentifier = @"CalTblCell";
        CalTblCell *cell = (CalTblCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CalTblCell"  owner:self options:nil];
            
            cell = [nib objectAtIndex:0];
            //             cell.rightUtilityButtons = [self rightButtons];
        }
        
        
        if(indexPath.section==0)
        {
            cell.numberOfRow = 2;
            cell.typeStr = @"1";

        }else{
        cell.numberOfRow = 2;
        cell.typeStr = @"2";
        }
        
        cell.backgroundColor = [UIColor grayColor];
        
        [cell setContainent];
        
        cell.backgroundColor = [UIColor grayColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
        
    }
    
    else if(indexPath.section==3)
    {
        static NSString *CellIdentifier = @"WaightTblCell";
        WaightTblCell *cell = (WaightTblCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"WaightTblCell"  owner:self options:nil];
            
            cell = [nib objectAtIndex:0];
            //             cell.rightUtilityButtons = [self rightButtons];
        }
        
        
        
        //        [cell setData];
        
        cell.backgroundColor = [UIColor grayColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;

    }
    
    else if(indexPath.section==4)
    {
        
        static NSString *CellIdentifier = @"DateTblCell";
        DateTblCell *cell = (DateTblCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DateTblCell"  owner:self options:nil];
            
            cell = [nib objectAtIndex:0];
            //             cell.rightUtilityButtons = [self rightButtons];
        }
        
        
        
        //        [cell setData];
        
        cell.backgroundColor = [UIColor grayColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;

    }
    
    return nil;
}


-(void)expandView:(id)sender
{
    
    UIButton *btn = (UIButton*)sender;
    
    if(btn.tag==1)
    {
        return;
    }
    
    if([[self.expendDict objectForKey:[NSString stringWithFormat:@"%ld",(long)btn.tag]] isEqualToString:@"0"])
    {
        [self.expendDict setObject:@"1" forKey:[NSString stringWithFormat:@"%ld",(long)btn.tag]];
    }else
    {
         [self.expendDict setObject:@"0" forKey:[NSString stringWithFormat:@"%ld",(long)btn.tag]];
    }
    
    
    [self.tblView reloadData];
    
}



@end
