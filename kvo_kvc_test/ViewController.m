//
//  ViewController.m
//  kvo_kvc_test
//
//  Created by 鹏 刘 on 16/9/19.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    Person *p;
}

@property (nonatomic,strong) UILabel *ageLabel;
@property (nonatomic,strong) UIButton *changeButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 150, 75)];
    self.ageLabel.backgroundColor = [UIColor blueColor];
    
    
    p = [[Person alloc] init];
    [p setValue:@"Liu Peng" forKey:@"name"];
    [p setValue:@"27" forKey:@"age"];

    [p addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:NULL];

    self.ageLabel.text = [p valueForKey:@"age"];
    
    
    self.changeButton = [[UIButton alloc] initWithFrame:CGRectMake(185, 200, 115, 60)];
    [self.changeButton setTitle:@"Change" forState:UIControlStateNormal];
    self.changeButton.backgroundColor = [UIColor blackColor];
    [self.changeButton addTarget:self action:@selector(changeAge:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:self.ageLabel];
    [self.view addSubview:self.changeButton];
}


- (IBAction)changeAge:(id)sender
{
    [p setValue:@"30" forKey:@"age"];
}



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"age"]) {
        self.ageLabel.text = [p valueForKey:@"age"];
    
    }
}

- (void)dealloc
{
    [p removeObserver:self forKeyPath:@"age"];
}




@end
