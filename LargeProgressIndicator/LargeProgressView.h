//
//  LargeProgressView.h
//  LargeProgressView
//
//  Created by Tom Nys on 14/02/13.
//  Copyright (c) 2013 Netwalk VOF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LargeProgressView : UIView

@property (nonatomic) CGFloat progress;
@property (nonatomic, strong) UIColor* textColor;
@property (nonatomic, strong) UIColor* inactiveColor;
@property (nonatomic, strong) UIColor* shadowColor;

@end
