//
//  AMFStorageHandlerProtocol.h
//  funds
//
//  Created by Michael on 09.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

@protocol AMFCashProtocol;
@protocol AMFPageProtocol;
@protocol AMFCategoryProtocol;
@protocol AMFWalletProtocol;
@protocol AMFCurrencyProtocol;

@protocol AMFStorageHandlerProtocol <NSObject>

- (void)updatePage:(id<AMFPageProtocol>)page withName:(NSString *)name;
- (void)addPage:(id<AMFPageProtocol>)page;
- (void)removePage:(id<AMFPageProtocol>)page;
- (void)addRecord:(id<AMFCashProtocol>)rec;
- (id<AMFCashProtocol>)findCashInStorage:(id<AMFCashProtocol>)rec;
- (void)updateRecord:(id<AMFCashProtocol>)rec
          withAmount:(double)amount
           andWallet:(id<AMFWalletProtocol>)wallet
         andCategory:(id<AMFCategoryProtocol>)category;
- (void)removeRecord:(id<AMFCashProtocol>)rec;
- (void)updateWallet:(id<AMFWalletProtocol>)wallet
            withName:(NSString *)name
             andIcon:(NSString *)icon;
- (void)addRecords:(NSArray *)ar;
- (NSArray *)grabRecordsForPage:(id<AMFPageProtocol>)page;
- (NSArray *)grabAllRecords;
- (NSArray *)grabAllPages;
- (NSArray *)grabAllCategories;
- (NSArray *)grabAllCurrencies;
- (NSArray *)grabAllWallets;
- (NSArray *)grabAllRecordsForWallet:(id<AMFWalletProtocol>)wallet;
- (void)removeWallet:(id<AMFWalletProtocol>)wallet;
- (id<AMFWalletProtocol>)createWalletWithName:(NSString *)name
                                      andIcon:(NSString*)icon;
- (id<AMFCategoryProtocol>)createCategoryWithName:(NSString *)name
                                          andIcon:(NSString*)icon;
- (id<AMFCurrencyProtocol>)createCurrencyWithName:(NSString *)name;
- (id<AMFCategoryProtocol>)grabCategoryWithName:(NSString *)name;
- (void)updateCategory:(id<AMFCategoryProtocol>)category
              withName:(NSString *)name
               andIcon:(NSString *)icon;
- (void)updateCurrency:(id<AMFCurrencyProtocol>)currency
          withCurrency:(id<AMFCurrencyProtocol>)cur;
- (void)removeAll;

@end
