//
//  Tile.h
//  2048
//
//  Created by Sean Bourke on 2/13/19.
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
    
}

@property(nonatomic,readwrite) int v;
@property(nonatomic, strong) UILabel *shape;
@property (nonatomic, strong) UILabel * label;

@property int dx;
@property int dy;

-(void)pos;
-(void)move:(int)dir;
-(void)update;
@end


#endif /* Tile_h */
