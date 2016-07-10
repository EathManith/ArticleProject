//
//  ScreenTableViewControllerDetail.h
//  UIScreen
//
//  Created by KSHRD on 7/9/16.
//  Copyright © 2016 Teckchun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScreenTableViewControllerDetail : UIViewController
@property (weak, nonatomic) IBOutlet UIView *tblDetailImage;
@property (weak, nonatomic) IBOutlet UILabel *tblLabel;
@property (weak, nonatomic) NSString * tblName;
@property (weak, nonatomic) IBOutlet UITextView *tblDetail;


@end
