//
//  ViewController.h
//  IdentifyTheFlag
//
//  Created by Jeremy Dennen on 9/29/15.
//  Copyright © 2015 Jeremy Dennen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *flagByCountry;
@property (weak, nonatomic) IBOutlet UIPickerView *pickedCountry;


@end

