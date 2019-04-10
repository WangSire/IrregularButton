//
//  ViewController.m
//  IrregularButton
//
//  Created by Siri on 2019/4/10.
//  Copyright © 2019年 Siri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btnClici:(UIButton *)sender {
    NSLog(@"点击的功能是: %ld",sender.tag - 1000);
}


@end
