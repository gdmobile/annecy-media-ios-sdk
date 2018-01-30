//
//  ViewController.m
//  DebugProjectObjC
//
//  Created by Tobias Schultka on 30.01.18.
//  Copyright © 2018 GD Mobile GmbH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

AnnecyMediaSDK* annecyMediaSDK;
NSString* TOKEN = @"6ce0bbf0-2dc8-4d7c-a497-e93105188ba1";
NSString* USER_ID = @"foo";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    annecyMediaSDK = AnnecyMediaSDK.instance;
    annecyMediaSDK.delegate = self;
    [annecyMediaSDK setOptionsWithToken:TOKEN userId:USER_ID];
    [annecyMediaSDK requestOfferwall];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)annecyOnOfferwallReadyWithViewController:(AMSDKViewController * _Nonnull)viewController {
    [self presentViewController:viewController animated:YES completion:nil];
}

@end
