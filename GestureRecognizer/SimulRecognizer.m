//
//  SimulRecognizer.m
//  GestureRecognizer
//
//  Created by Cuong Trinh on 8/25/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//

#import "SimulRecognizer.h"
#import <QuartzCore/QuartzCore.h>
@interface SimulRecognizer () <UIGestureRecognizerDelegate>
@end

@implementation SimulRecognizer
{
    UIImageView* ruby;
    UILabel *label,*label1,*label2;
    NSTimer* timer;
    NSDate* whenrubyBecomeBlue;
    
    UIRotationGestureRecognizer *rotate;
    UIPinchGestureRecognizer *pinch;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //Explain about this app
    label = [UILabel new];
    label.numberOfLines = 1;
    label.text = @"Kiểm tra gesture :";
    
    CGSize labelSize = [label.text sizeWithAttributes:@{NSFontAttributeName:label.font}];
    
    label.frame = CGRectMake(8, 80, self.view.bounds.size.width - 16, labelSize.height);
    [self.view addSubview:label];
    
    label1 = [UILabel new];
    label1.numberOfLines = 1;
    label1.frame = CGRectMake(8, 100, self.view.bounds.size.width - 16, labelSize.height);
    [self.view addSubview:label1];
    
    label2 = [UILabel new];
    label2.numberOfLines = 1;
    label2.frame = CGRectMake(8, 120, self.view.bounds.size.width - 16, labelSize.height);
    [self.view addSubview:label2];

    ruby = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ruby.png"]];
    ruby.frame = CGRectMake(100, 200, 200, 220);
    ruby.multipleTouchEnabled = true;
    ruby.userInteractionEnabled = true;
    [self.view addSubview:ruby];
 
    pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchruby:)];
    pinch.delegate = self;
    [ruby addGestureRecognizer:pinch];
    rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateruby:)];
    rotate.delegate = self;
    [ruby addGestureRecognizer:rotate];
    
}


- (void) rotateruby: (UIRotationGestureRecognizer*) rotateRec {
    if (rotateRec.state == UIGestureRecognizerStateBegan || rotateRec.state == UIGestureRecognizerStateChanged) {
        printf("Rotate");
        label1.text = @"Rotating";
        rotateRec.view.transform = CGAffineTransformRotate(rotateRec.view.transform, rotateRec.rotation);
        rotateRec.rotation =0.0;
        
    }
}

- (void) pinchruby: (UIPinchGestureRecognizer*) pinchRec {
    if (pinchRec.state == UIGestureRecognizerStateBegan || pinchRec.state == UIGestureRecognizerStateChanged) {
        printf("Pinch");
        label2.text = @"Piching";
        pinchRec.view.transform = CGAffineTransformScale(pinchRec.view.transform, pinchRec.scale,pinchRec.scale);
        pinchRec.scale =1.0;
       
        
    }
}


@end
