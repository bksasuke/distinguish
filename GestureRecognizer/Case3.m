//
//  Case3.m
//  distinguishPinchAndRotate
//
//  Created by TuanTa on 10/27/15.
//  Copyright © 2015 Cuong Trinh. All rights reserved.
//

#import "Case3.h"

@interface Case3 () <UIGestureRecognizerDelegate>

@end

@implementation Case3

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
    label.numberOfLines = 3;
    label.text = @"Gesture nào được nhận dạng trước sẽ được\nưu tiên; Gesture sau không được nhận dạng\n-->giống Case 1";
    
    CGSize labelSize = [label.text sizeWithAttributes:@{NSFontAttributeName:label.font}];
    
    label.frame = CGRectMake(8, 80, self.view.bounds.size.width - 16, labelSize.height);
    [self.view addSubview:label];
    
    label1 = [UILabel new];
    label1.numberOfLines = 1;
    label1.frame = CGRectMake(8, 140, self.view.bounds.size.width - 16, labelSize.height);
    [self.view addSubview:label1];
    
    label2 = [UILabel new];
    label2.numberOfLines = 1;
    label2.frame = CGRectMake(8, 160, self.view.bounds.size.width - 16, labelSize.height);
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
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return false;
}

@end
