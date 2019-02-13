//
//  ViewController.h
//  hello world
//
//  Created by Sean Bourke on 1/28/19.
//  Copyright © 2019 Sean Bourke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tile.h"


@interface ViewController : UIViewController{
    Tile *tile[16];
}
@property NSMutableArray *tiles;
//-(IBAction)left:(id)sender;
//-(IBAction)right:(id)sender;
//-(IBAction)up:(id)sender;
//-(IBAction)down:(id)sender;
@end
