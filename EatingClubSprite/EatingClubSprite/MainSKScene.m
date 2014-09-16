//
//  MainSKScene.m
//  EatingClub
//
//  Created by IndyZa on 9/15/2557 BE.
//  Copyright (c) 2557 IndyZa. All rights reserved.
//

#import "MainSKScene.h"
#include <stdlib.h>


@interface MainSKScene()
@property (nonatomic, retain) SKSpriteNode *shakerImg;
@property (nonatomic, retain) SKSpriteNode *randomBtn;
@property (nonatomic, retain) SKSpriteNode *border;
@property (nonatomic, retain) SKSpriteNode *logo;
@property (nonatomic, retain) SKSpriteNode *filter;
@property (nonatomic, retain) SKEmitterNode *aura;

@end


NSMutableArray *pics;
NSMutableArray *shops;


@implementation MainSKScene{
    SKSpriteNode *test;
}


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        //        self.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        //        [SKColor colorWithRed:1.0 green:0.5 blue:0.188f alpha:1.0];
    
    }
    [self awakeFromNib];
    return self;
}

-(void) didMoveToView:(SKView *)view{
    int count = 39;
    pics = [[NSMutableArray alloc] init];
    for(int i = 1;i<=count;i++){
        NSString *picName = [NSString stringWithFormat:@"store%d", i];
        [pics addObject:picName];
    }
    
    //Added Filter
    self.filter = [[SKSpriteNode alloc] initWithColor:[SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0] size:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
    self.filter.position =CGPointMake(CGRectGetMidX(self.frame),
                                      CGRectGetMidY(self.frame));
    
    //Added Logo
    self.logo = [[SKSpriteNode alloc] initWithImageNamed:@"logo.png"];
    self.logo.size = CGSizeMake(self.logo.size.width/2, self.logo.size.height/2);
    self.logo.position =CGPointMake(CGRectGetMidX(self.frame)+15,
                                    CGRectGetMaxY(self.frame)-100);
    
    //Added Label
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    myLabel.text = @"Shake!";
    myLabel.fontColor = [SKColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    myLabel.fontSize = 30;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame)+120);
    
    //        SKView *insideView = [SKView ]
    
    self.shakerImg = [[SKSpriteNode alloc] initWithImageNamed:@"shake.png"];
//    self.shakerImg.name=@"ShakeImage";
    CGFloat width = self.shakerImg.size.width/5;
    CGFloat height = self.shakerImg.size.height/5;
    NSLog(@"width: %f height: %f",width,height);
    self.shakerImg.size = CGSizeMake(width, height);

    SKSpriteNode *border_white = [[SKSpriteNode alloc] initWithColor:[SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0] size:CGSizeMake(width, height)];

    
    
    self.border = [[SKSpriteNode alloc] initWithColor:[SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0] size:CGSizeMake(width+2, height+2)];
    self.border.position = CGPointMake(CGRectGetMidX(self.frame),
                                  CGRectGetMidY(self.frame));
    self.border.zPosition = 10;
    
    CGFloat heightRdm = CGRectGetMaxY(self.frame)/8;
    
    self.randomBtn = [[SKSpriteNode alloc] initWithColor:[SKColor colorWithRed:0.97 green:0.576 blue:0.114 alpha:1.0] size:CGSizeMake(CGRectGetWidth(self.frame),heightRdm)];
    //    self.randomBtn.color = [SKColor colorWithRed:0.97 green:0.576 blue:0.114 alpha:1.0];
    //    self.randomBtn.size = CGSizeMake(CGRectGetWidth(self.frame),
    //                                     CGRectGetHeight(self.frame));
    self.randomBtn.name =@"RandomButton";
    self.randomBtn.position = CGPointMake(CGRectGetMidX(self.frame),
                                          heightRdm/2);
    
    SKLabelNode *rndText = [[SKLabelNode alloc] initWithFontNamed:@"Helvetica"];
    rndText.text = @"Random";
    rndText.fontSize = 30;
    rndText.name =@"RandomText";
    NSLog(@"x: %f y: %f",rndText.position.x,rndText.position.y);
    rndText.position =CGPointMake(0,-10);
    
    
    
    
    
    [self addChild:self.filter];
    [border_white addChild:self.shakerImg];
    [self.border addChild:border_white];
    [self addChild:self.border];
    //    [self addChild:myLabel];
    [self addChild:self.logo];
    [self.randomBtn addChild:rndText];
    [self addChild:self.randomBtn];
    NSLog(@"x: %f y: %f",rndText.position.x,rndText.position.y);
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    //if fire button touched, bring the rain
    if ([node.name isEqualToString:@"RandomButton"] || [node.name isEqualToString:@"RandomText"]) {
        //do whatever...
        //        [self changePicture:self.shakerImg];
        [self setUpActions];
        
    }
    
//    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
//        //add effect at touch location
//        [self addChild:[self newExplosion:location.x : location.y]];
//    }
    
}


- (void)changePicture:(SKSpriteNode*)imgNode{
//    [self.shakerImg runAction:[SKAction animateWithTextures:pics timePerFrame:0.06 resize:YES restore:YES]];
    
//    int r = arc4random_uniform(pics.count);
//    NSLog(@"%i",r);
//    NSLog(@"%@",pics[r]);
//    self.shakerImg.texture = [SKTexture textureWithImageNamed:pics[r]];
    //    self.shakerImg = [[SKSpriteNode alloc] initWithImageNamed:pics[r]];
    
}



-(void) setUpActions {
    SKTextureAtlas * atlas = [SKTextureAtlas atlasNamed:@"ShakeImage"];
    self.border.color = [SKColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    self.filter.color = [SKColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
    pics = [self shuffleArray:pics];
    NSMutableArray *runTexture = [[NSMutableArray alloc] init];
    for(int i = 0; i<pics.count;i++){
        [runTexture addObject:[atlas textureNamed:pics[i]]];
    }
    NSLog(@"%@",pics[pics.count-1]);
    
    
//    NSArray * runTexture = @[runTexture1, runTexture2, runTexture3];
    
    SKAction *runAnimation = [SKAction animateWithTextures:runTexture timePerFrame:0.06 resize:NO restore:NO];
    
    int r = arc4random_uniform(pics.count);
    //    NSLog(@"%i",r);
    NSMutableArray *finalTexture = [[NSMutableArray alloc] init];
    int count = 3;
    for(int i = 0;i<count;i++){
        r = arc4random_uniform(pics.count);
    [finalTexture addObject:[atlas textureNamed:pics[r]]];
    }

    SKAction *finalAnimation = [SKAction animateWithTextures:finalTexture timePerFrame:0.3 resize:NO restore:NO];
    
    self.aura.numParticlesToEmit = 1;
    [self addChild:[self newExplosion:CGRectGetMidX(self.frame) : CGRectGetMidY(self.frame)]];
    runAnimation.timingMode = SKActionTimingEaseInEaseOut;
    [self.shakerImg runAction:runAnimation completion:^{
        [self.shakerImg runAction:finalAnimation completion:^{
            self.aura = [self newGlowSpot:CGRectGetMidX(self.frame) : CGRectGetMidY(self.frame)];
            [self addChild:self.aura];
            
            NSLog(@"Done Final Animation");
        }];
        NSLog(@"Done Random Animation");
        }
     ];
//    [self.shakerImg runAction:[SKAction repeatActionForever:runAnimation]];
}



//particle explosion - uses MyParticle.sks
- (SKEmitterNode *) newExplosion: (float)posX : (float) posy
{
    SKEmitterNode *emitter =  [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"MyParticle" ofType:@"sks"]];
    
    emitter.position = CGPointMake(posX,posy);
    emitter.name = @"explosion";
    emitter.targetNode = self.scene;
    emitter.numParticlesToEmit = 700;
    emitter.zPosition=0.2;
    return emitter;
}


- (SKEmitterNode *) newGlowSpot: (float)posX : (float) posy
{
    SKEmitterNode *emitter =  [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"MyParticleFF" ofType:@"sks"]];
    emitter.numParticlesToEmit = 0;
    emitter.position = CGPointMake(posX,posy);
    emitter.name = @"glow";
    emitter.targetNode = self.scene;
//    emitter.numParticlesToEmit = 700;
    emitter.zPosition=0.2;
    return emitter;
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

-(NSMutableArray*) shuffleArray:(NSMutableArray*)myArray{
    /* myArray is a NSMutableArray with some objects */
    NSUInteger count = [myArray count];
    for (NSUInteger i = 0; i < count; ++i) {
        int nElements = count - i;
        int n = (arc4random() % nElements) + i;
        [myArray exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    return myArray;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if ( event.subtype == UIEventSubtypeMotionShake )
    {
        // Put in code here to handle shake
        NSLog(@"MainSK Shake");
    }
    
    if ( [super respondsToSelector:@selector(motionEnded:withEvent:)] )
        [super motionEnded:motion withEvent:event];
}

- (BOOL)canBecomeFirstResponder
{ return YES; }

- (void)fromController {
    NSLog(@"Drom Controller");
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"fromController" object:self];
}


- (void)awakeFromNib {
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(setUpActions)
     name:@"ReportScore"
     object:nil];
}

- (void) dealloc
{
    // If you don't remove yourself as an observer, the Notification Center
    // will continue to try and send notification objects to the deallocated
    // object.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

