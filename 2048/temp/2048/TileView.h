//
//  TileView.h
//  hello world
//
//  Created by Sean Bourke on 2/12/19.
//  Copyright © 2019 Sean Bourke. All rights reserved.
//

#ifndef TileView_h
#define TileView_h
#import <UIKIT/UIKIT.h>

@interface TileView: UIView

@property (nonatomic,strong) UIImageView *tileImage;

-(void)showTile;

@end



#endif /* TileView_h */
