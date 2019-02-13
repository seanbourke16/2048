//
//  GameViewController.m
//  2048
//
//  Created by Sean Bourke on 2/7/19.
//  Copyright © 2019 Sean Bourke. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"

@implementation GameViewController
@synthesize ship;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Load the SKScene from 'GameScene.sks'
    GameScene *scene = (GameScene *)[SKScene nodeWithFileNamed:@"GameScene"];
    
    // Set the scale mode to scale to fit the window
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    SKView *skView = (SKView *)self.view;
    
    // Present the scene
    [skView presentScene:scene];
    
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        ship = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
        [ship setImage:[UIImage imageNamed:@"spaceship.png"]];
        //[ship setBackgroundColor:[UIColor redColor]];
        //[self addSubview:ship];
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [self performSelectorOnMainThread:@selector(tick:) withObject:self.timer waitUntilDone:NO];
        }];
    }
    
    return self;
}

-(IBAction)rotate:(id)sender
{
    self.rotation += [sender tag];
    self.angle = 2*M_PI*(self.rotation/360.0);
    CGAffineTransform t = CGAffineTransformRotate(CGAffineTransformIdentity, self.angle);
    [ship setTransform:t];
}

-(IBAction)thrust:(id)sender
{
    self.dx += 5 * cos(self.angle);
    self.dy += 5 * sin(self.angle);
    NSLog(@"Thrust %f %f", self.dx, self.dy);
}

-(void)tick:(id)sender
{
    CGPoint p = [ship center];
    p.x += self.dx;
    p.y += self.dy;
    
    //CGRect r = [self frame];
    //if (p.x < 0) p.x += r.size.width;
    //if (p.x > r.size.width) p.x -= r.size.width;
    //if (p.y < 0) p.y += r.size.height;
    //if (p.y > r.size.height) p.y -= r.size.height;
    
    [ship setCenter:p];
}

@end
