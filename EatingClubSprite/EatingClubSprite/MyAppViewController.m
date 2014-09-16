//
//  MyAppViewController.m
//  EatingClub
//
//  Created by IndyZa on 9/14/2557 BE.
//  Copyright (c) 2557 IndyZa. All rights reserved.
//

#import "MyAppViewController.h"
#import "MainSKScene.h"
@interface MyAppViewController ()

@property (nonatomic, retain) MainSKScene *scene;

@end

@interface  MainSKScene()


@end

@implementation MyAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Configure the SKView
    SKView * skView = _skView;
//    skView.showsFPS = YES;
//    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    self.scene = [MainSKScene sceneWithSize:skView.bounds.size];
    self.scene.scaleMode = SKSceneScaleModeAspectFill;
   
    // Present the scene.
    [skView presentScene:self.scene];
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        [self gameOver];

        NSLog(@"Controller Shake");
    }
}

- (void)gameOver {
        [[NSNotificationCenter defaultCenter]
            postNotificationName:@"ReportScore" object:self];
}
@end

