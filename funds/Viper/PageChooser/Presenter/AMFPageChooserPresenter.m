//
//  AMFPageChooserPresenter.m
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFPageChooserPresenter.h"

#import "AMFPageChooserViewInput.h"
#import "AMFPageChooserInteractorInput.h"
#import "AMFPageChooserRouterInput.h"
#import "AMFPageChooserModuleOutput.h"
#import "AMFPageProtocol.h"
#import "NSUserDefaults+Archiver.h"
#import "GlobalConstants.h"

@implementation AMFPageChooserPresenter

#pragma mark - Methods of AMFPageChooserModuleInput

- (void)configureModuleWithPageSelected:(id<AMFPageProtocol>)page {
    self.view.selectedPage = page;
}

#pragma mark - Methods of AMFPageChooserViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
    // grab all needed data for view
    [self.interactor receiveAllPages];
}

- (void)cellSelected:(NSUInteger)index {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id<AMFPageProtocol> page = [self.view.pages objectAtIndex:index];
    [defaults persistObjAsData:page forKey:kLastPage];
    [self.moduleOutput pageWasChosen:page];
    [self.router closeDialog];
}

- (void)editCell:(NSUInteger)index {
    id<AMFPageProtocol> page = [self.view.pages objectAtIndex:index];
    [self.router openEditPageWithPage:page andOutput:self];
}

- (void)deleteCell:(NSUInteger)index {
    [self.router showAlternativeDialogWithMessage:AMFLocalize(@"Are you sure?")
                                        andAction:^(UIAlertAction *action) {
                                            id<AMFPageProtocol> page = [self.view.pages objectAtIndex:index];
                                            [self.interactor deletePage:page];
                                            [self.interactor receiveAllPages]; // update contents
                                        }];
}

- (void)cancelAction {
    [self.router closeDialog];
}

- (void)addPage {
    [self.router openAddPageWithOutput:self];
}

#pragma mark - Methods of AMFPageChooserInteractorOutput

- (void)receivedPages:(NSArray*) pages {
    self.view.pages = pages;
    [self.view refreshContents];
    [self.view placeSelectedPageAtCenter];
}

#pragma mark - Methods of AMFAddPageModuleOutput

- (void)pageUpdatedOrCreated {
    [self.interactor receiveAllPages];
}

@end
