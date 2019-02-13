//
//  Tile.h
//  2048
//
//  Created by Sean Bourke on 2/12/19.
//  Copyright © 2019 Sean Bourke. All rights reserved.
//

#ifndef Tile_h
#define Tile_h

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface Tile : NSObject {
    
    int height;
    int length;
    int xcor;
    int ycor;
    
}

@property(nonatomic,readwrite) int v;
@property(nonatomic, strong) UIImageView *shape;
-(void)pos:(id)sender;
@end

#endif /* Tile_h */
