//
//  FISZenViewController.m
//  zenGarden
//
//  Created by James Campagno on 6/9/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISZenViewController.h"
#import "UIView+ViewDistance.h"

@interface FISZenViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *shrub;
@property (strong, nonatomic) IBOutlet UIImageView *swordinrock;
@property (strong, nonatomic) IBOutlet UIImageView *rake;
@property (strong, nonatomic) IBOutlet UIImageView *rock;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *shrubCenterX;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *shrubCenterY;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *swordinrockCenterY;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *swordinrockCenterX;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rakeCenterY;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rakeCenterX;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rockCenterY;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rockCenterX;

@property (nonatomic) CGPoint oldPosition;

@property (weak, nonatomic) UIImageView *highlightedImage;
@property (weak, nonatomic) NSLayoutConstraint *highlightedImageX;
@property (weak, nonatomic) NSLayoutConstraint *highlightedImageY;
@property (strong, nonatomic) UITapGestureRecognizer *tapToMove;

@end

@implementation FISZenViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupPannedGestureRecognizersOnUIImageviewObjects];
    
    [self setupDoubleTappedGesturesOnUIImageviewObjects];
    
    [self randomizeTheXandYofTheUIImageviewObjectsOnInitialLoad];
}

- (void)setupPannedGestureRecognizersOnUIImageviewObjects {
    
    UIPanGestureRecognizer *panShrub = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panned:)];
    UIPanGestureRecognizer *panSword = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panned:)];
    UIPanGestureRecognizer *panRake = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panned:)];
    UIPanGestureRecognizer *panRock = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panned:)];
    
    [self.shrub addGestureRecognizer:panShrub];
    [self.swordinrock addGestureRecognizer:panSword];
    [self.rake addGestureRecognizer:panRake];
    [self.rock addGestureRecognizer:panRock];

    self.shrub.userInteractionEnabled = YES;
    self.swordinrock.userInteractionEnabled = YES;
    self.rake.userInteractionEnabled = YES;
    self.rock.userInteractionEnabled = YES;
}

- (void)setupDoubleTappedGesturesOnUIImageviewObjects {
    
    UITapGestureRecognizer *tapShrub = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTapped:)];
    
    UITapGestureRecognizer *tapSword = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTapped:)];
    
    UITapGestureRecognizer *tapRake = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTapped:)];
    
    UITapGestureRecognizer *tapRock = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTapped:)];
    
    [tapShrub setNumberOfTapsRequired:2];
    [tapSword setNumberOfTapsRequired:2];
    [tapRake setNumberOfTapsRequired:2];
    [tapRock setNumberOfTapsRequired:2];

    [self.shrub addGestureRecognizer:tapShrub];
    [self.swordinrock addGestureRecognizer:tapSword];
    [self.rake addGestureRecognizer:tapRake];
    [self.rock addGestureRecognizer:tapRock];
}

- (void)randomizeTheXandYofTheUIImageviewObjectsOnInitialLoad {
    
    [self scrambleX:self.swordinrockCenterX andY:self.swordinrockCenterY];
    [self scrambleX:self.shrubCenterX andY:self.shrubCenterY];
    [self scrambleX:self.rakeCenterX andY:self.rakeCenterY];
    [self scrambleX:self.rockCenterX andY:self.rockCenterY];
}

- (void)panned:(UIPanGestureRecognizer *)gesture {
    
    CGPoint fingerlocation = [gesture locationInView:self.view];
    
    if ( gesture.state == UIGestureRecognizerStateBegan ) {
        self.oldPosition = fingerlocation;
    }
    
    CGFloat deltaX = fingerlocation.x - self.oldPosition.x;
    CGFloat deltaY = fingerlocation.y - self.oldPosition.y;
    
    if(gesture.view == self.rake) {
        
        self.rakeCenterX.constant += deltaX;
        self.rakeCenterY.constant += deltaY;
        
    } else if (gesture.view == self.rock) {
        
        self.rockCenterX.constant += deltaX;
        self.rockCenterY.constant += deltaY;
        
    } else if(gesture.view == self.swordinrock) {
        
        self.swordinrockCenterX.constant += deltaX;
        self.swordinrockCenterY.constant += deltaY;
        
    } else if(gesture.view == self.shrub) {
        
        self.shrubCenterX.constant += deltaX;
        self.shrubCenterY.constant += deltaY;
    }
    
    self.oldPosition = fingerlocation;
    
    if ( gesture.state == UIGestureRecognizerStateEnded ) {
        [self checkForWinner];
    }
}

- (void)checkForWinner {
    
    if ( [self isShrubNearRake] && [self isSwordInUpperLeft] && [self isRockInDifferentYAxisThanSword] ) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations..." message:@"You Won!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        
        [alert show];
    }
}

- (BOOL)isShrubNearRake {
    
    double distanceBetweenShrubAndRake = [self.shrub distanceToView:self.rake];
    
    if ( distanceBetweenShrubAndRake < 100 ) {
        return YES;
    }
    
    return NO;
}

- (BOOL)isSwordInUpperLeft {
    
    CGFloat viewCenterX = self.view.center.x;
    CGFloat viewCenterY = self.view.center.y;
    
    if ( self.swordinrock.center.x < viewCenterX+20 && self.swordinrock.center.y < viewCenterY+20 ) {
        return YES;
    }
    
    return NO;
}

- (BOOL)isRockInDifferentYAxisThanSword {
    CGFloat viewCenterY = self.view.center.y;
    
    if ( (self.swordinrock.center.y < viewCenterY+20 && self.rock.center.y > viewCenterY+20) ||
        (self.swordinrock.center.y > viewCenterY+20 && self.rock.center.y < viewCenterY+20) ) {
        
        return YES;
    }
    
    return NO;
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger) buttonIndex {
    
    if (buttonIndex == 0) {
        
        NSLog(@"Cancel Tapped.");
        
    } else if (buttonIndex == 1) {
        
        [self scrambleX:self.swordinrockCenterX andY:self.swordinrockCenterY];
        [self scrambleX:self.shrubCenterX andY:self.shrubCenterY];
        [self scrambleX:self.rakeCenterX andY:self.rakeCenterY];
        [self scrambleX:self.rockCenterX andY:self.rockCenterY];
    }
}

- (void)scrambleX:(NSLayoutConstraint *)x andY:(NSLayoutConstraint *)y {
    
    x.constant = [self generateRandomX];
    y.constant = [self generateRandomY];
}

- (NSInteger)generateRandomX {
    
    NSInteger viewWidth = (NSInteger)self.view.frame.size.width;
    NSInteger xValue = arc4random() % viewWidth;
    
    if (xValue > ((NSInteger)self.view.frame.size.width - 100)) {
        
        xValue = xValue - 100;
    }
    
    return xValue;
}

- (NSInteger)generateRandomY {
    
    NSInteger viewHeight = (NSInteger)self.view.frame.size.height;
    NSInteger yValue = arc4random() % viewHeight;
    
    if (yValue > ((NSInteger)self.view.frame.size.height - 100)) {
        
        yValue = yValue - 100;
    }
    
    return yValue;
}

- (void)doubleTapped:(UITapGestureRecognizer *)gesture {
    
    if (self.highlightedImage) {
        
        self.highlightedImage.backgroundColor = [UIColor clearColor];
    }
    
    if(gesture.view==self.rake) {
        
        self.rake.backgroundColor = [UIColor lightGrayColor];
        self.highlightedImage = self.rake;
        self.highlightedImageX = self.rakeCenterX;
        self.highlightedImageY = self.rakeCenterY;
        
    } else if (gesture.view==self.rock) {
        
        self.rock.backgroundColor = [UIColor lightGrayColor];
        self.highlightedImage = self.rock;
        self.highlightedImageX = self.rockCenterX;
        self.highlightedImageY = self.rockCenterY;
        
    } else if(gesture.view==self.swordinrock) {
        
        self.swordinrock.backgroundColor = [UIColor lightGrayColor];
        self.highlightedImage = self.swordinrock;
        self.highlightedImageX = self.swordinrockCenterX;
        self.highlightedImageY = self.swordinrockCenterY;
        
    } else if(gesture.view==self.shrub) {
        
        self.shrub.backgroundColor = [UIColor lightGrayColor];
        self.highlightedImage = self.shrub;
        self.highlightedImageX = self.shrubCenterX;
        self.highlightedImageY = self.shrubCenterY;
    }
    
    self.tapToMove = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(moveHighlightedImage:)];
    
    [self.view addGestureRecognizer:self.tapToMove];
    
}

- (void)moveHighlightedImage:(UITapGestureRecognizer *)gesture {
    
    CGPoint fingerLocation = [gesture locationInView:self.view];
    
    if (self.highlightedImage != nil) {
        
        self.highlightedImageX.constant = fingerLocation.x - 50;
        self.highlightedImageY.constant = fingerLocation.y - 50;
        self.highlightedImage.backgroundColor = [UIColor clearColor];
        
        [self.view layoutIfNeeded];
        
        [self checkForWinner];
        
    } else {
        
        UIAlertView *noSelectionAlert =
        [[UIAlertView alloc]initWithTitle:@"Nothing selected!"
                                  message:@"Double tap on an object to select it. Then tap again to where you would like t move it."
                                 delegate:self
                        cancelButtonTitle:@"OK"
                        otherButtonTitles:nil];
        [noSelectionAlert show];
    }
    
    [self.view removeGestureRecognizer:self.tapToMove];
}

@end