//
//  PaymentAppUITests.m
//  PaymentAppUITests
//
//  Created by Vitor Santos do Nascimento on 1/14/18.
//

#import <XCTest/XCTest.h>

@interface PaymentAppUITests : XCTestCase

@end

@implementation PaymentAppUITests

- (void)testSuccessPayment {
	
	
	XCUIApplication *app = [[XCUIApplication alloc] init];
	XCUIElementQuery *tablesQuery = app.tables;
	XCUIElement *textField = [tablesQuery.cells childrenMatchingType:XCUIElementTypeTextField].element;
	[textField tap];
	[textField typeText:@"222000"];
	[tablesQuery/*@START_MENU_TOKEN@*/.staticTexts[@"CLP"]/*[[".cells.staticTexts[@\"CLP\"]",".staticTexts[@\"CLP\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
	
	XCUIElement *continueButtonButton = app.buttons[@"continue button"];
	[continueButtonButton tap];
	[tablesQuery/*@START_MENU_TOKEN@*/.staticTexts[@"seleccionar"]/*[[".cells.staticTexts[@\"seleccionar\"]",".staticTexts[@\"seleccionar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
	/*@START_MENU_TOKEN@*/[app.pickerWheels[@"Visa"] pressForDuration:4.1];/*[["app",".pickers.pickerWheels[@\"Visa\"]","["," tap];"," pressForDuration:4.1];",".pickerWheels[@\"Visa\"]"],[[[-1,0,1]],[[-1,5,2],[-1,1,2]],[[2,4],[2,3]]],[0,0,0]]@END_MENU_TOKEN@*/
	
	XCUIElement *doneButton = app.toolbars.buttons[@"Done"];
	[doneButton tap];
	[continueButtonButton tap];
	[/*@START_MENU_TOKEN@*/[tablesQuery.cells containingType:XCUIElementTypeStaticText identifier:@"Santader"]/*[["tablesQuery","[",".cells containingType:XCUIElementTypeStaticText identifier:@\"Banco\"]",".cells containingType:XCUIElementTypeStaticText identifier:@\"Santader\"]"],[[[-1,0,1]],[[1,3],[1,2]]],[0,0]]@END_MENU_TOKEN@*/.staticTexts[@"seleccionar"] tap];
	[doneButton tap];
	[continueButtonButton tap];
	[/*@START_MENU_TOKEN@*/[tablesQuery.cells containingType:XCUIElementTypeStaticText identifier:@"3x 23.000"]/*[["tablesQuery","[",".cells containingType:XCUIElementTypeStaticText identifier:@\"Cuotas\"]",".cells containingType:XCUIElementTypeStaticText identifier:@\"3x 23.000\"]"],[[[-1,0,1]],[[1,3],[1,2]]],[0,0]]@END_MENU_TOKEN@*/.staticTexts[@"seleccionar"] tap];
	[app/*@START_MENU_TOKEN@*/.pickerWheels[@"1 cuota de $ 222.000,00 ($ 222.000,00)"]/*[[".pickers.pickerWheels[@\"1 cuota de $ 222.000,00 ($ 222.000,00)\"]",".pickerWheels[@\"1 cuota de $ 222.000,00 ($ 222.000,00)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ swipeUp];
	[doneButton tap];
	[continueButtonButton tap];
	[app.buttons[@"finish"] tap];
	[[[[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:1] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element tap];
	[app.buttons[@"Hacer otra operación"] tap];
	
	
}
- (void)testCancel {
	
	XCUIApplication *app = [[XCUIApplication alloc] init];
	XCUIElementQuery *tablesQuery = app.tables;
	XCUIElement *textField = [tablesQuery.cells childrenMatchingType:XCUIElementTypeTextField].element;
	[textField tap];
	[textField typeText:@"222000"];
	[tablesQuery/*@START_MENU_TOKEN@*/.staticTexts[@"CLP"]/*[[".cells.staticTexts[@\"CLP\"]",".staticTexts[@\"CLP\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
	
	XCUIElement *continueButtonButton = app.buttons[@"continue button"];
	[continueButtonButton tap];
	[tablesQuery/*@START_MENU_TOKEN@*/.staticTexts[@"seleccionar"]/*[[".cells.staticTexts[@\"seleccionar\"]",".staticTexts[@\"seleccionar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
	/*@START_MENU_TOKEN@*/[app.pickerWheels[@"Visa"] pressForDuration:4.1];/*[["app",".pickers.pickerWheels[@\"Visa\"]","["," tap];"," pressForDuration:4.1];",".pickerWheels[@\"Visa\"]"],[[[-1,0,1]],[[-1,5,2],[-1,1,2]],[[2,4],[2,3]]],[0,0,0]]@END_MENU_TOKEN@*/
	
	XCUIElement *doneButton = app.toolbars.buttons[@"Done"];
	[doneButton tap];
	[continueButtonButton tap];
	[/*@START_MENU_TOKEN@*/[tablesQuery.cells containingType:XCUIElementTypeStaticText identifier:@"Santader"]/*[["tablesQuery","[",".cells containingType:XCUIElementTypeStaticText identifier:@\"Banco\"]",".cells containingType:XCUIElementTypeStaticText identifier:@\"Santader\"]"],[[[-1,0,1]],[[1,3],[1,2]]],[0,0]]@END_MENU_TOKEN@*/.staticTexts[@"seleccionar"] tap];
	[doneButton tap];
	[continueButtonButton tap];
	[/*@START_MENU_TOKEN@*/[tablesQuery.cells containingType:XCUIElementTypeStaticText identifier:@"3x 23.000"]/*[["tablesQuery","[",".cells containingType:XCUIElementTypeStaticText identifier:@\"Cuotas\"]",".cells containingType:XCUIElementTypeStaticText identifier:@\"3x 23.000\"]"],[[[-1,0,1]],[[1,3],[1,2]]],[0,0]]@END_MENU_TOKEN@*/.staticTexts[@"seleccionar"] tap];
	[app/*@START_MENU_TOKEN@*/.pickerWheels[@"1 cuota de $ 222.000,00 ($ 222.000,00)"]/*[[".pickers.pickerWheels[@\"1 cuota de $ 222.000,00 ($ 222.000,00)\"]",".pickerWheels[@\"1 cuota de $ 222.000,00 ($ 222.000,00)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ swipeUp];
	[doneButton tap];
	[continueButtonButton tap];
	[app.buttons[@"Cancelar"] tap];
	
}

@end
