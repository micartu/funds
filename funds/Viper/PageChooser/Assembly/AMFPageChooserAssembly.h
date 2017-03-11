//
//  AMFPageChooserAssembly.h
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@class AMFDataSupplierAssembly;

/**
 @author Michael Artuerhof

 PageChooser module
 */
@interface AMFPageChooserAssembly : TyphoonAssembly <RamblerInitialAssembly>

@property(nonatomic, strong, readonly) AMFDataSupplierAssembly *dataProvider;

@end
