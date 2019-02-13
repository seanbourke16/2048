//
//  Tile.h
//  hello world
//
//  Created by Sean Bourke on 2/12/19.
//  Copyright © 2019 Sean Bourke. All rights reserved.
//

#ifndef Tile_h
#define Tile_h

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import <GameplayKit/GameplayKit.h>
#import <UIKIT/UIKIT.h>

@interface Tile : UIView {
    
    int height;
    int length;
    int dx;
    int dy;
    
}

@property(nonatomic,readwrite) int v;
@property(nonatomic, strong) UILabel *shape;
@property (nonatomic, strong) UILabel * label;
-(void)pos;
-(void)move:(int)dir;
@end


#endif /* Tile_h */
