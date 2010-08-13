    //
//  DropViewController.m
//  Drop
//
//  Created by Zac White on 8/12/10.
//  Copyright 2010 Gravity Mobile. All rights reserved.
//

#import "DropViewController.h"

@implementation DropViewController

@synthesize dropWell;

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[[DKDragDropServer sharedServer] markViewAsDropTarget:self.dropWell
												 forTypes:[NSArray arrayWithObject:@"public.text"]
											 withDelegate:self];
}

- (void)dragDidEnterTargetView:(UIView *)targetView {
	
}

- (void)dragDidLeaveTargetView:(UIView *)targetView {
	
}

- (void)drag:(NSString *)dropID completedOnTargetView:(UIView *)targetView withDragPasteboard:(UIPasteboard *)dragPasteboard context:(void *)context {
	// context is always nil on inter-app drags.
	self.dropWell.text = [[[NSString alloc] initWithData:[dragPasteboard dataForPasteboardType:@"public.text"] encoding:NSUTF8StringEncoding] autorelease];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
	
	self.dropWell = nil;
	
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	
	self.dropWell = nil;
	
    [super dealloc];
}


@end