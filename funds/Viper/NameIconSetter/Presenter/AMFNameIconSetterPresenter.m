//
//  AMFNameIconSetterPresenter.m
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFNameIconSetterPresenter.h"

#import "AMFNameIconSetterViewInput.h"
#import "AMFNameIconSetterInteractorInput.h"
#import "AMFNameIconSetterRouterInput.h"
#import "AMFNameIconSetterModuleOutput.h"

@implementation AMFNameIconSetterPresenter

#pragma mark - Methods of AMFNameIconSetterModuleInput

- (void)configureModuleWithName:(NSString*)name andIcon:(NSString*)icon {
    self.view.name = name;
    self.view.icon = icon;
}

#pragma mark - Methods of AMFNameIconSetterViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
    [self.view refreshContents];
}

- (void)doneEditingWithName:(NSString*)name andIcon:(NSString*)icon {
    [self.moduleOutput editFinishedWithName:name andIcon:icon];
    [self.router closeMe];
}

#pragma mark - Methods of AMFNameIconSetterInteractorOutput

@end