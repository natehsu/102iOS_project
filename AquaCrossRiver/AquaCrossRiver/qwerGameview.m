//
//  qwerGameview.m
//  AquaCrossRiver
//
//  Created by FrankieJhou on 14/1/14.
//  Copyright (c) 2014年 FrankieJhou. All rights reserved.
//

#import "qwerGameview.h"
#import "qwerMyScene.h"
@interface qwerGameview()
@property (nonatomic,strong)SKSpriteNode *normalBG;
@property (nonatomic,strong)SKLabelNode *UpBtn;
@property (nonatomic,strong)SKLabelNode *DownBtn;
@property (nonatomic,strong)SKLabelNode *LeftBtn;
@property (nonatomic,strong)SKLabelNode *RightBtn;
@property (nonatomic,strong)SKSpriteNode *ThermalBG;
@property (nonatomic,strong)SKSpriteNode *NightVisionBG;
@property (nonatomic,strong)SKLabelNode *ThermalBtn;
@property (nonatomic,strong)SKLabelNode *NightVisionBtn;
@property (nonatomic,strong)SKSpriteNode *frog;
@property (nonatomic) int life;//count to lose
@property (nonatomic) int winleft;//count to win
@end
@implementation qwerGameview
-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        //background init
        self.backgroundColor=[SKColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        
        _normalBG = [SKSpriteNode spriteNodeWithImageNamed:@"BG"];
        [_normalBG setName:@"normalBG"];
        _normalBG.position = CGPointMake(CGRectGetMidX(self.frame),
                                           CGRectGetMidY(self.frame));
        [self addChild:_normalBG];
        _normalBG.hidden = FALSE;
        
        _ThermalBG = [SKSpriteNode spriteNodeWithImageNamed:@"TLBG"];
        [_ThermalBG setName:@"ThermalBG"];
        _ThermalBG.position = CGPointMake(CGRectGetMidX(self.frame),
                                         CGRectGetMidY(self.frame));
        [self addChild:_ThermalBG];
        _ThermalBG.hidden = TRUE;
        
        _NightVisionBG = [SKSpriteNode spriteNodeWithImageNamed:@"DRBG"];
        [_NightVisionBG setName:@"ThermalBG"];
        _NightVisionBG.position = CGPointMake(CGRectGetMidX(self.frame),
                                          CGRectGetMidY(self.frame));
        [self addChild:_NightVisionBG];
        _NightVisionBG.hidden =  TRUE;
        //background init
        //control button
        _UpBtn = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
        _UpBtn.text = @" UP ";
        _UpBtn.fontSize = 45;
        _UpBtn.position = CGPointMake(CGRectGetWidth(self.frame)/3 ,
                                         (CGRectGetHeight(self.frame)-CGRectGetHeight(_normalBG.frame))/2 - CGRectGetHeight(_UpBtn.frame)-7 );
        [self addChild:_UpBtn];
        
        _DownBtn = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
        _DownBtn.text = @"DOWN";
        _DownBtn.fontSize = 45;
        _DownBtn.position = CGPointMake(_UpBtn.position.x,
                                      _UpBtn.position.y-2*(_DownBtn.frame.size.height) );
        [self addChild:_DownBtn];
        
        _LeftBtn = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
        _LeftBtn.text = @"LEFT";
        _LeftBtn.fontSize = 45;
        _LeftBtn.position = CGPointMake(_UpBtn.position.x - 1.2*CGRectGetWidth(_DownBtn.frame),(_UpBtn.position.y+_DownBtn.position.y)/2);
        [self addChild:_LeftBtn];
        
        _RightBtn = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
        _RightBtn.text = @"RIGHT";
        _RightBtn.fontSize = 45;
        _RightBtn.position = CGPointMake(_UpBtn.position.x + 1.3*CGRectGetWidth(_DownBtn.frame),_LeftBtn.position.y);
        [self addChild:_RightBtn];
        
        _ThermalBtn = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
        _ThermalBtn.text = @"Thermal OFF";
        [_ThermalBtn setFontColor: [UIColor lightGrayColor]];
        _ThermalBtn.fontSize = 40;
        _ThermalBtn.position = CGPointMake(CGRectGetMaxX(self.frame)-(_ThermalBtn.frame.size.width/2),_UpBtn.position.y);
        [self addChild:_ThermalBtn];
        _ThermalBtn.hidden =  TRUE;
        _NightVisionBtn = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
        _NightVisionBtn.text = @"Night-V OFF";
        [_NightVisionBtn setFontColor: [UIColor greenColor]];
        _NightVisionBtn.fontSize = 40;
        _NightVisionBtn.position = CGPointMake(CGRectGetMaxX(self.frame)-(_NightVisionBtn.frame.size.width/2),_DownBtn.position.y);
        [self addChild:_NightVisionBtn];
        _NightVisionBtn.hidden =  TRUE;
        //control button
        //obj init
        _frog = [SKSpriteNode spriteNodeWithImageNamed:@"frog01"];
        [_frog setName:@"activeFrog"];
        _frog.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMinY(_normalBG.frame)+_frog.frame.size.height/2
                                         );
        [self addChild:_frog];
        //obj init
    }
    return self;
}

@end
