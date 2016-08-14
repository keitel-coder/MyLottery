//
//  HelpViewController.m
//  MyLottery
//
//  Created by 李贵 on 16/8/14.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "HtmlViewController.h"
#import "HelpModel.h"

@interface HtmlViewController() <UIWebViewDelegate>

@end

@implementation HtmlViewController

- (void)loadView
{
    self.view = [[UIWebView alloc] init];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.title=self.model.title;
    
    UIWebView *webView = (UIWebView *)self.view;
    webView.delegate = self;

    //url
    NSURL *url = [[NSBundle mainBundle]URLForResource:self.model.html withExtension:nil];
    //创建请求
    NSURLRequest * request=[[NSURLRequest alloc]initWithURL:url];
    
    [webView loadRequest:request];
    // 设置左上角的关闭按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
}

/**
 *  关闭当前页
 */
-(void)close{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    if(self.model.ID!=nil){
//        NSString *js = [NSString stringWithFormat:@"window.location.href = '#%@';", self.model.ID];
        [webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"window.location.href='#%@'",self.model.ID]];
    }
}
@end
