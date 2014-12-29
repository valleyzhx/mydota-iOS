//
//  TTTableViewController.h
//  MyDota
//
//  Created by Simplan on 14/11/22.
//  Copyright (c) 2014年 Simplan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScoreTableScollDelegate.h"

@interface TTTableViewController : UITableViewController
@property(nonatomic,assign)id<ScoreTableScollDelegate>scoreDelegate;
@property(nonatomic,strong)NSString *userId;
@property(nonatomic,strong)NSDictionary *scoreInfoDic;
@property(nonatomic,strong)NSDictionary *totalDic;
@end
