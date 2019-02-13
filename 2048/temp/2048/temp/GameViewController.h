//
//  GameViewController.h
//  2048
//
//  Created by Sean Bourke on 2/7/19.
//  Copyright © 2019 Sean Bourke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <GameplayKit/GameplayKit.h>

@interface GameViewController : UIViewController

@property (nonatomic, strong) UIImageView *ship;
@property float dx, dy, rotation, angle;
@property (nonatomic, strong) NSTimer *timer;
@end


