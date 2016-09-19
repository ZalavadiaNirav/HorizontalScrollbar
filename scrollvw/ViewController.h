//
//  ViewController.h
//  scrollvw
//
//  Created by C N Soft Net on 19/09/16.
//  Copyright © 2016 C N Soft Net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSArray *btnArr;
    UIButton *tempBtn,*selectedBtn;
    float pos;
    NSString *btnName1;
    UIView *showSelectionVw;

}

@property (retain, nonatomic) UIScrollView *scrollView;
@property (nonatomic,retain) UIButton *tempBtn;
@property (weak, nonatomic) IBOutlet UITableView *tbl;
@property (nonatomic,retain)NSString * btnName1;

-(void)createHorizontalView;
-(void)btnAction:(id)sender;

- (void)setBackgroundGradient:(UIView *)mainView color1Red:(float)colorR1 color1Green:(float)colorG1 color1Blue:(float)colorB1 color2Red:(float)colorR2 color2Green:(float)colorG2 color2Blue:(float)colorB2 alpha:(float)alpha;

- (void)setBackgroundGradient2:(UIView *)mainView color1Red:(float)colorR1 color1Green:(float)colorG1 color1Blue:(float)colorB1 color2Red:(float)colorR2 color2Green:(float)colorG2 color2Blue:(float)colorB2 alpha:(float)alpha;


@end

