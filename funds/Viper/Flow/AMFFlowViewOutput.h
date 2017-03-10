//
//  AMFFlowViewOutput.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

@protocol AMFFlowViewOutput <NSObject>

-(void)setupView;
-(void)pageClicked;
-(void)addClicked;
//-(void)entryClicked;

/**
 Method reports to presenter that it's ready for work
 */
- (void)didTriggerViewReadyEvent;

@end
