//
//  ViewController.m
//  201
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "ProductCell.h"
#import "Product.h"
#import "CartDelegate.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, CartDelegate>
{
    NSArray *data;
    NSMutableArray *cart;
}

@property (weak, nonatomic) IBOutlet UITableView *table;
@end

@implementation ViewController

// 델리게이트메소드
- (void)addItem:(id)sender
{
    //제품찾기 - 셀객체로 indexPath얻기
    UITableViewCell *cell = (UITableViewCell *)sender;
    NSIndexPath *indexPath = [self.table indexPathForCell:cell];
    Product *item = data[indexPath.row];
    
    //카트에 상품추가
    [cart addObject:item];
    
    //테이블카트 섹션리로드
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [data count];
    }
    else
    {
        return [cart count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return (section == 0) ? @"상품목록" : @"카트";
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL"];
        
        // 셀내용갱신
        Product *item = data[indexPath.row];
        [cell setProductInfo:item];
        // 뷰 컨트롤러가 셀의 델리게이트 역할을 수행한다.
        cell.delegate = self;
        
        return cell;
    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL"];
        Product *item = cart[indexPath.row];
        cell.textLabel.text = item.name;
        return cell;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	data = @[[Product Product:@"BaseBall" price:@"100" imageName:@"baseball.png"],
             [Product Product:@"BasketBall" price:@"200" imageName:@"basketball.png"],
             [Product Product:@"FootBall" price:@"250" imageName:@"football.png"],
             [Product Product:@"RugbyBall" price:@"300" imageName:@"rugbyball.png"],
             [Product Product:@"Wilson" price:@"999" imageName:@"volleyball.png"]];
    
    cart = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
