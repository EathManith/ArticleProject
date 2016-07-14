//
//  ScreenTableViewControllerDetail.m
//  UIScreen
//
//  Created by KSHRD on 7/9/16.
//  Copyright © 2016 Teckchun. All rights reserved.
//

#import "ScreenTableViewControllerDetail.h"
#import "ScreenTableView.h"

@implementation ScreenTableViewControllerDetail

@synthesize tblDetailImage;
@synthesize tblLabel;
@synthesize tblName;
@synthesize tblDetail;

-(void)viewDidLoad{
    [super viewDidLoad];
    // Set the Label text with the selected recipe
    tblLabel.text =tblName;
}


@end
