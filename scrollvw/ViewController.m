//
//  ViewController.m
//  scrollvw
//
//  Created by C N Soft Net on 19/09/16.
//  Copyright © 2016 C N Soft Net. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+UImageColor.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize scrollView,tempBtn,tbl,btnName1;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    btnArr=@[@"btn1",@"btn2",@"btn3",@"btn4",@"btn5jdslkgj",@"btn6",@"btn7",@"scroll for big"];
    
    scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, 420, 50)];
    scrollView.delegate=self;
    tbl.delegate=self;
    tbl.dataSource=self;
    [self createHorizontalView];
    [self setBackgroundGradient:self.view color1Red:100.0 color1Green:200.0 color1Blue:106.0 color2Red:113.0 color2Green:116.0 color2Blue:119.0 alpha:1.0];
}


-(void)btnAction:(id)sender
{
    selectedBtn=(UIButton *)sender;
    btnName1=selectedBtn.titleLabel.text;
    CGRect btnFrame=selectedBtn.frame;
    showSelectionVw=[[UIView alloc] init];
    showSelectionVw.frame=CGRectMake(selectedBtn.frame.origin.x-15, scrollView.frame.origin.y, selectedBtn.frame.size.width+30, 5);
    [self setBackgroundGradient2:self.view color1Red:156.0 color1Green:34.0 color1Blue:93.0 color2Red:232.0 color2Green:64.0 color2Blue:170.0 alpha:1.0];
    
    [tbl reloadData];
}

-(void)createHorizontalView
{
    
    if([btnArr count]>0)
    {
        for (int i=0; i<[btnArr count]; i++)
        {
            tempBtn=[[UIButton alloc] init];
            tempBtn=[UIButton buttonWithType:UIButtonTypeCustom];
            tempBtn.titleLabel.textColor=[UIColor blackColor];
            NSString *btnName=[NSString stringWithFormat:@"%@",[btnArr objectAtIndex:i]];
            [tempBtn setTitle:btnName forState:UIControlStateNormal];
            [tempBtn setTag:i];
            [tempBtn sizeToFit];

            pos= (scrollView.contentSize.width);
            
            CGRect modifyFrame=CGRectMake((pos+30),scrollView.frame.origin.y-30, tempBtn.frame.size.width, 30);
            NSLog(@"Position  %lf btn width %f ",pos,tempBtn.frame.size.width);
            
            [tempBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            
            tempBtn.frame=modifyFrame;
            tempBtn.titleLabel.textColor=[UIColor blackColor];

            [scrollView addSubview:tempBtn];

            [scrollView setContentSize:CGSizeMake((pos+tempBtn.frame.size.width+30), scrollView.frame.size.height)];
            
        }
    }
    [scrollView setContentSize:CGSizeMake(pos+tempBtn.frame.size.width+60, scrollView.frame.size.height)];
    NSLog(@"scrollview %lf",scrollView.contentSize.width);
    scrollView.bounces=true;
    [scrollView setShowsHorizontalScrollIndicator:YES];
    [self.view addSubview:scrollView];
    [self.view bringSubviewToFront:self.view];
    
}

#pragma mark - Background Color

- (void)setBackgroundGradient:(UIView *)mainView color1Red:(float)colorR1 color1Green:(float)colorG1 color1Blue:(float)colorB1 color2Red:(float)colorR2 color2Green:(float)colorG2 color2Blue:(float)colorB2 alpha:(float)alpha
{
    tbl.backgroundColor=[UIColor clearColor];
    
    [self.view setBackgroundColor:[UIColor clearColor]];
    CAGradientLayer *grad = [CAGradientLayer layer];
    grad.frame = self.view.bounds;
    
    grad.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:colorR1/155.0 green:colorG1/245.0 blue:colorB1/195.0 alpha:alpha] CGColor], (id)[[UIColor colorWithRed:colorR2/25.0 green:colorG2/225.0 blue:colorB2/25.0 alpha:alpha] CGColor], nil];
    
    [self.view.layer insertSublayer:grad atIndex:0];
}

#pragma mark - Selected View's Color


- (void)setBackgroundGradient2:(UIView *)mainView color1Red:(float)colorR1 color1Green:(float)colorG1 color1Blue:(float)colorB1 color2Red:(float)colorR2 color2Green:(float)colorG2 color2Blue:(float)colorB2 alpha:(float)alpha
{
    for (UIView *vw in [scrollView subviews])
    {
        if([vw viewWithTag:99])
            [vw removeFromSuperview];
    }
 
    [showSelectionVw setBackgroundColor:[UIColor clearColor]];
    CAGradientLayer *grad = [CAGradientLayer layer];
    grad.frame = showSelectionVw.bounds;
    
    grad.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:colorR1/255.0 green:colorG1/255.0 blue:colorB1/255.0 alpha:alpha] CGColor], (id)[[UIColor colorWithRed:colorR2/255.0 green:colorG2/255.0 blue:colorB2/255.0 alpha:alpha] CGColor], nil];
    
    [showSelectionVw.layer insertSublayer:grad atIndex:0];
    showSelectionVw.tag=99;
    [scrollView addSubview:showSelectionVw];
    [scrollView bringSubviewToFront:showSelectionVw];


}


#pragma mark - TableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if (!btnName1)
        cell.textLabel.text=[NSString stringWithFormat:@"%@",[btnArr objectAtIndex:0]];
    else
        cell.textLabel.text=[NSString stringWithFormat:@"%@",btnName1];

    cell.backgroundColor=[UIColor clearColor];
    cell.textLabel.textColor=[UIColor orangeColor];
    cell.textLabel.font=[UIFont fontWithName:@"Arial" size:20];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
