//
//  GameScene.h
//  2048
//
//  Created by Sean Bourke on 2/7/19.
//  Copyright © 2019 Sean Bourke. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Tile.h"




@interface GameScene : SKScene{
    Tile *tile[4][4];
}
@property NSMutableArray *tiles;

@end


