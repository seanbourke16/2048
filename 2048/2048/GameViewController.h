//
//  GameViewController.h
//  2048
//
//  Created by Sean Bourke on 2/13/19.
//  Copyright © 2019 Sean Bourke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <GameplayKit/GameplayKit.h>
#import "Tile.h"

@interface GameViewController : UIViewController{
    Tile *tile[4][4];
}
@property NSMutableArray *tiles;
//-(IBAction)left:(id)sender;
//-(IBAction)right:(id)sender;
//-(IBAction)up:(id)sender;
//-(IBAction)down:(id)sender;
@end
