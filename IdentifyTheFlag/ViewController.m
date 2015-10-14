//
//  ViewController.m
//  IdentifyTheFlag
//
//  Created by Jeremy Dennen on 9/29/15.
//  Copyright © 2015 Jeremy Dennen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inCountry;
@property (strong, nonatomic, readonly) NSArray *flags;
@property (strong, nonatomic, readonly) NSArray *countries;
@property (assign) NSInteger maxIndex;
@property (assign) NSInteger flagIndex;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _countries = @[@"Sierra Leone", @"South Africa", @"China", @"South Korea", @"Germany", @"Canada", @"USA", @"Columbia"];
    _flags = @[@"Africa-Sierra_Leone.png", @"Africa-South_Africa.png", @"Asia-China.png", @"Asia-South_Korea.png",
               @"Europe-Germany.png", @"North_America-Canada.png", @"North_America-USA.png", @"South_America-Colombia.png"];
    self.inCountry.delegate = self; // can't seem to figure out what is causing this warning...
    self.pickedCountry.dataSource = self;
    self.pickedCountry.delegate = self;
    self.maxIndex = [_countries count];
    self.flagIndex = arc4random() % self.maxIndex;
    [self.flagByCountry setImage:[UIImage imageNamed: _flags[self.flagIndex]]];
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler:)];
    tapGR.numberOfTapsRequired = 1;
    self.flagByCountry.userInteractionEnabled = YES;
    [self.flagByCountry addGestureRecognizer:tapGR];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapHandler: (UITapGestureRecognizer *) sender {
    self.flagIndex = arc4random() % self.maxIndex;
    [self.flagByCountry setImage:[UIImage imageNamed: _flags[self.flagIndex]]];
//    NSLog(@"current flag: %@", _flags[self.flagIndex]);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.inCountry) {
        [textField resignFirstResponder];
//        NSLog(@"%@", _inCountry.text);
//        NSLog(@"%@", _countries[self.flagIndex]);
        if ([textField.text isEqualToString: _countries[self.flagIndex]]) {
            self.inCountry.text = [self.inCountry.text stringByAppendingString:@": Correct"];
            return NO;
        }
        else {
            self.inCountry.text = [self.inCountry.text stringByAppendingString:@": Incorrect"];
            return NO;
        }
    }
    return YES;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _countries.count;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _countries[row];
}

- (void)pickerView:(UIPickerView*)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (row == self.flagIndex) {
        self.inCountry.text = @"Correct";
    }
    else {
        self.inCountry.text = @"Incorrect";
    }
}
@end
