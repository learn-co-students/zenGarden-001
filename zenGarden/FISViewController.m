//
//  FISViewController.m
//  zenGarden
//
//  Created by Joshua Motley on 9/12/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISViewController.h"
#define ARC4RANDOM_MAX      0x100000000

@interface FISViewController ()

@end

@implementation FISViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // add images to view
    
    CGRect swordRect = CGRectMake([self randomXNumber], [self randomYNumber], 100, 100);
    UIImage *swordimage = [UIImage imageNamed:@"swordinrock.png"];
    UIImageView *swordImageView = [[UIImageView alloc]initWithFrame:swordRect];
    swordImageView.image = swordimage;
        [swordImageView setUserInteractionEnabled:YES];
    [self.view addSubview:swordImageView];
    self.sword = swordImageView;
    
    CGRect shrubRect = CGRectMake([self randomXNumber], [self randomYNumber], 100, 100);
    UIImage *shrubimage = [UIImage imageNamed:@"shrub.png"];
    UIImageView *shrubImageView = [[UIImageView alloc]initWithFrame:shrubRect];
    shrubImageView.image = shrubimage;
    [shrubImageView setUserInteractionEnabled:YES];
    [self.view addSubview:shrubImageView];
    self.shrub = shrubImageView;
    
    CGRect rakeRect = CGRectMake([self randomXNumber], [self randomYNumber], 100, 100);
    UIImage *rakeimage = [UIImage imageNamed:@"rake.png"];
    UIImageView *rakeImageView = [[UIImageView alloc]initWithFrame:rakeRect];
    rakeImageView.image = rakeimage;
    [rakeImageView setUserInteractionEnabled:YES];
    [self.view addSubview:rakeImageView];
    self.rake = rakeImageView;
    
    CGRect rockRect = CGRectMake([self randomXNumber], [self randomYNumber], 100, 100);
    UIImage *rockimage = [UIImage imageNamed:@"rock1.png"];
    UIImageView *rockImageView = [[UIImageView alloc]initWithFrame:rockRect];
    rockImageView.image = rockimage;
    [rockImageView setUserInteractionEnabled:YES];
    [self.view addSubview:rockImageView];
    self.rock = rockImageView;
    

    
    
 
    // add pan gestures to image views
  
    
    UIPanGestureRecognizer *swordPanGesture = [[UIPanGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleSwordPan:)];
    UIPanGestureRecognizer *shrubPanGesture = [[UIPanGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleShrubPan:)];
    UIPanGestureRecognizer *rakePanGesture = [[UIPanGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleRakePan:)];
    UIPanGestureRecognizer *rockPanGesture = [[UIPanGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleRockPan:)];
    
    [swordImageView addGestureRecognizer:swordPanGesture];
    [shrubImageView addGestureRecognizer:shrubPanGesture];
    [rakeImageView addGestureRecognizer:rakePanGesture];
    [rockImageView addGestureRecognizer:rockPanGesture];
}

// configure image views and call custom 'win' methods

-(void)handleSwordPan:(UIPanGestureRecognizer *)panGestureRecognizer
{
    CGPoint translation = [panGestureRecognizer translationInView:panGestureRecognizer.view];
    
    panGestureRecognizer.view.center = CGPointMake(panGestureRecognizer.view.center.x+translation.x, panGestureRecognizer.view.center.y+translation.y);
    [panGestureRecognizer setTranslation:CGPointMake(0, 0) inView:panGestureRecognizer.view];
    
    UIGestureRecognizerState state = [panGestureRecognizer state];
    
    if (state == UIGestureRecognizerStateEnded)
    {
       
        [self isSwordAWin:self.sword];
        [self allValid];
    }
    }

-(void)handleShrubPan:(UIPanGestureRecognizer *)panGestureRecognizer
{
    CGPoint translation = [panGestureRecognizer translationInView:panGestureRecognizer.view];
    
    panGestureRecognizer.view.center = CGPointMake(panGestureRecognizer.view.center.x+translation.x, panGestureRecognizer.view.center.y+translation.y);
    [panGestureRecognizer setTranslation:CGPointMake(0, 0) inView:panGestureRecognizer.view];
    
    UIGestureRecognizerState state = [panGestureRecognizer state];
    
    if (state == UIGestureRecognizerStateEnded)
    {
        
        [self isShrubAWin:self.shrub withRake:self.rake];
        [self allValid];
    }
}

-(void)handleRakePan:(UIPanGestureRecognizer *)panGestureRecognizer
{
    CGPoint translation = [panGestureRecognizer translationInView:panGestureRecognizer.view];
    
    panGestureRecognizer.view.center = CGPointMake(panGestureRecognizer.view.center.x+translation.x, panGestureRecognizer.view.center.y+translation.y);
    [panGestureRecognizer setTranslation:CGPointMake(0, 0) inView:panGestureRecognizer.view];
    
    UIGestureRecognizerState state = [panGestureRecognizer state];
    
    if (state == UIGestureRecognizerStateEnded)
    {
        
        [self isShrubAWin:self.shrub withRake:self.rake];
        [self allValid];
    }
}

-(void)handleRockPan:(UIPanGestureRecognizer *)panGestureRecognizer
{
    CGPoint translation = [panGestureRecognizer translationInView:panGestureRecognizer.view];
    
    panGestureRecognizer.view.center = CGPointMake(panGestureRecognizer.view.center.x+translation.x, panGestureRecognizer.view.center.y+translation.y);
    [panGestureRecognizer setTranslation:CGPointMake(0, 0) inView:panGestureRecognizer.view];
    
    UIGestureRecognizerState state = [panGestureRecognizer state];
    
    if (state == UIGestureRecognizerStateEnded)
    {
       
        [self isRockAWin:self.rock];
         [self allValid];
 

    }
}



// configure custom 'win' methods

-(BOOL)isSwordAWin:(UIView *)swordView{
    CGRect winRect = CGRectMake(-10, -10, 220, 220);
   

    if (CGRectContainsRect(winRect, self.sword.frame)) {
        NSLog(@"Sword in right place");
        return YES;
    }else{
        return NO;
    }
}

-(BOOL)isRockAWin:(UIView *)rockView{
    CGRect rockWinRect = CGRectMake(0, 284, 320, 284);

    

    if (CGRectContainsRect(rockWinRect, self.rock.frame)) {
        NSLog(@"Rock in right place");
        return YES;
    }else{
        return NO;
    }
}


-(BOOL)isShrubAWin:(UIView *)shrubView withRake:(UIView *)rakeView{
    
    if (CGRectIntersectsRect(shrubView.frame, rakeView.frame)) {
        NSLog(@"Shrub and Rake intersect!!");
        return YES;
    }
    return NO;
}

// this method determines winner and alerts user of win

-(BOOL)allValid{
    
    if ([self isShrubAWin:self.shrub withRake:self.rake] && [self isSwordAWin:self.sword] &&
        [self isRockAWin:self.rock]) {
        UIAlertView *newAlert = [[UIAlertView alloc]initWithTitle:@"WINNER" message:@"You've Won!!!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [newAlert show];
        return YES;
    }
    return NO;
    
}

// configure random number method for random rect position

-(float)randomXNumber{
    float val = floorf(((float)arc4random() / ARC4RANDOM_MAX) * 250.0f);
    return val;
    
}

-(float)randomYNumber{
    float val = floorf(((float)arc4random() / ARC4RANDOM_MAX) * 568.0f);
    return val;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
