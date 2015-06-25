//
//  ViewController.h
//  SKSearchTableView
//
//  Created by satheesh on 6/22/15.
//  Copyright (c) 2015 Satish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (weak, nonatomic) IBOutlet UISearchBar *mSearchBar;




@end

