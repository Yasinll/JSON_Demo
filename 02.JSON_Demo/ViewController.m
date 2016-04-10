//
//  ViewController.m
//  02.JSON_Demo
//
//  Created by 浅爱 on 16/4/10.
//  Copyright © 2016年 my. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self getJSON];

}

- (void)getJSON {

    NSURL *url = [NSURL URLWithString:@"http://192.168.42.21/demo.json"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        if (connectionError) {
        
            NSLog(@"connect error");
            
            return ;
        
        }
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        
        if (httpResponse.statusCode == 200 || httpResponse.statusCode == 304) {
        
            // 反序列化
            /**
             *
             *  @param NSData 二进制数据
             *  @param options 选项
             *  @param options 错误
             *
             */
            id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
            NSLog(@"%@", result);
            
        } else {
        
            NSLog(@"error");
        
        }
    
    }];

}

@end






