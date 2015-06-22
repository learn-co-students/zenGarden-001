//
//  UIView+ViewDistance.m
//  zenGarden
//
//  Created by James Campagno on 6/11/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "UIView+ViewDistance.h"

@implementation UIView (ViewDistance)

-(double)distanceToView:(UIView *)view {
    
    return sqrt(pow(view.center.x - self.center.x, 2) + pow(view.center.y - self.center.y, 2));
}

@end