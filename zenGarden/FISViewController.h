//
//  FISViewController.h
//  zenGarden
//
//  Created by Joshua Motley on 9/12/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISViewController : UIViewController
@property (strong, nonatomic) UIImageView *shrub;
@property (strong, nonatomic) UIImageView *sword;
@property (strong, nonatomic) UIImageView *rake;
@property (strong, nonatomic) UIImageView *rock;



-(BOOL)isSwordAWin:(UIView *)swordView;
-(BOOL)isShrubAWin:(UIView *)shrubView withRake:(UIView *)rakeView;
-(BOOL)isRockAWin:(UIView *)rockView;
-(BOOL)allValid;
-(void)handleSwordPan:(UIPanGestureRecognizer *)panGestureRecognizer;
-(void)handleShrubPan:(UIPanGestureRecognizer *)panGestureRecognizer;
-(void)handleRakePan:(UIPanGestureRecognizer *)panGestureRecognizer;
-(void)handleRockPan:(UIPanGestureRecognizer *)panGestureRecognizer;
-(float)randomXNumber;
-(float)randomYNumber;


@end
