*** Settings ***
Library           Selenium2Library    implicit_wait=5    timeout=12.0
Library           DateTime
Library           String

*** Variables ***

*** Test Cases ***
Add Quotation
    Login Admin
    Click Element    css=i[class='icon-Menu-Quotation']
    Click Element    css=i[class='v-icon-bg icon-Add']
    Sleep    2 seconds
    Input Text    css=input[formcontrolname="subject"]    Test Create Quotation Only Exclude Vat - 02
    Click Element    css=span[formcontrolname="customerId"]
    Sleep    2 seconds
    Input Text    css=.e-input-filter    yupin
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='custom-btn-relate']
    Input Text    css=app-quotation-product-add li.ng-star-inserted input[type="number"]    10
    Press Key    css=app-quotation-product-add li.ng-star-inserted input[type="number"]    u'\ue013'
    Input Text    css=app-quotation-product-add ejs-accordion:nth-child(2) div.e-acrdn-panel input[type="number"]    10
    Click Button    xpath=//div[contains(@class,'sb-btn-group stickyB')]//button[contains(@class,'float-right sb-btn-submit e-control e-btn e-lib e-primary')]
    Click Element    xpath=//p[contains(text(),'Kanchanaburi')]
    Click Element    xpath=//span[contains(@class,'ng-star-inserted')][contains(text(),'-')]
    Sleep    1 seconds
    Click Element    xpath=//span[contains(text(), "7%")]
    Click Element    xpath=//span[@class='ng-star-inserted']
    Click Element    xpath=//span[contains(text(), "tax (1.5%)")]
    Input Text    css=input[formcontrolname="discountNote"]    ลดราคา
    Input Text    xpath=//input[@placeholder='฿0.00']    500
    ${TotalProduct1} =    Get Text    css=tr.ng-star-inserted:nth-child(1) td.talign-right
    Should Be Equal    ฿ 16,500.00    ${TotalProduct1}
    ${TotalProduct2} =    Get Text    css=tr.ng-star-inserted:nth-child(2) td.talign-right
    Should Be Equal    ฿ 15,000.00    ${TotalProduct2}
    Click Element    xpath=//p[@class='no-margin talign-center'][contains(text(),'Empeo')]
    ${SubTotal} =    Get Text    xpath=//tr[@class='talign-right']//td[contains(text(),'31,500.00')]
    Should Be Equal    ฿ 31,500.00    ${SubTotal}
    ${SubTotalWithDis} =    Get Text    xpath=//td[contains(text(),'31,000.00')]
    Should Be Equal    ฿ 31,000.00    ${SubTotalWithDis}
    ${ExcludeVat} =    Get Text    xpath=//td[contains(text(),'1,137.50')]
    Should Be Equal    ฿ 1,137.50    ${ExcludeVat}
    ${GrandTotal} =    Get Text    xpath=//tr[5]//td[2]
    Should Be Equal    ฿ 32,137.50    ${GrandTotal}
    ${wht} =    Get Text    xpath=//tr[6]//td[2]
    Should Be Equal    ฿ 260.81    ${wht}
    ${NetPay} =    Get Text    xpath=//td[contains(text(),'31,876.69')]
    Should Be Equal    ฿ 31,876.69    ${NetPay}
    Sleep    2 seconds
    Click Button    xpath=//button[contains(text(),'Preview')]
    Sleep    10 seconds
    Switch Browser    0
    sleep    2 seconds

Revise Quotation
    Login Admin
    sleep    5 seconds
    Click Element    css=i[class='icon-Menu-Quotation']
    sleep    2 seconds
    Click Element    xpath=//p[contains(text(),'Test Create Quotation Only Exclude Vat - 02')]
    sleep    2 seconds
    Click Button    xpath=//button[contains(text(),'Revise')]
    Sleep    5 seconds
    Click Element    css=app-quotation-add table.tb-product tr.ng-star-inserted:nth-child(2)
    Click Element    css=i.icon-RecycleBin
    ${SubWithDis} =    Get Text    xpath=//td[contains(text(),'16,000.00')]
    Should Be Equal    ฿ 16,000.00    ${SubWithDis}
    ${ExcludeVat} =    Get Text    xpath=//td[contains(text(),'1,120.00')]
    Should Be Equal    ฿ 1,120.00    ${ExcludeVat}
    ${GrandTotal} =    Get Text    xpath=//td[contains(text(),'17,120.00')]
    Should Be Equal    ฿ 17,120.00    ${GrandTotal}
    ${WithhodingTax} =    Get Text    xpath=//td[contains(text(),'256.80')]
    Should Be Equal    ฿ 256.80    ${WithhodingTax}
    ${NetPay} =    Get Text    xpath=//td[contains(text(),'16,863.20')]
    Should Be Equal    ฿ 16,863.20    ${NetPay}

Create Link Deal
    Login Staff
    Click Element    css=i[class='icon-Menu-Quotation']
    Click Element    css=i[class='v-icon-bg icon-Add']
    Sleep    2 seconds
    Input Text    css=input[formcontrolname="subject"]    Test Create Quotation Link Deal - 02
    Click Element    css=span[formcontrolname="customerId"]
    Sleep    2 seconds
    Input Text    css=.e-input-filter    สุทธ
    Press Key    css=.e-input-filter    \\13
    sleep    1 seconds
    Click Element    css=app-master-layout div.content-block:nth-child(1) span:nth-child(4)
    Input Text    css=input.e-input-filter.e-input.e-lib.e-keyboard    สุทธวีร์
    Press Key    css=input.e-input-filter.e-input.e-lib.e-keyboard    \\13
    Click Element    xpath=//span[contains(text(),'Nakhon Pathom, Thailand')]
    Sleep    2 seconds
    Click Element    css=app-master-layout div.content-block:nth-child(5) div:nth-child(2) div.col.col-sm-3
    Sleep    2 seconds
    Click Element    xpath=//body//app-quotation-link-deal//li[1]
    Click Element    xpath=//div[@class='custom-btn-relate']
    Input Text    css=app-quotation-product-add li.ng-star-inserted input[type="number"]    10
    Press Key    css=app-quotation-product-add li.ng-star-inserted input[type="number"]    u'\ue013'
    Input Text    css=app-quotation-product-add ejs-accordion:nth-child(2) div.e-acrdn-panel input[type="number"]    10
    Click Button    xpath=//div[contains(@class,'sb-btn-group stickyB')]//button[contains(@class,'float-right sb-btn-submit e-control e-btn e-lib e-primary')]
    Click Element    xpath=//span[contains(@class,'ng-star-inserted')][contains(text(),'-')]
    Sleep    1 seconds
    Click Element    xpath=//span[contains(text(), "7%")]
    Click Element    xpath=//span[@class='ng-star-inserted']
    Click Element    xpath=//span[contains(text(), "tax (1.5%)")]
    Input Text    css=input[formcontrolname="discountNote"]    ลดราคา
    Input Text    xpath=//input[@placeholder='฿0.00']    500
    ${TotalProduct1} =    Get Text    css=tr.ng-star-inserted:nth-child(1) td.talign-right
    Should Be Equal    ฿ 16,500.00    ${TotalProduct1}
    ${TotalProduct2} =    Get Text    css=tr.ng-star-inserted:nth-child(2) td.talign-right
    Should Be Equal    ฿ 15,000.00    ${TotalProduct2}
    Click Element    xpath=//p[@class='no-margin talign-center'][contains(text(),'Empeo')]
    ${SubTotal} =    Get Text    xpath=//tr[@class='talign-right']//td[contains(text(),'31,500.00')]
    Should Be Equal    ฿ 31,500.00    ${SubTotal}
    ${SubTotalWithDis} =    Get Text    xpath=//td[contains(text(),'31,000.00')]
    Should Be Equal    ฿ 31,000.00    ${SubTotalWithDis}
    ${ExcludeVat} =    Get Text    xpath=//td[contains(text(),'1,137.50')]
    Should Be Equal    ฿ 1,137.50    ${ExcludeVat}
    ${GrandTotal} =    Get Text    xpath=//tr[5]//td[2]
    Should Be Equal    ฿ 32,137.50    ${GrandTotal}
    ${wht} =    Get Text    xpath=//tr[6]//td[2]
    Should Be Equal    ฿ 260.81    ${wht}
    ${NetPay} =    Get Text    xpath=//td[contains(text(),'31,876.69')]
    Should Be Equal    ฿ 31,876.69    ${NetPay}
    Click Button    xpath=//button[contains(text(),'Create Quotation')]

Create A New Deal
    Login Sups
    Click Element    css=i[class='icon-Menu-Quotation']
    Click Element    css=i[class='v-icon-bg icon-Add']
    Sleep    2 seconds
    Input Text    css=input[formcontrolname="subject"]    Test Create Quotation A New Deal - 01
    Click Element    css=span[formcontrolname="customerId"]
    Sleep    2 seconds
    Input Text    css=.e-input-filter    สุทธ
    Press Key    css=.e-input-filter    \\13
    sleep    1 seconds
    Click Element    css=app-master-layout div.content-block:nth-child(1) span:nth-child(4)
    Input Text    css=input.e-input-filter.e-input.e-lib.e-keyboard    สุทธวีร์
    Press Key    css=input.e-input-filter.e-input.e-lib.e-keyboard    \\13
    Click Element    xpath=//span[contains(text(),'Nakhon Pathom, Thailand')]
    Sleep    1 seconds
    Click Element    css=app-master-layout div.content-block:nth-child(5) div:nth-child(3)
    Sleep    1 seconds
    Click Element    xpath=//body//app-quotation-link-deal//li[1]
    Click Element    xpath=//div[@class='custom-btn-relate']
    Input Text    css=app-quotation-product-add li.ng-star-inserted input[type="number"]    10
    Press Key    css=app-quotation-product-add li.ng-star-inserted input[type="number"]    u'\ue013'
    Input Text    css=app-quotation-product-add ejs-accordion:nth-child(2) div.e-acrdn-panel input[type="number"]    10
    Click Button    xpath=//div[contains(@class,'sb-btn-group stickyB')]//button[contains(@class,'float-right sb-btn-submit e-control e-btn e-lib e-primary')]
    Click Element    xpath=//span[contains(@class,'ng-star-inserted')][contains(text(),'-')]
    Sleep    1 seconds
    Click Element    xpath=//span[contains(text(), "7%")]
    Click Element    xpath=//span[@class='ng-star-inserted']
    Click Element    xpath=//span[contains(text(), "tax (1.5%)")]
    Input Text    css=input[formcontrolname="discountNote"]    ลดราคา
    Input Text    xpath=//input[@placeholder='฿0.00']    500
    ${TotalProduct1} =    Get Text    css=tr.ng-star-inserted:nth-child(1) td.talign-right
    Should Be Equal    ฿ 16,500.00    ${TotalProduct1}
    ${TotalProduct2} =    Get Text    css=tr.ng-star-inserted:nth-child(2) td.talign-right
    Should Be Equal    ฿ 15,000.00    ${TotalProduct2}
    Click Element    xpath=//p[@class='no-margin talign-center'][contains(text(),'Empeo')]
    ${SubTotal} =    Get Text    xpath=//tr[@class='talign-right']//td[contains(text(),'31,500.00')]
    Should Be Equal    ฿ 31,500.00    ${SubTotal}
    ${SubTotalWithDis} =    Get Text    xpath=//td[contains(text(),'31,000.00')]
    Should Be Equal    ฿ 31,000.00    ${SubTotalWithDis}
    ${ExcludeVat} =    Get Text    xpath=//td[contains(text(),'1,137.50')]
    Should Be Equal    ฿ 1,137.50    ${ExcludeVat}
    ${GrandTotal} =    Get Text    xpath=//tr[5]//td[2]
    Should Be Equal    ฿ 32,137.50    ${GrandTotal}
    ${wht} =    Get Text    xpath=//tr[6]//td[2]
    Should Be Equal    ฿ 260.81    ${wht}
    ${NetPay} =    Get Text    xpath=//td[contains(text(),'31,876.69')]
    Should Be Equal    ฿ 31,876.69    ${NetPay}
    Click Button    xpath=//button[contains(text(),'Create Quotation')]

Create Deal
    Login Staff
    Click Element    css=i[class='icon-Menu-DealManagement']
    Click Element    css=i[class='v-icon-bg icon-Add']
    sleep    2 seconds
    Click Element    css=app-deal-add div.sb-body div.control-styles
    sleep    1 seconds
    Input Text    css=app-deal-add div.sb-body div.control-styles input.e-dropdownbase    มัลลิกา น่ารัก
    sleep    1 seconds
    Press Key    css=app-deal-add div.sb-body div.control-styles input.e-dropdownbase    \\13
    Input Text    css=input[formcontrolname="dealsName"]    Create Deal Web - 03
    Input Text    css=input[formcontrolname="dealsValue"]    35000
    sleep    1 seconds
    Click Element    css=app-deal-add div.sb-body div.e-slider-button:nth-child(3)
    Click Element    css=app-deal-add div.sb-body div.e-slider-button:nth-child(3)
    Click Element    css=app-deal-add div.sb-body div.form-group:nth-child(5) ejs-multiselect
    Sleep    1 seconds
    Input Text    css=app-deal-add div.sb-body div.form-group:nth-child(5) ejs-multiselect input.e-dropdownbase    Venio
    Press Key    css=app-deal-add div.sb-body div.form-group:nth-child(5) ejs-multiselect input.e-dropdownbase    \\13
    Click Element    css=app-deal-add div.sb-body div.form-group:nth-child(6) ejs-multiselect
    sleep    1 seconds
    Input Text    css=app-deal-add div.sb-body div.form-group:nth-child(6) ejs-multiselect input    Venio
    Press Key    css=app-deal-add div.sb-body div.form-group:nth-child(6) ejs-multiselect input    \\13
    Click Element    css=app-deal-add div.sb-body div.form-group:nth-child(1) div.control-section
    Input Text    css=app-deal-add div.sb-body div.form-group:nth-child(1) div.control-section input.e-dropdownbase    เดชา
    Press Key    css=app-deal-add div.sb-body div.form-group:nth-child(1) div.control-section input.e-dropdownbase    \\13
    sleep    1 seconds
    Click Button    xpath=//form[@class='form-horizontal ng-dirty ng-touched ng-valid']//button[@class='float-right sb-btn-submit e-control e-btn e-lib e-primary']
    Close Browser

Edit Deal
    Login Staff
    Click Element    css=i[class='icon-Menu-DealManagement']
    Wait Until Element Is Visible    xpath=//p[contains(text(),'Create Deal Web - 02')]
    Click Element    xpath=//p[contains(text(),'Create Deal Web - 02')]
    sleep    1 seconds
    Click Element    css=i[class='fa fa-pencil']
    Clear Element Text    css=input[formcontrolname="dealsName"]
    Input Text    css=input[formcontrolname="dealsName"]    Edit Deal Web - 03
    sleep    2 seconds
    Clear Element Text    css=input[formcontrolname="dealsValue"]
    Input Text    css=input[formcontrolname="dealsValue"]    85000
    Click Element    css=app-deal-add div.e-slider-button:nth-child(3)
    Click Element    css=app-deal-add div.e-slider-button:nth-child(3)
    Click Button    xpath=//body/div[@id='wrapper']/div[1]/div[1]/app-deal[1]/app-deal-add[1]/ejs-sidebar[1]/div[1]/div[2]/form[1]/button[1]

Update Stage Deal
    Login Staff
    Click Element    css=i[class='icon-Menu-DealManagement']
    sleep    1 seconds
    Click Element    xpath=//p[contains(text(),'Create Deal Web - 02')]
    sleep    1 seconds
    Click Button    css=button.float-right.sb-btn-submit.e-control.e-btn.e-lib.e-primary:nth-child(1)
    Clear Element Text    css=input[formcontrolname="dealsValue"]

Edit Plan
    Login Staff
    Click Element    css=i[class='icon-Menu-Plan']
    Wait Until Element Is Visible    xpath=//p[@class='weight-medium'][contains(text(),'Create Plan From Web - 2')]
    Click Element    xpath=//p[@class='weight-medium'][contains(text(),'Create Plan From Web - 2')]
    Wait Until Element Is Visible    css=div.e-content p.sb-body-headerDetail span.font16 span.font12
    Click Element    css=div.e-content p.sb-body-headerDetail span.font16 span.font12
    Wait Until Element Is Visible    css=div.content-detail i.icon-Edit-Blue
    Click Element    css=div.content-detail i.icon-Edit-Blue
    Clear Element Text    id=subject
    Input Text    id=subject    Edit Plan Web - 2
    Click Element    css=div.form-group:nth-child(2) span.e-input-group-icon.e-ddl-icon.e-search-icon
    Wait Until Element Is Visible    css=.e-input-filter
    Input Text    css=.e-input-filter    video
    Press Key    css=.e-input-filter    \\13
    Sleep    2 seconds
    Input Text    css= div.sidebar div.form-group.ng-star-inserted textarea    Test Edit Plan
    Click Button    css=div.sidebar button[type="submit"]

Create Contact
    Login Staff
    Click Element    css=i[class='icon-Menu-Customer-centric-white font32']
    Wait Until Element Is Visible    css=input[type="text"]
    Input Text    css=input[type="text"]    แป้งโกะ
    Wait Until Element Is Visible    css=table tr.tr-cursor.ng-star-inserted
    Click Element    css=table tr.tr-cursor.ng-star-inserted
    Wait Until Element Is Visible    css=div.e-item div.col span.font18 i
    Click Element    css=div.e-item div.col span.font18 i
    Wait Until Element Is Visible    xpath=//body/div[@id='wrapper']/div[1]/div[1]/app-customer-detail[1]/app-contact-add[1]/ejs-sidebar[1]/div[1]/div[2]/form[1]/div[1]/div[1]/input[1]
    Input Text    xpath=//body/div[@id='wrapper']/div[1]/div[1]/app-customer-detail[1]/app-contact-add[1]/ejs-sidebar[1]/div[1]/div[2]/form[1]/div[1]/div[1]/input[1]    k.สุรเดช
    Input Text    xpath=//body/div[@id='wrapper']/div[1]/div[1]/app-customer-detail[1]/app-contact-add[1]/ejs-sidebar[1]/div[1]/div[2]/form[1]/div[2]/div[1]/input[1]    Suradech
    Input Text    xpath=//body/div[@id='wrapper']/div[1]/div[1]/app-customer-detail[1]/app-contact-add[1]/ejs-sidebar[1]/div[1]/div[2]/form[1]/div[3]/div[1]/input[1]    Lead
    Input Text    xpath=//body/div[@id='wrapper']/div[1]/div[1]/app-customer-detail[1]/app-contact-add[1]/ejs-sidebar[1]/div[1]/div[2]/form[1]/div[5]/div[1]/input[1]    suradech@gmail.com
    Input Text    xpath=//body/div[@id='wrapper']/div[1]/div[1]/app-customer-detail[1]/app-contact-add[1]/ejs-sidebar[1]/div[1]/div[2]/form[1]/div[6]/div[1]/input[1]    0830731873
    Click Button    xpath=//body/div[@id='wrapper']/div[1]/div[1]/app-customer-detail[1]/app-contact-add[1]/ejs-sidebar[1]/div[1]/div[2]/form[1]/button[1]

Edit Contact
    Login Staff
    Click Element    css=i[class='icon-Menu-Customer-centric-white font32']
    Wait Until Element Is Visible    css=input[type="text"]
    Input Text    css=input[type="text"]    แป้งโกะ
    Wait Until Element Is Visible    css=table tr.tr-cursor.ng-star-inserted
    Click Element    css=table tr.tr-cursor.ng-star-inserted
    Click Element    css=div.e-item div.col div.col-6 div.media
    Wait Until Element Is Visible    css=app-contact-detail ejs-sidebar.e-control.e-sidebar.e-lib.e-transition.e-right.e-open.e-push div.sb-body i
    Click Element    css=app-contact-detail ejs-sidebar.e-control.e-sidebar.e-lib.e-transition.e-right.e-open.e-push div.sb-body i
    Wait Until Element Is Visible    xpath=//body/div[@id='wrapper']/div[1]/div[1]/app-customer-detail[1]/app-contact-detail[1]/app-contact-add[1]/ejs-sidebar[1]/div[1]/div[2]/form[1]/div[3]/div[1]/input[1]
    Clear Element Text    xpath=//body/div[@id='wrapper']/div[1]/div[1]/app-customer-detail[1]/app-contact-detail[1]/app-contact-add[1]/ejs-sidebar[1]/div[1]/div[2]/form[1]/div[3]/div[1]/input[1]
    Input Text    xpath=//body/div[@id='wrapper']/div[1]/div[1]/app-customer-detail[1]/app-contact-detail[1]/app-contact-add[1]/ejs-sidebar[1]/div[1]/div[2]/form[1]/div[3]/div[1]/input[1]    Sales
    Input Text    xpath=//body/div[@id='wrapper']/div[1]/div[1]/app-customer-detail[1]/app-contact-detail[1]/app-contact-add[1]/ejs-sidebar[1]/div[1]/div[2]/form[1]/div[7]/div[1]/input[1]    027556565
    Click Button    css=button[type="submit"]

Create SO
    Login Admin
    Wait Until Element Is Visible    css=i[class='icon-Menu-SalesOrder']
    Click Element    css=i[class='icon-Menu-SalesOrder']
    Click Element    css=i[class='v-icon-bg icon-Add']
    sleep    5 s
    Click Element    css=span[formcontrolname="customerId"]
    Wait Until Element Is Visible    css=.e-input-filter
    Input Text    css=.e-input-filter    แป้งโกะ
    sleep    2 s
    Press Key    css=.e-input-filter    \\13
    sleep    2 s
    Click Element    css=span[formcontrolname="contactId"]
    Wait Until Element Is Visible    css=.e-input-filter
    Input Text    css=.e-input-filter    nanthanat
    sleep    1 s
    Press Key    css=.e-input-filter    \\13
    Input Text    css=textarea[formcontrolname="refNo"]    1234567890
    Click Element    css=div.block-place.dp-inlineBlock.col-3.ng-star-inserted
    Click Element    css=div.content-block:nth-child(5) div.selectBlocks div:nth-child(3)
    Click Element    css=div.custom-btn-relate
    Input Text    css=input[type="number"]    10
    Input Text    css=app-quotation-product-add ejs-accordion:nth-child(2) div.e-acrdn-panel input[type="number"]    5
    Input Text    css=app-quotation-product-add ejs-accordion:nth-child(3) div.e-acrdn-panel input[type="number"]    2
    Input Text    css=app-quotation-product-add ejs-accordion:nth-child(4) div.e-acrdn-panel input[type="number"]    3
    Click Button    css=div.sb-btn-group button
    Click Element    css=tr.ng-star-inserted:nth-child(1)
    Input Text    css=tr.ng-star-inserted:nth-child(1) td.talign-left input    5%
    sleep    2 s
    Click Element    xpath=//tbody/tr[1]/td[7]/div[1]/ejs-dropdownlist[1]/span[1]/span[2]
    Click Element    xpath=//span[contains(text(), "7%")]
    Click Element    xpath=//tbody/tr[1]/td[8]/div[1]/ejs-dropdownlist[1]/span[1]/span[2]
    Click Element    xpath=//span[contains(text(), "kiki (1.5%)")]
    Click Element    css=tr.ng-star-inserted:nth-child(2) td.talign-left
    FOR    IN

1.Add Lead Business
    Login Staff
    Wait Until Element Is Visible    xpath=//i[@class='icon-Menu-Customer-centric-white font32']
    Click Element    xpath=//i[@class='icon-Menu-Customer-centric-white font32']
    Wait Until Element Is Visible    css=div.customer-page div.custom-scrollbar button
    Click Element    css=div.customer-page div.custom-scrollbar button
    Wait Until Element Is Visible    xpath=//div[@class='row customer-type']/div[1]
    Click Element    xpath=//div[@class='row customer-type']/div[1]
    Click Element    xpath=//div[@class='row customer-type type']/div[1]
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${customerCode}    Set Variable    A_L-Bu-${date}-WEB
    ${customerName}    Set Variable    A_Nam-Lead-Bus-${date}-WEB
    ${secondaryName}    Set Variable    A_Nam-AI-Test-${date}-WEB
    ${item}    Set Variable    A_Nam-AI-Test-${date}-WEB
    ${contactname}    Set Variable    A_Con-Lead-Bus-${date}-WEB
    ${customerGroupId}    Set Variable    star
    ${classification}    Set Variable    A
    ${sourceOfLead}    Set Variable    facebook
    ${tag}    Set Variable    Venio
    ${customerOwnersStr}    Set Variable    นันทภัทร
    ${phone}    Set Variable    0811111111
    ${mobile}    Set Variable    0822222222
    ${email}    Set Variable    Lead@business.com
    ${textarea}    Set Variable    A_Nam-AI-Test-${date}-WEB
    Input Text    css=input[formcontrolname='customerCode']    ${customerCode}
    Input Text    css=input[formcontrolname='customerName']    ${customerName}
    Input Text    css=input[formcontrolname="secondaryName"]    ${secondaryName}
    Input Text    css=input[formcontrolname='item']    ${item}
    Press Key    css=input[formcontrolname='item']    \\13
    Check Close Dialog Content
    Input Text    css=input[formcontrolname='contactName']    ${contactname}
    Input Text    xpath=(//input[@formcontrolname='mobile'])[1]    ${mobile}
    Input Text    xpath=(//input[@formcontrolname='email'])[1]    ${email}
    Comment    Click Element    xpath=//div[@class='custom-btn-relate item-btn w-100']    \    #Wait PI Search Address
    Comment    Input Text    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    พีเจเพลส
    Comment    Press Key    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[1]
    Comment    Click Button    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Input Text    css=input[formcontrolname='phone']    ${phone}
    Input Text    xpath=(//input[@formcontrolname='mobile'])[2]    ${mobile}
    Input Text    xpath=(//input[@formcontrolname='email'])[2]    ${email}
    Click Element    xpath=//div[@class='custom-btn-relate item-btn w-100 ng-star-inserted']
    Click Element    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \\13
    Input Text    xpath=//input[@class='form-control ng-untouched ng-pristine ng-valid']    ฉัตรณรงค์
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][2]/div/div/p/span[1]
    Click Element    xpath=//span[@formcontrolname='sourceOfLead']
    Input Text    css=.e-input-filter    ${sourceOfLead}
    Press Key    css=.e-input-filter    \\13
    ${sourceOfLead}    Get Selected List Value    xpath=//span[@formcontrolname="sourceOfLead"]/select
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][4]/div/div/p/span[1]
    Click Element    xpath=//span[@formcontrolname='customerGroupId']
    Input Text    css=.e-input-filter    ${customerGroupId}
    Press Key    css=.e-input-filter    \\13
    ${customerGroupId}    Get Selected List Value    xpath=//span[@formcontrolname='customerGroupId']/select
    Click Element    xpath=//div[@class='e-multi-select-wrapper']
    Input Text    xpath=//input[@formcontrolname='customerOwnersStr']    ${customerOwnersStr}
    Press Key    xpath=//input[@formcontrolname='customerOwnersStr']    \\13
    Input Text    xpath=//div[@class='content-section'][5]/div[1]/div/textarea    ${textarea}
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='content-section'][5]/div[2]/div/div/div[1]/ejs-radiobutton
    Click Button    css=button[type='submit']
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[2]/div[2]/div/div/ul/li[2]
    Wait Until Element Is Visible    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input
    Input Text    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input    ${customerCode}
    Wait Until Element Is Visible    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Click Element    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Wait Until Element Is Visible    css=i[class='icon-Edit']
    Click Element    css=i[class='icon-Edit']
    Close Browser

2.Add Lead Individual
    Login Staff
    Wait Until Element Is Visible    css=i[class='icon-Menu-Customer-centric-white font32']
    Click Element    css=i[class='icon-Menu-Customer-centric-white font32']
    Wait Until Element Is Visible    css=div.customer-page div.custom-scrollbar button
    Click Element    css=div.customer-page div.custom-scrollbar button
    Wait Until Element Is Visible    xpath=//div[@class='row customer-type']/div[1]
    Click Element    xpath=//div[@class='row customer-type']/div[1]
    Click Element    xpath=//div[@class='row customer-type type']/div[2]
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${customerCode}    Set Variable    A_L-In-${date}-WEB
    ${customerName}    Set Variable    A_Nam-Lead-Indi-${date}-WEB
    ${secondaryName}    Set Variable    A_Nam-AI-Test-${date}-WEB
    ${item}    Set Variable    A_Nam-AI-Test-${date}-WEB
    ${contactname}    Set Variable    A_Con-Lead-Indi-${date}-WEB
    ${customerGroupId}    Set Variable    star
    ${classification}    Set Variable    A
    ${sourceOfLead}    Set Variable    facebook
    ${tag}    Set Variable    Venio
    ${customerOwnersStr}    Set Variable    นันทภัทร
    ${phone}    Set Variable    0811111111
    ${mobile}    Set Variable    0822222222
    ${email}    Set Variable    Lead@Individual.com
    ${textarea}    Set Variable    A_Nam-AI-Test-${date}-WEB
    Input Text    css=input[formcontrolname='customerCode']    ${customerCode}
    Input Text    css=input[formcontrolname='customerName']    ${customerName}
    Input Text    css=input[formcontrolname="secondaryName"]    ${secondaryName}
    Input Text    css=input[formcontrolname='item']    ${item}
    Press Key    css=input[formcontrolname='item']    \\13
    Check Close Dialog Content
    Comment    Input Text    css=input[formcontrolname='contactName']    ${contactname}
    Comment    Input Text    xpath=(//input[@formcontrolname='mobile'])[1]    ${mobile}
    Comment    Input Text    xpath=(//input[@formcontrolname='email'])[1]    ${email}
    Input Text    css=input[formcontrolname="position"]    IT-Deverlopment
    Click Element    css=input[formcontrolname="dateOfBirth"]
    Wait Until Element Is Visible    xpath=(//button[@class='owl-dt-control-button owl-dt-control-arrow-button'])[1]
    Click Element    xpath=(//button[@class='owl-dt-control-button owl-dt-control-arrow-button'])[1]
    Click Element    xpath=//td[@aria-label='1999']
    Click Element    xpath=//td[@aria-label='May 1999']
    Click Element    xpath=//td[@aria-label='May 6, 1999']
    Click Element    xpath=//div[@formgroupname='customerProfile']/div[3]/div/div/div[1]
    Click Element    xpath=//div[@formgroupname='customerProfile']/div[4]/div/div/div[1]
    Click Element    xpath=//div[@formgroupname='customerProfile']/div[5]/div/div/div[2]
    Comment    Click Element    xpath=//div[@class='custom-btn-relate item-btn w-100']
    Comment    Input Text    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    พีเจเพลส
    Comment    Press Key    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[1]
    Comment    Click Button    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Input Text    css=input[formcontrolname='phone']    ${phone}
    Input Text    xpath=(//input[@formcontrolname='mobile'])[1]    ${mobile}
    Input Text    xpath=(//input[@formcontrolname='email'])[1]    ${email}
    Click Element    xpath=//div[@class='custom-btn-relate item-btn w-100 ng-star-inserted']
    Click Element    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \\13
    Input Text    xpath=//input[@class='form-control ng-untouched ng-pristine ng-valid']    ฉัตรณรงค์
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][2]/div/div/p/span[1]
    Click Element    xpath=//span[@formcontrolname='sourceOfLead']
    Input Text    css=.e-input-filter    ${sourceOfLead}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][4]/div/div/p/span[1]
    Click Element    xpath=//span[@formcontrolname='customerGroupId']
    Input Text    css=.e-input-filter    ${customerGroupId}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='e-multi-select-wrapper']
    Input Text    xpath=//input[@formcontrolname='customerOwnersStr']    ${customerOwnersStr}
    Press Key    xpath=//input[@formcontrolname='customerOwnersStr']    \\13
    Input Text    xpath=//div[@class='content-section'][5]/div[1]/div/textarea    ${textarea}
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='content-section'][5]/div[2]/div/div/div[1]/ejs-radiobutton
    Click Button    css=button[type='submit']
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[2]/div[2]/div/div/ul/li[2]
    Wait Until Element Is Visible    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input
    Input Text    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input    ${customerCode}
    Wait Until Element Is Visible    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Click Element    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Wait Until Element Is Visible    css=i[class='icon-Edit']
    Click Element    css=i[class='icon-Edit']
    Close Browser

3.Add Prospect Business
    Login Staff
    Wait Until Element Is Visible    xpath=//i[@class='icon-Menu-Customer-centric-white font32']
    Click Element    xpath=//i[@class='icon-Menu-Customer-centric-white font32']
    Wait Until Element Is Visible    css=div.customer-page div.custom-scrollbar button
    Click Element    css=div.customer-page div.custom-scrollbar button
    Wait Until Element Is Visible    xpath=//div[@class='row customer-type']/div[2]
    Click Element    xpath=//div[@class='row customer-type']/div[2]
    Click Element    xpath=//div[@class='row customer-type type']/div[1]
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${customerCode}    Set Variable    A_P-Bu-${date}-WEB
    ${customerName}    Set Variable    A_Nam-Pros-Bus-${date}-WEB
    ${secondaryName}    Set Variable    A_Nam-AI-Test-${date}-WEB
    ${item}    Set Variable    A_Nam-AI-Test-${date}-WEB
    ${contactname}    Set Variable    A_Con-Pros-Bus-${date}-WEB
    ${customerGroupId}    Set Variable    star
    ${classification}    Set Variable    A
    ${sourceOfLead}    Set Variable    facebook
    ${tag}    Set Variable    Venio
    ${customerOwnersStr}    Set Variable    นันทภัทร
    ${phone}    Set Variable    0811111111
    ${mobile}    Set Variable    0822222222
    ${email}    Set Variable    Pros@business.com
    ${textarea}    Set Variable    A_Nam-AI-Test-${date}-WEB
    Input Text    css=input[formcontrolname='customerCode']    ${customerCode}
    Input Text    css=input[formcontrolname='customerName']    ${customerName}
    Input Text    css=input[formcontrolname="secondaryName"]    ${secondaryName}
    Input Text    css=input[formcontrolname='item']    ${item}
    Press Key    css=input[formcontrolname='item']    \\13
    Check Close Dialog Content
    Input Text    css=input[formcontrolname='contactName']    ${contactname}
    Input Text    xpath=(//input[@formcontrolname='mobile'])[1]    ${mobile}
    Input Text    xpath=(//input[@formcontrolname='email'])[1]    ${email}
    Comment    Click Element    xpath=//div[@class='custom-btn-relate item-btn w-100']
    Comment    Input Text    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    พีเจเพลส
    Comment    Press Key    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[1]
    Comment    Click Button    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Input Text    css=input[formcontrolname='phone']    ${phone}
    Input Text    xpath=(//input[@formcontrolname='mobile'])[2]    ${mobile}
    Input Text    xpath=(//input[@formcontrolname='email'])[2]    ${email}
    Click Element    xpath=//div[@class='custom-btn-relate item-btn w-100 ng-star-inserted']
    Click Element    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \\13
    Input Text    xpath=//input[@class='form-control ng-untouched ng-pristine ng-valid']    ฉัตรณรงค์
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][2]/div/div/p/span[1]
    Click Element    xpath=//span[@formcontrolname='sourceOfLead']
    Input Text    css=.e-input-filter    ${sourceOfLead}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][4]/div/div/p/span[1]
    Click Element    xpath=//span[@formcontrolname='customerGroupId']
    Input Text    css=.e-input-filter    ${customerGroupId}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='e-multi-select-wrapper']
    Input Text    xpath=//input[@formcontrolname='customerOwnersStr']    ${customerOwnersStr}
    Press Key    xpath=//input[@formcontrolname='customerOwnersStr']    \\13
    Input Text    xpath=//div[@class='content-section'][5]/div[1]/div/textarea    ${textarea}
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='content-section'][5]/div[2]/div/div/div[1]/ejs-radiobutton
    Click Button    css=button[type='submit']
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[2]/div[2]/div/div/ul/li[2]
    Wait Until Element Is Visible    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input
    Input Text    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input    ${customerCode}
    Wait Until Element Is Visible    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Click Element    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Wait Until Element Is Visible    css=i[class='icon-Edit']
    Click Element    css=i[class='icon-Edit']
    Close Browser

4.Add Prospect Individual
    Login Staff
    Wait Until Element Is Visible    xpath=//i[@class='icon-Menu-Customer-centric-white font32']
    Click Element    xpath=//i[@class='icon-Menu-Customer-centric-white font32']
    Wait Until Element Is Visible    css=div.customer-page div.custom-scrollbar button
    Click Element    css=div.customer-page div.custom-scrollbar button
    Wait Until Element Is Visible    xpath=//div[@class='row customer-type']/div[2]
    Click Element    xpath=//div[@class='row customer-type']/div[2]
    Click Element    xpath=//div[@class='row customer-type type']/div[2]
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${customerCode}    Set Variable    A_P-In-${date}-WEB
    ${customerName}    Set Variable    A_Nam-Pros-Indi-${date}-WEB
    ${secondaryName}    Set Variable    A_Nam-AI-Test-${date}-WEB
    ${item}    Set Variable    A_Nam-AI-Test-${date}-WEB
    ${contactname}    Set Variable    A_Con-Pros-Indi-${date}-WEB
    ${customerGroupId}    Set Variable    star
    ${classification}    Set Variable    A
    ${sourceOfLead}    Set Variable    facebook
    ${tag}    Set Variable    Venio
    ${customerOwnersStr}    Set Variable    นันทภัทร
    ${phone}    Set Variable    0811111111
    ${mobile}    Set Variable    0822222222
    ${email}    Set Variable    Pros@Individual.com
    ${textarea}    Set Variable    A_Nam-AI-Test-${date}-WEB
    Input Text    css=input[formcontrolname='customerCode']    ${customerCode}
    Input Text    css=input[formcontrolname='customerName']    ${customerName}
    Input Text    css=input[formcontrolname="secondaryName"]    ${secondaryName}
    Input Text    css=input[formcontrolname='item']    ${item}
    Press Key    css=input[formcontrolname='item']    \\13
    Check Close Dialog Content
    Comment    Input Text    css=input[formcontrolname='contactName']    ${contactname}
    Comment    Input Text    xpath=(//input[@formcontrolname='mobile'])[1]    ${mobile}
    Comment    Input Text    xpath=(//input[@formcontrolname='email'])[1]    ${email}
    Input Text    css=input[formcontrolname="position"]    IT-Deverlopment
    Click Element    css=input[formcontrolname="dateOfBirth"]
    Wait Until Element Is Visible    xpath=(//button[@class='owl-dt-control-button owl-dt-control-arrow-button'])[1]
    Click Element    xpath=(//button[@class='owl-dt-control-button owl-dt-control-arrow-button'])[1]
    Click Element    xpath=//td[@aria-label='1999']
    Click Element    xpath=//td[@aria-label='May 1999']
    Click Element    xpath=//td[@aria-label='May 6, 1999']
    Click Element    xpath=//div[@formgroupname='customerProfile']/div[3]/div/div/div[1]
    Click Element    xpath=//div[@formgroupname='customerProfile']/div[4]/div/div/div[1]
    Click Element    xpath=//div[@formgroupname='customerProfile']/div[5]/div/div/div[2]
    Comment    Click Element    xpath=//div[@class='custom-btn-relate item-btn w-100']
    Comment    Input Text    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    พีเจเพลส
    Comment    Press Key    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[1]
    Comment    Click Button    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Input Text    css=input[formcontrolname='phone']    ${phone}
    Input Text    xpath=(//input[@formcontrolname='mobile'])[1]    ${mobile}
    Input Text    xpath=(//input[@formcontrolname='email'])[1]    ${email}
    Click Element    xpath=//div[@class='custom-btn-relate item-btn w-100 ng-star-inserted']
    Click Element    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \\13
    Input Text    xpath=//input[@class='form-control ng-untouched ng-pristine ng-valid']    ฉัตรณรงค์
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][2]/div/div/p/span[1]
    Click Element    xpath=//span[@formcontrolname='sourceOfLead']
    Input Text    css=.e-input-filter    ${sourceOfLead}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][4]/div/div/p/span[1]
    Click Element    xpath=//span[@formcontrolname='customerGroupId']
    Input Text    css=.e-input-filter    ${customerGroupId}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='e-multi-select-wrapper']
    Input Text    xpath=//input[@formcontrolname='customerOwnersStr']    ${customerOwnersStr}
    Press Key    xpath=//input[@formcontrolname='customerOwnersStr']    \\13
    Input Text    xpath=//div[@class='content-section'][5]/div[1]/div/textarea    ${textarea}
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='content-section'][5]/div[2]/div/div/div[1]/ejs-radiobutton
    Click Button    css=button[type='submit']
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[2]/div[2]/div/div/ul/li[2]
    Wait Until Element Is Visible    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input
    Input Text    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input    ${customerCode}
    Wait Until Element Is Visible    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Click Element    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Wait Until Element Is Visible    css=i[class='icon-Edit']
    Click Element    css=i[class='icon-Edit']
    Close Browser

5.Add Customer Business
    Login Staff
    Wait Until Element Is Visible    xpath=//i[@class='icon-Menu-Customer-centric-white font32']
    Click Element    xpath=//i[@class='icon-Menu-Customer-centric-white font32']
    Wait Until Element Is Visible    css=div.customer-page div.custom-scrollbar button
    Click Element    css=div.customer-page div.custom-scrollbar button
    Wait Until Element Is Visible    xpath=//div[@class='row customer-type']/div[3]
    Click Element    xpath=//div[@class='row customer-type']/div[3]
    Click Element    xpath=//div[@class='row customer-type type']/div[1]
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${customerCode}    Set Variable    A_C-Bu-${date}-WEB
    ${customerName}    Set Variable    A_Nam-Cus-Bus-${date}-WEB
    ${secondaryName}    Set Variable    A_Nam-AI-Test-${date}-WEB
    ${item}    Set Variable    A_Nam-AI-Test-${date}-WEB
    ${contactname}    Set Variable    A_Con-Cus-Bus-${date}-WEB
    ${customerGroupId}    Set Variable    star
    ${classification}    Set Variable    A
    ${sourceOfLead}    Set Variable    facebook
    ${tag}    Set Variable    Venio
    ${customerOwnersStr}    Set Variable    นันทภัทร
    ${phone}    Set Variable    0811111111
    ${mobile}    Set Variable    0822222222
    ${email}    Set Variable    Cus@business.com
    ${textarea}    Set Variable    A_Nam-AI-Test-${date}-WEB
    Input Text    css=input[formcontrolname='customerCode']    ${customerCode}
    Input Text    css=input[formcontrolname='customerName']    ${customerName}
    Input Text    css=input[formcontrolname="secondaryName"]    ${secondaryName}
    Input Text    css=input[formcontrolname='item']    ${item}
    Press Key    css=input[formcontrolname='item']    \\13
    Check Close Dialog Content
    Input Text    css=input[formcontrolname='contactName']    ${contactname}
    Input Text    xpath=(//input[@formcontrolname='mobile'])[1]    ${mobile}
    Input Text    xpath=(//input[@formcontrolname='email'])[1]    ${email}
    Comment    Click Element    xpath=//div[@class='custom-btn-relate item-btn w-100']
    Comment    Input Text    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    พีเจเพลส
    Comment    Press Key    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[1]
    Comment    Click Button    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Input Text    css=input[formcontrolname='phone']    ${phone}
    Input Text    xpath=(//input[@formcontrolname='mobile'])[2]    ${mobile}
    Input Text    xpath=(//input[@formcontrolname='email'])[2]    ${email}
    Click Element    xpath=//div[@class='custom-btn-relate item-btn w-100 ng-star-inserted']
    Click Element    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \\13
    Input Text    xpath=//input[@class='form-control ng-untouched ng-pristine ng-valid']    ฉัตรณรงค์
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][2]/div/div/p/span[1]
    Click Element    xpath=//span[@formcontrolname='sourceOfLead']
    Input Text    css=.e-input-filter    ${sourceOfLead}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][4]/div/div/p/span[1]
    Click Element    xpath=//span[@formcontrolname='customerGroupId']
    Input Text    css=.e-input-filter    ${customerGroupId}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='e-multi-select-wrapper']
    Input Text    xpath=//input[@formcontrolname='customerOwnersStr']    ${customerOwnersStr}
    Press Key    xpath=//input[@formcontrolname='customerOwnersStr']    \\13
    Input Text    xpath=//div[@class='content-section'][5]/div[1]/div/textarea    ${textarea}
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='content-section'][5]/div[2]/div/div/div[1]/ejs-radiobutton
    Click Button    css=button[type='submit']
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[2]/div[2]/div/div/ul/li[2]
    Wait Until Element Is Visible    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input
    Input Text    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input    ${customerCode}
    Wait Until Element Is Visible    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Click Element    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Wait Until Element Is Visible    css=i[class='icon-Edit']
    Click Element    css=i[class='icon-Edit']
    Close Browser

6.Add Customer Individual
    Login Staff
    Wait Until Element Is Visible    xpath=//i[@class='icon-Menu-Customer-centric-white font32']
    Click Element    xpath=//i[@class='icon-Menu-Customer-centric-white font32']
    Wait Until Element Is Visible    css=div.customer-page div.custom-scrollbar button
    Click Element    css=div.customer-page div.custom-scrollbar button
    Wait Until Element Is Visible    xpath=//div[@class='row customer-type']/div[3]
    Click Element    xpath=//div[@class='row customer-type']/div[3]
    Click Element    xpath=//div[@class='row customer-type type']/div[2]
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${customerCode}    Set Variable    A_C-In-${date}-WEB
    ${customerName}    Set Variable    A_Nam-Cus-Indi-${date}-WEB
    ${secondaryName}    Set Variable    A_Nam-AI-Test-${date}-WEB
    ${item}    Set Variable    A_Nam-AI-Test-${date}-WEB
    ${contactname}    Set Variable    A_Con-Cus-Indi-${date}-WEB
    ${customerGroupId}    Set Variable    star
    ${classification}    Set Variable    A
    ${sourceOfLead}    Set Variable    facebook
    ${tag}    Set Variable    Venio
    ${customerOwnersStr}    Set Variable    นันทภัทร
    ${phone}    Set Variable    0811111111
    ${mobile}    Set Variable    0822222222
    ${email}    Set Variable    Cus@Individual.com
    ${textarea}    Set Variable    A_Nam-AI-Test-${date}-WEB
    Input Text    css=input[formcontrolname='customerCode']    ${customerCode}
    Input Text    css=input[formcontrolname='customerName']    ${customerName}
    Input Text    css=input[formcontrolname="secondaryName"]    ${secondaryName}
    Input Text    css=input[formcontrolname='item']    ${item}
    Press Key    css=input[formcontrolname='item']    \\13    #\\13 == ${\n}
    Check Close Dialog Content
    Comment    Input Text    css=input[formcontrolname='contactName']    ${contactname}
    Comment    Input Text    xpath=(//input[@formcontrolname='mobile'])[1]    ${mobile}
    Comment    Input Text    xpath=(//input[@formcontrolname='email'])[1]    ${email}
    Input Text    css=input[formcontrolname="position"]    IT-Deverlopment
    Click Element    css=input[formcontrolname="dateOfBirth"]
    Wait Until Element Is Visible    xpath=(//button[@class='owl-dt-control-button owl-dt-control-arrow-button'])[1]
    Click Element    xpath=(//button[@class='owl-dt-control-button owl-dt-control-arrow-button'])[1]
    Click Element    xpath=//td[@aria-label='1999']
    Click Element    xpath=//td[@aria-label='May 1999']
    Click Element    xpath=//td[@aria-label='May 6, 1999']
    Click Element    xpath=//div[@formgroupname='customerProfile']/div[3]/div/div/div[1]
    Click Element    xpath=//div[@formgroupname='customerProfile']/div[4]/div/div/div[1]
    Click Element    xpath=//div[@formgroupname='customerProfile']/div[5]/div/div/div[2]
    Comment    Click Element    xpath=//div[@class='custom-btn-relate item-btn w-100']
    Comment    Input Text    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    พีเจเพลส
    Comment    Press Key    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[1]
    Comment    Click Button    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Input Text    css=input[formcontrolname='phone']    ${phone}
    Input Text    xpath=(//input[@formcontrolname='mobile'])[1]    ${mobile}
    Input Text    xpath=(//input[@formcontrolname='email'])[1]    ${email}
    Click Element    xpath=//div[@class='custom-btn-relate item-btn w-100 ng-star-inserted']
    Click Element    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \\13
    Input Text    xpath=//input[@class='form-control ng-untouched ng-pristine ng-valid']    ฉัตรณรงค์
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][2]/div/div/p/span[1]
    Click Element    xpath=//span[@formcontrolname='sourceOfLead']
    Input Text    css=.e-input-filter    ${sourceOfLead}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][4]/div/div/p/span[1]
    Click Element    xpath=//span[@formcontrolname='customerGroupId']
    Input Text    css=.e-input-filter    ${customerGroupId}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='e-multi-select-wrapper']
    Input Text    xpath=//input[@formcontrolname='customerOwnersStr']    ${customerOwnersStr}
    Press Key    xpath=//input[@formcontrolname='customerOwnersStr']    \\13
    Input Text    xpath=//div[@class='content-section'][5]/div[1]/div/textarea    ${textarea}
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='content-section'][5]/div[2]/div/div/div[1]/ejs-radiobutton
    Click Button    css=button[type='submit']
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[2]/div[2]/div/div/ul/li[2]
    Wait Until Element Is Visible    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input
    Input Text    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input    ${customerCode}
    Wait Until Element Is Visible    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Click Element    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Wait Until Element Is Visible    css=i[class='icon-Edit']
    Click Element    css=i[class='icon-Edit']
    Close Browser

7.Edit Lead Individual
    Login Staff
    Wait Until Element Is Visible    css=i[class='icon-Menu-Customer-centric-white font32']
    Click Element    css=i[class='icon-Menu-Customer-centric-white font32']
    Wait Until Element Is Visible    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[1]/div[2]/div/div/ul/li[1]
    Click Element    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[1]/div[2]/div/div/ul/li[1]
    Wait Until Element Is Visible    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input
    Input Text    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input    A_Nam-Lead-Indi-
    Wait Until Element Is Visible    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Click Element    xpath=//tr[@class='tr-cursor tr-thead']/th[1]
    Click Element    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Wait Until Element Is Visible    css=i[class='icon-Edit']
    Click Element    css=i[class='icon-Edit']
    Check Close Dialog Content
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${customerCode}    Set Variable    E_L-In-${date}-WEB
    ${customerName}    Set Variable    E_Nam-Lead-Indi-${date}-WEB
    ${secondaryName}    Set Variable    E_Nam-AI-Test-${date}-WEB
    ${item}    Set Variable    E_Nam-AI-Test-${date}-WEB
    ${contactname}    Set Variable    E_Con-Lead-Indi-${date}-WEB
    ${customerGroupId}    Set Variable    Diamond
    ${classification}    Set Variable    C
    ${sourceOfLead}    Set Variable    Event
    ${tag}    Set Variable    V-Visit
    ${customerOwnersStr}    Set Variable    ลลิษา
    ${phone}    Set Variable    0888888888
    ${mobile}    Set Variable    0999999999
    ${email}    Set Variable    Edit_Lead@Individual.com
    ${textarea}    Set Variable    E_Nam-AI-Test-${date}-WEB
    Wait Until Element Is Visible    xpath=//div[@class='row customer-type']/div[2]
    Click Element    xpath=//div[@class='row customer-type']/div[2]
    Click Element    xpath=//div[@class='row customer-type type']/div[1]
    Wait Until Element Is Visible    css=input[formcontrolname='customerCode']
    Input Text    css=input[formcontrolname='customerCode']    ${customerCode}
    Input Text    css=input[formcontrolname='customerName']    ${customerName}
    Input Text    css=input[formcontrolname="secondaryName"]    ${secondaryName}
    Comment    Wait Until Element Is Visible    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag[1]/div/div/delete-icon/span
    Comment    Click Element    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag[1]/div/div/delete-icon/span
    Input Text    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag-input-form/form/input    ${item}
    Press Key    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag-input-form/form/input    \\13
    Input Text    xpath=(//input[@formcontrolname='contactName'])[3]    ${contactname}
    Input Text    xpath=(//input[@formcontrolname='mobile'])[3]    ${mobile}
    Input Text    xpath=(//input[@formcontrolname='email'])[3]    ${email}
    Comment    Click Element    xpath=//div[@class='custom-btn-relate item-btn w-100']
    Comment    Input Text    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    วัดไร่ขิง
    Comment    Press Key    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[2]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Comment    Click Element    xpath=//i[@class='fa fa-chevron-right align-self-center']
    Comment    Wait Until Element Is Visible    xpath=(//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/p)[3]
    Comment    Click Element    xpath=(//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/p)[3]
    Comment    Input Text    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ม.เกษตรกำแพงแสน
    Comment    Press Key    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Input Text    xpath=(//input[@formcontrolname='phone'])[3]    ${phone}
    Input Text    xpath=(//input[@formcontrolname='mobile'])[4]    ${mobile}
    Input Text    xpath=(//input[@formcontrolname='email'])[4]    ${email}
    Click Element    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \\13
    Input Text    xpath=//input[@class='form-control ng-untouched ng-pristine ng-valid']    Chatnarong
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][2]/div/div/p/span[1]
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][2]/div/div/p/span[2]
    Click Element    xpath=//span[@formcontrolname='sourceOfLead']
    Input Text    css=.e-input-filter    ${sourceOfLead}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][4]/div/div/p/span[2]
    Click Element    xpath=//span[@formcontrolname='customerGroupId']
    Input Text    css=.e-input-filter    ${customerGroupId}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='e-multi-select-wrapper']
    Input Text    xpath=//input[@formcontrolname='customerOwnersStr']    ${customerOwnersStr}
    Press Key    xpath=//input[@formcontrolname='customerOwnersStr']    \\13
    Input Text    xpath=//div[@class='content-section'][4]/div[1]/div/textarea    ${textarea}
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='content-section'][4]/div[2]/div/div/div[1]/ejs-radiobutton
    Click Button    xpath=(//button[@class='float-right sb-btn-submit e-control e-btn e-lib e-primary'])[3]
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Wait Until Element Is Visible    css=i[class='icon-Edit']
    Click Element    css=i[class='icon-Edit']
    Close Browser

8.Edit Lead Business
    Login Staff
    Wait Until Element Is Visible    css=i[class='icon-Menu-Customer-centric-white font32']
    Click Element    css=i[class='icon-Menu-Customer-centric-white font32']
    Wait Until Element Is Visible    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[1]/div[2]/div/div/ul/li[1]
    Click Element    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[1]/div[2]/div/div/ul/li[1]
    Wait Until Element Is Visible    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input
    Input Text    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input    A_Nam-Lead-Bus-
    Wait Until Element Is Visible    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Click Element    xpath=//tr[@class='tr-cursor tr-thead']/th[1]
    Click Element    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Wait Until Element Is Visible    css=i[class='icon-Edit']
    Click Element    css=i[class='icon-Edit']
    Check Close Dialog Content
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${customerCode}    Set Variable    E_L-Bu-${date}-WEB
    ${customerName}    Set Variable    E_Nam-Lead-Bus-${date}-WEB
    ${secondaryName}    Set Variable    E_Nam-AI-Test-${date}-WEB
    ${item}    Set Variable    E_Nam-AI-Test-${date}-WEB
    ${contactname}    Set Variable    E_Con-Lead-Bus-${date}-WEB
    ${customerGroupId}    Set Variable    Diamond
    ${classification}    Set Variable    C
    ${sourceOfLead}    Set Variable    Event
    ${tag}    Set Variable    V-Visit
    ${customerOwnersStr}    Set Variable    ลลิษา
    ${phone}    Set Variable    0888888888
    ${mobile}    Set Variable    0999999999
    ${email}    Set Variable    Edit_Lead@business.com
    ${textarea}    Set Variable    E_Nam-AI-Test-${date}-WEB
    Wait Until Element Is Visible    xpath=//div[@class='row customer-type']/div[2]
    Click Element    xpath=//div[@class='row customer-type']/div[2]
    Click Element    xpath=//div[@class='row customer-type type']/div[2]
    Wait Until Element Is Visible    css=input[formcontrolname='customerCode']
    Input Text    css=input[formcontrolname='customerCode']    ${customerCode}
    Input Text    css=input[formcontrolname='customerName']    ${customerName}
    Input Text    css=input[formcontrolname="secondaryName"]    ${secondaryName}
    Comment    Wait Until Element Is Visible    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag[1]/div/div/delete-icon/span
    Comment    Click Element    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag[1]/div/div/delete-icon/span
    Input Text    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag-input-form/form/input    ${item}
    Press Key    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag-input-form/form/input    \\13    #\\13 == ${\n}
    Comment    Input Text    xpath=(//input[@formcontrolname='contactName'])[3]    ${contactname}
    Comment    Input Text    xpath=(//input[@formcontrolname='mobile'])[3]    ${mobile}
    Comment    Input Text    xpath=(//input[@formcontrolname='email'])[3]    ${email}
    Input Text    xpath=(//input[@formcontrolname='position'])[3]    E_IT-Deverlopment
    Click Element    css=input[formcontrolname='dateOfBirth']
    Wait Until Element Is Visible    xpath=(//button[@class='owl-dt-control-button owl-dt-control-arrow-button'])[1]
    Click Element    xpath=(//button[@class='owl-dt-control-button owl-dt-control-arrow-button'])[1]
    Click Element    xpath=//td[@aria-label='1998']
    Click Element    xpath=//td[@aria-label='January 1998']
    Click Element    xpath=//td[@aria-label='January 6, 1998']
    Click Element    xpath=//div[@formgroupname='customerProfile']/div[3]/div/div/div[2]
    Click Element    xpath=//div[@formgroupname='customerProfile']/div[4]/div/div/div[2]
    Click Element    xpath=//div[@formgroupname='customerProfile']/div[5]/div/div/div[3]
    Comment    Click Element    xpath=(//div[@class='custom-btn-relate item-btn w-100'])[1]
    Comment    Input Text    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    วัดไร่ขิง
    Comment    Press Key    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[2]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Comment    Click Element    xpath=//i[@class='fa fa-chevron-right align-self-center']
    Comment    Wait Until Element Is Visible    xpath=(//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/p)[3]
    Comment    Click Element    xpath=(//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/p)[3]
    Comment    Input Text    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ม.เกษตรกำแพงแสน
    Comment    Press Key    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Input Text    xpath=(//input[@formcontrolname='phone'])[3]    ${phone}
    Input Text    xpath=(//input[@formcontrolname='mobile'])[3]    ${mobile}
    Input Text    xpath=(//input[@formcontrolname='email'])[3]    ${email}
    Click Element    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \\13
    Input Text    xpath=//input[@class='form-control ng-untouched ng-pristine ng-valid']    Chatnarong
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][2]/div/div/p/span[1]
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][2]/div/div/p/span[2]
    Click Element    xpath=//span[@formcontrolname='sourceOfLead']
    Input Text    css=.e-input-filter    ${sourceOfLead}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][4]/div/div/p/span[2]
    Click Element    xpath=//span[@formcontrolname='customerGroupId']
    Input Text    css=.e-input-filter    ${customerGroupId}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='e-multi-select-wrapper']
    Input Text    xpath=//input[@formcontrolname='customerOwnersStr']    ${customerOwnersStr}
    Press Key    xpath=//input[@formcontrolname='customerOwnersStr']    \\13
    Input Text    xpath=//div[@class='content-section'][4]/div[1]/div/textarea    ${textarea}
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='content-section'][4]/div[2]/div/div/div[1]/ejs-radiobutton
    Click Button    xpath=(//button[@class='float-right sb-btn-submit e-control e-btn e-lib e-primary'])[3]
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Wait Until Element Is Visible    css=i[class='icon-Edit']
    Click Element    css=i[class='icon-Edit']
    Close Browser

9.Edit Prospect Individual
    Login Staff
    Wait Until Element Is Visible    css=i[class='icon-Menu-Customer-centric-white font32']
    Click Element    css=i[class='icon-Menu-Customer-centric-white font32']
    Wait Until Element Is Visible    xpath=(//div[@class='e-tab-wrap'])[2]
    Click Element    xpath=(//div[@class='e-tab-wrap'])[2]
    Wait Until Element Is Visible    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[2]/div[2]/div/div/ul/li[1]
    Click Element    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[2]/div[2]/div/div/ul/li[1]
    Wait Until Element Is Visible    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input
    Input Text    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input    A_Nam-Pros-Indi-
    Wait Until Element Is Visible    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Click Element    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Wait Until Element Is Visible    css=i[class='icon-Edit']
    Click Element    css=i[class='icon-Edit']
    Check Close Dialog Content
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${customerCode}    Set Variable    E_P-In-${date}-WEB
    ${customerName}    Set Variable    E_Nam-Pros-Indi-${date}-WEB
    ${secondaryName}    Set Variable    E_Nam-AI-Test-${date}-WEB
    ${item}    Set Variable    E_Nam-AI-Test-${date}-WEB
    ${contactname}    Set Variable    E_Con-Pros-Indi-${date}-WEB
    ${customerGroupId}    Set Variable    Diamond
    ${classification}    Set Variable    C
    ${sourceOfLead}    Set Variable    Event
    ${tag}    Set Variable    V-Visit
    ${customerOwnersStr}    Set Variable    ลลิษา
    ${phone}    Set Variable    0888888888
    ${mobile}    Set Variable    0999999999
    ${email}    Set Variable    Edit_Pros@Individual.com
    ${textarea}    Set Variable    E_Nam-AI-Test-${date}-WEB
    Wait Until Element Is Visible    xpath=//div[@class='row customer-type']/div[3]
    Click Element    xpath=//div[@class='row customer-type']/div[3]
    Click Element    xpath=//div[@class='row customer-type type']/div[1]
    Wait Until Element Is Visible    css=input[formcontrolname='customerCode']
    Input Text    css=input[formcontrolname='customerCode']    ${customerCode}
    Input Text    css=input[formcontrolname='customerName']    ${customerName}
    Input Text    css=input[formcontrolname="secondaryName"]    ${secondaryName}
    Comment    Wait Until Element Is Visible    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag[1]/div/div/delete-icon/span
    Comment    Click Element    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag[1]/div/div/delete-icon/span
    Input Text    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag-input-form/form/input    ${item}
    Press Key    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag-input-form/form/input    \\13
    Input Text    xpath=(//input[@formcontrolname='contactName'])[3]    ${contactname}
    Input Text    xpath=(//input[@formcontrolname='mobile'])[3]    ${mobile}
    Input Text    xpath=(//input[@formcontrolname='email'])[3]    ${email}
    Comment    Click Element    xpath=//div[@class='custom-btn-relate item-btn w-100']
    Comment    Input Text    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    วัดไร่ขิง
    Comment    Press Key    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[2]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Comment    Click Element    xpath=//i[@class='fa fa-chevron-right align-self-center']
    Comment    Wait Until Element Is Visible    xpath=(//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/p)[3]
    Comment    Click Element    xpath=(//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/p)[3]
    Comment    Input Text    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ม.เกษตรกำแพงแสน
    Comment    Press Key    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Input Text    xpath=(//input[@formcontrolname='phone'])[3]    ${phone}
    Input Text    xpath=(//input[@formcontrolname='mobile'])[4]    ${mobile}
    Input Text    xpath=(//input[@formcontrolname='email'])[4]    ${email}
    Click Element    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \\13
    Input Text    xpath=//input[@class='form-control ng-untouched ng-pristine ng-valid']    Chatnarong
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][2]/div/div/p/span[1]
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][2]/div/div/p/span[2]
    Click Element    xpath=//span[@formcontrolname='sourceOfLead']
    Input Text    css=.e-input-filter    ${sourceOfLead}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][4]/div/div/p/span[2]
    Click Element    xpath=//span[@formcontrolname='customerGroupId']
    Input Text    css=.e-input-filter    ${customerGroupId}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='e-multi-select-wrapper']
    Input Text    xpath=//input[@formcontrolname='customerOwnersStr']    ${customerOwnersStr}
    Press Key    xpath=//input[@formcontrolname='customerOwnersStr']    \\13
    Input Text    xpath=//div[@class='content-section'][4]/div[1]/div/textarea    ${textarea}
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='content-section'][4]/div[2]/div/div/div[1]/ejs-radiobutton
    Click Button    xpath=(//button[@class='float-right sb-btn-submit e-control e-btn e-lib e-primary'])[3]
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Wait Until Element Is Visible    css=i[class='icon-Edit']
    Click Element    css=i[class='icon-Edit']
    Close Browser

10.Edit Prospect Business
    Login Staff
    Wait Until Element Is Visible    css=i[class='icon-Menu-Customer-centric-white font32']
    Click Element    css=i[class='icon-Menu-Customer-centric-white font32']
    Wait Until Element Is Visible    xpath=(//div[@class='e-tab-wrap'])[2]
    Click Element    xpath=(//div[@class='e-tab-wrap'])[2]
    Wait Until Element Is Visible    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[2]/div[2]/div/div/ul/li[1]
    Click Element    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[2]/div[2]/div/div/ul/li[1]
    Wait Until Element Is Visible    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input
    Input Text    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input    A_Nam-Pros-Bus-
    Wait Until Element Is Visible    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Click Element    xpath=//tr[@class='tr-cursor tr-thead']/th[1]
    Click Element    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Wait Until Element Is Visible    css=i[class='icon-Edit']
    Click Element    css=i[class='icon-Edit']
    Check Close Dialog Content
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${customerCode}    Set Variable    E_P-Bu-${date}-WEB
    ${customerName}    Set Variable    E_Nam-Pros-Bus-${date}-WEB
    ${secondaryName}    Set Variable    Nam-AI-Test-${date}-WEB
    ${item}    Set Variable    E_Nam-AI-Test-${date}-WEB
    ${contactname}    Set Variable    E_Con-Pros-Bus-${date}-WEB
    ${customerGroupId}    Set Variable    Diamond
    ${classification}    Set Variable    C
    ${sourceOfLead}    Set Variable    Event
    ${tag}    Set Variable    V-Visit
    ${customerOwnersStr}    Set Variable    ลลิษา
    ${phone}    Set Variable    0888888888
    ${mobile}    Set Variable    0999999999
    ${email}    Set Variable    Edit_Pros@business.com
    ${textarea}    Set Variable    E_Nam-AI-Test-${date}-WEB
    Wait Until Element Is Visible    xpath=//div[@class='row customer-type']/div[3]
    Click Element    xpath=//div[@class='row customer-type']/div[3]
    Click Element    xpath=//div[@class='row customer-type type']/div[2]
    Wait Until Element Is Visible    css=input[formcontrolname='customerCode']
    Input Text    css=input[formcontrolname='customerCode']    ${customerCode}
    Input Text    css=input[formcontrolname='customerName']    ${customerName}
    Input Text    css=input[formcontrolname="secondaryName"]    ${secondaryName}
    Comment    Wait Until Element Is Visible    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag[1]/div/div/delete-icon/span
    Comment    Click Element    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag[1]/div/div/delete-icon/span
    Input Text    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag-input-form/form/input    ${item}
    Press Key    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag-input-form/form/input    \\13    #\\13 == ${\n}
    Comment    Input Text    xpath=(//input[@formcontrolname='contactName'])[3]    ${contactname}
    Comment    Input Text    xpath=(//input[@formcontrolname='mobile'])[3]    ${mobile}
    Comment    Input Text    xpath=(//input[@formcontrolname='email'])[3]    ${email}
    Input Text    xpath=(//input[@formcontrolname='position'])[3]    E_IT-Deverlopment
    Click Element    css=input[formcontrolname='dateOfBirth']
    Wait Until Element Is Visible    xpath=(//button[@class='owl-dt-control-button owl-dt-control-arrow-button'])[1]
    Click Element    xpath=(//button[@class='owl-dt-control-button owl-dt-control-arrow-button'])[1]
    Click Element    xpath=//td[@aria-label='1998']
    Click Element    xpath=//td[@aria-label='January 1998']
    Click Element    xpath=//td[@aria-label='January 6, 1998']
    Click Element    xpath=//div[@formgroupname='customerProfile']/div[3]/div/div/div[2]
    Click Element    xpath=//div[@formgroupname='customerProfile']/div[4]/div/div/div[2]
    Click Element    xpath=//div[@formgroupname='customerProfile']/div[5]/div/div/div[3]
    Comment    Click Element    xpath=(//div[@class='custom-btn-relate item-btn w-100'])[1]
    Comment    Input Text    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    วัดไร่ขิง
    Comment    Press Key    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[2]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Comment    Click Element    xpath=//i[@class='fa fa-chevron-right align-self-center']
    Comment    Wait Until Element Is Visible    xpath=(//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/p)[3]
    Comment    Click Element    xpath=(//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/p)[3]
    Comment    Input Text    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ม.เกษตรกำแพงแสน
    Comment    Press Key    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Input Text    xpath=(//input[@formcontrolname='phone'])[3]    ${phone}
    Input Text    xpath=(//input[@formcontrolname='mobile'])[3]    ${mobile}
    Input Text    xpath=(//input[@formcontrolname='email'])[3]    ${email}
    Click Element    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \\13
    Input Text    xpath=//input[@class='form-control ng-untouched ng-pristine ng-valid']    Chatnarong
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][2]/div/div/p/span[1]
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][2]/div/div/p/span[2]
    Click Element    xpath=//span[@formcontrolname='sourceOfLead']
    Input Text    css=.e-input-filter    ${sourceOfLead}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][4]/div/div/p/span[2]
    Click Element    xpath=//span[@formcontrolname='customerGroupId']
    Input Text    css=.e-input-filter    ${customerGroupId}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='e-multi-select-wrapper']
    Input Text    xpath=//input[@formcontrolname='customerOwnersStr']    ${customerOwnersStr}
    Press Key    xpath=//input[@formcontrolname='customerOwnersStr']    \\13
    Input Text    xpath=//div[@class='content-section'][4]/div[1]/div/textarea    ${textarea}
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='content-section'][4]/div[2]/div/div/div[1]/ejs-radiobutton
    Click Button    xpath=(//button[@class='float-right sb-btn-submit e-control e-btn e-lib e-primary'])[3]
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Wait Until Element Is Visible    css=i[class='icon-Edit']
    Click Element    css=i[class='icon-Edit']
    Close Browser

11.Edit Customer Individual
    Login Staff
    Wait Until Element Is Visible    css=i[class='icon-Menu-Customer-centric-white font32']
    Click Element    css=i[class='icon-Menu-Customer-centric-white font32']
    Wait Until Element Is Visible    xpath=(//div[@class='e-tab-wrap'])[3]
    Click Element    xpath=(//div[@class='e-tab-wrap'])[3]
    Wait Until Element Is Visible    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[3]/div[2]/div/div/ul/li[1]
    Click Element    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[3]/div[2]/div/div/ul/li[1]
    Wait Until Element Is Visible    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input
    Input Text    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input    A_Nam-Cus-Indi-
    Wait Until Element Is Visible    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Click Element    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Wait Until Element Is Visible    css=i[class='icon-Edit']
    Click Element    css=i[class='icon-Edit']
    Check Close Dialog Content
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${customerCode}    Set Variable    E_C-In-${date}-WEB
    ${customerName}    Set Variable    E_Nam-Cus-Indi-${date}-WEB
    ${secondaryName}    Set Variable    E_Nam-AI-Test-${date}-WEB
    ${item}    Set Variable    E_Nam-AI-Test-${date}-WEB
    ${contactname}    Set Variable    E_Con-Cus-Indi-${date}-WEB
    ${customerGroupId}    Set Variable    Diamond
    ${classification}    Set Variable    C
    ${sourceOfLead}    Set Variable    Event
    ${tag}    Set Variable    V-Visit
    ${customerOwnersStr}    Set Variable    ลลิษา
    ${phone}    Set Variable    0888888888
    ${mobile}    Set Variable    0999999999
    ${email}    Set Variable    Edit_Cus@Individual.com
    ${textarea}    Set Variable    E_Nam-AI-Test-${date}-WEB
    Wait Until Element Is Visible    xpath=//div[@class='row customer-type']/div[1]
    Click Element    xpath=//div[@class='row customer-type']/div[1]
    Click Element    xpath=//div[@class='row customer-type type']/div[1]
    Wait Until Element Is Visible    css=input[formcontrolname='customerCode']
    Input Text    css=input[formcontrolname='customerCode']    ${customerCode}
    Input Text    css=input[formcontrolname='customerName']    ${customerName}
    Input Text    css=input[formcontrolname="secondaryName"]    ${secondaryName}
    Comment    Wait Until Element Is Visible    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag[1]/div/div/delete-icon/span
    Comment    Click Element    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag[1]/div/div/delete-icon/span
    Input Text    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag-input-form/form/input    ${item}
    Press Key    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag-input-form/form/input    \\13    #\\13 == ${\n}
    Input Text    xpath=(//input[@formcontrolname='contactName'])[3]    ${contactname}
    Input Text    xpath=(//input[@formcontrolname='mobile'])[3]    ${mobile}
    Input Text    xpath=(//input[@formcontrolname='email'])[3]    ${email}
    Comment    Click Element    xpath=//div[@class='custom-btn-relate item-btn w-100']
    Comment    Input Text    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    วัดไร่ขิง
    Comment    Press Key    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[2]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Comment    Click Element    xpath=//i[@class='fa fa-chevron-right align-self-center']
    Comment    Wait Until Element Is Visible    xpath=(//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/p)[3]
    Comment    Click Element    xpath=(//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/p)[3]
    Comment    Input Text    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ม.เกษตรกำแพงแสน
    Comment    Press Key    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Input Text    xpath=(//input[@formcontrolname='phone'])[3]    ${phone}
    Input Text    xpath=(//input[@formcontrolname='mobile'])[4]    ${mobile}
    Input Text    xpath=(//input[@formcontrolname='email'])[4]    ${email}
    Click Element    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \\13
    Input Text    xpath=//input[@class='form-control ng-untouched ng-pristine ng-valid']    Chatnarong
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][2]/div/div/p/span[1]
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][2]/div/div/p/span[2]
    Click Element    xpath=//span[@formcontrolname='sourceOfLead']
    Input Text    css=.e-input-filter    ${sourceOfLead}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][4]/div/div/p/span[2]
    Click Element    xpath=//span[@formcontrolname='customerGroupId']
    Input Text    css=.e-input-filter    ${customerGroupId}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='e-multi-select-wrapper']
    Input Text    xpath=//input[@formcontrolname='customerOwnersStr']    ${customerOwnersStr}
    Press Key    xpath=//input[@formcontrolname='customerOwnersStr']    \\13
    Input Text    xpath=//div[@class='content-section'][4]/div[1]/div/textarea    ${textarea}
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='content-section'][4]/div[2]/div/div/div[1]/ejs-radiobutton
    Click Button    xpath=(//button[@class='float-right sb-btn-submit e-control e-btn e-lib e-primary'])[3]
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Wait Until Element Is Visible    css=i[class='icon-Edit']
    Click Element    css=i[class='icon-Edit']
    Close Browser

12.Edit Customer Business
    Login Staff
    Wait Until Element Is Visible    css=i[class='icon-Menu-Customer-centric-white font32']
    Click Element    css=i[class='icon-Menu-Customer-centric-white font32']
    Wait Until Element Is Visible    xpath=(//div[@class='e-tab-wrap'])[3]
    Click Element    xpath=(//div[@class='e-tab-wrap'])[3]
    Wait Until Element Is Visible    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[2]/div[2]/div/div/ul/li[1]
    Click Element    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[2]/div[2]/div/div/ul/li[1]
    Wait Until Element Is Visible    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input
    Input Text    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input    A_Nam-Cus-Bus-
    Wait Until Element Is Visible    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Click Element    xpath=//tr[@class='tr-cursor tr-thead']/th[1]
    Click Element    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Wait Until Element Is Visible    css=i[class='icon-Edit']
    Click Element    css=i[class='icon-Edit']
    Check Close Dialog Content
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${customerCode}    Set Variable    E_C-Bu-${date}-WEB
    ${customerName}    Set Variable    E_Nam-Cus-Bus-${date}-WEB
    ${secondaryName}    Set Variable    E_Nam-AI-Test-${date}-WEB
    ${item}    Set Variable    E_Nam-AI-Test-${date}-WEB
    ${contactname}    Set Variable    E_Con-Cus-Bus-${date}-WEB
    ${customerGroupId}    Set Variable    Diamond
    ${classification}    Set Variable    C
    ${sourceOfLead}    Set Variable    Event
    ${tag}    Set Variable    V-Visit
    ${customerOwnersStr}    Set Variable    ลลิษา
    ${phone}    Set Variable    0888888888
    ${mobile}    Set Variable    0999999999
    ${email}    Set Variable    Edit_Cus@business.com
    ${textarea}    Set Variable    E_Nam-AI-Test-${date}-WEB
    Wait Until Element Is Visible    xpath=//div[@class='row customer-type']/div[1]
    Click Element    xpath=//div[@class='row customer-type']/div[1]
    Click Element    xpath=//div[@class='row customer-type type']/div[2]
    Wait Until Element Is Visible    css=input[formcontrolname='customerCode']
    Input Text    css=input[formcontrolname='customerCode']    ${customerCode}
    Input Text    css=input[formcontrolname='customerName']    ${customerName}
    Input Text    css=input[formcontrolname="secondaryName"]    ${secondaryName}
    Comment    Wait Until Element Is Visible    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag[1]/div/div/delete-icon/span
    Comment    Click Element    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag[1]/div/div/delete-icon/span
    Input Text    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag-input-form/form/input    ${item}
    Press Key    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag-input-form/form/input    \\13    #\\13 == ${\n}
    Comment    Input Text    xpath=(//input[@formcontrolname='contactName'])[3]    ${contactname}
    Comment    Input Text    xpath=(//input[@formcontrolname='mobile'])[3]    ${mobile}
    Comment    Input Text    xpath=(//input[@formcontrolname='email'])[3]    ${email}
    Input Text    xpath=(//input[@formcontrolname='position'])[3]    E_IT-Deverlopment
    Click Element    css=input[formcontrolname='dateOfBirth']
    Wait Until Element Is Visible    xpath=(//button[@class='owl-dt-control-button owl-dt-control-arrow-button'])[1]
    Click Element    xpath=(//button[@class='owl-dt-control-button owl-dt-control-arrow-button'])[1]
    Click Element    xpath=//td[@aria-label='1998']
    Click Element    xpath=//td[@aria-label='January 1998']
    Click Element    xpath=//td[@aria-label='January 6, 1998']
    Click Element    xpath=//div[@formgroupname='customerProfile']/div[3]/div/div/div[2]
    Click Element    xpath=//div[@formgroupname='customerProfile']/div[4]/div/div/div[2]
    Click Element    xpath=//div[@formgroupname='customerProfile']/div[5]/div/div/div[3]
    Comment    Click Element    xpath=(//div[@class='custom-btn-relate item-btn w-100'])[1]
    Comment    Input Text    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    วัดไร่ขิง
    Comment    Press Key    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[2]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Comment    Click Element    xpath=//i[@class='fa fa-chevron-right align-self-center']
    Comment    Wait Until Element Is Visible    xpath=(//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/p)[3]
    Comment    Click Element    xpath=(//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/p)[3]
    Comment    Input Text    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ม.เกษตรกำแพงแสน
    Comment    Press Key    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Input Text    xpath=(//input[@formcontrolname='phone'])[3]    ${phone}
    Input Text    xpath=(//input[@formcontrolname='mobile'])[3]    ${mobile}
    Input Text    xpath=(//input[@formcontrolname='email'])[3]    ${email}
    Click Element    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \\13
    Input Text    xpath=//input[@class='form-control ng-untouched ng-pristine ng-valid']    Chatnarong
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][2]/div/div/p/span[1]
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][2]/div/div/p/span[2]
    Click Element    xpath=//span[@formcontrolname='sourceOfLead']
    Input Text    css=.e-input-filter    ${sourceOfLead}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][4]/div/div/p/span[2]
    Click Element    xpath=//span[@formcontrolname='customerGroupId']
    Input Text    css=.e-input-filter    ${customerGroupId}
    Press Key    css=.e-input-filter    \\13
    Click Element    xpath=//div[@class='e-multi-select-wrapper']
    Input Text    xpath=//input[@formcontrolname='customerOwnersStr']    ${customerOwnersStr}
    Press Key    xpath=//input[@formcontrolname='customerOwnersStr']    \\13
    Input Text    xpath=//div[@class='content-section'][4]/div[1]/div/textarea    ${textarea}
    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='content-section'][4]/div[2]/div/div/div[1]/ejs-radiobutton
    Click Button    xpath=(//button[@class='float-right sb-btn-submit e-control e-btn e-lib e-primary'])[3]
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Wait Until Element Is Visible    css=i[class='icon-Edit']
    Click Element    css=i[class='icon-Edit']
    Close Browser

13.Add Conversation Call of Lead Business
    Login Staff
    Wait Until Element Is Visible    css=i[class='icon-Menu-Customer-centric-white font32']
    Click Element    css=i[class='icon-Menu-Customer-centric-white font32']
    Wait Until Element Is Visible    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[1]/div[2]/div/div/ul/li[1]
    Click Element    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[1]/div[2]/div/div/ul/li[1]
    Wait Until Element Is Visible    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input
    Input Text    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input    A_Nam-Lead-Bus-
    Wait Until Element Is Visible    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Click Element    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Wait Until Element Is Visible    xpath=(//div[@class='e-tab-wrap'])[4]
    Click Element    xpath=(//div[@class='e-tab-wrap'])[4]
    Check Close Dialog Content
    Click Element    xpath=//i[@class='icon-Create-Conversation']
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/div[2]/div[1]
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${datetime}    Get Current Date    result_format=datetime
    Click Element    xpath=(//span[@class='e-input-group-icon e-date-icon e-icons'])
    Click Element    xpath=//span[text()='${datetime.day-2}']
    Click Element    xpath=(//span[@class='e-input-group-icon e-time-icon e-icons'])[1]
    Click Element    xpath=//li[@class='e-list-item '][text()='1:00 AM']
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/div[4]/div/div[2]
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/div[5]/div/div[1]
    Input Text    xpath=//textarea[@name='Description']    A_Conver_Call-L-Bu-${date}-WEB
    Click Element    xpath=(//span[@class='e-input-group-icon e-date-icon e-icons'])[2]
    Click Element    xpath=//span[text()='${datetime.day+7}']
    Click Element    xpath=(//span[@class='e-input-group-icon e-time-icon e-icons'])[2]
    Click Element    xpath=//li[@class='e-list-item '][text()='5:00 AM']
    Click Button    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/button[@class='float-right sb-btn-submit e-control e-btn e-lib e-primary']
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Close Browser

14.Add Conversation Email of Lead Individual
    Login Staff
    Wait Until Element Is Visible    css=i[class='icon-Menu-Customer-centric-white font32']
    Click Element    css=i[class='icon-Menu-Customer-centric-white font32']
    Wait Until Element Is Visible    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[1]/div[2]/div/div/ul/li[1]
    Click Element    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[1]/div[2]/div/div/ul/li[1]
    Wait Until Element Is Visible    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input
    Input Text    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input    A_Nam-Lead-Indi-
    Wait Until Element Is Visible    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Click Element    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Wait Until Element Is Visible    xpath=(//div[@class='e-tab-wrap'])[4]
    Click Element    xpath=(//div[@class='e-tab-wrap'])[4]
    Check Close Dialog Content
    Click Element    xpath=//i[@class='icon-Create-Conversation']
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/div[2]/div[2]
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${datetime}    Get Current Date    result_format=datetime
    Click Element    xpath=//span[@class='e-input-group-icon e-date-icon e-icons']
    Click Element    xpath=//span[text()='${datetime.day-2}']
    Click Element    xpath=(//span[@class='e-input-group-icon e-time-icon e-icons'])[1]
    Click Element    xpath=//li[@class='e-list-item '][text()='1:00 AM']
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/div[4]/div/div[2]
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/div[5]/div/div[1]
    Input Text    xpath=//textarea[@name='Description']    A_Conver_Email-L-In-${date}-WEB
    Click Element    xpath=(//span[@class='e-input-group-icon e-date-icon e-icons'])[2]
    Click Element    xpath=//span[text()='${datetime.day+7}']
    Click Element    xpath=(//span[@class='e-input-group-icon e-time-icon e-icons'])[2]
    Click Element    xpath=//li[@class='e-list-item '][text()='5:00 AM']
    Click Button    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/button[@class='float-right sb-btn-submit e-control e-btn e-lib e-primary']
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Close Browser

15.Add Conversation Social of Prospect Business
    Login Staff
    Wait Until Element Is Visible    css=i[class='icon-Menu-Customer-centric-white font32']
    Click Element    css=i[class='icon-Menu-Customer-centric-white font32']
    Wait Until Element Is Visible    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[1]/div[2]/div/div/ul/li[1]
    Click Element    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[1]/div[2]/div/div/ul/li[1]
    Wait Until Element Is Visible    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input
    Input Text    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input    A_Nam-Pros-Bus-
    Wait Until Element Is Visible    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Click Element    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Wait Until Element Is Visible    xpath=(//div[@class='e-tab-wrap'])[4]
    Click Element    xpath=(//div[@class='e-tab-wrap'])[4]
    Check Close Dialog Content
    Click Element    xpath=//i[@class='icon-Create-Conversation']
    Wait Until Element Is Visible    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/div[2]/div[3]
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/div[2]/div[3]
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/div[3]/div/div[3]
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${datetime}    Get Current Date    result_format=datetime
    Click Element    xpath=(//span[@class='e-input-group-icon e-date-icon e-icons'])
    Click Element    xpath=//span[text()='${datetime.day-2}']
    Click Element    xpath=(//span[@class='e-input-group-icon e-time-icon e-icons'])[1]
    Click Element    xpath=//li[@class='e-list-item '][text()='1:00 AM']
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/div[5]/div/div[2]
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/div[6]/div/div[1]
    Input Text    xpath=//textarea[@name='Description']    A_Conver_Social-P-Bu-${date}-WEB
    Click Element    xpath=(//span[@class='e-input-group-icon e-date-icon e-icons'])[2]
    Click Element    xpath=//span[text()='${datetime.day+7}']
    Click Element    xpath=(//span[@class='e-input-group-icon e-time-icon e-icons'])[2]
    Click Element    xpath=//li[@class='e-list-item '][text()='5:00 AM']
    Click Button    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/button[@class='float-right sb-btn-submit e-control e-btn e-lib e-primary']
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Close Browser

16.Add Conversation Sms of Prospect Individual
    Login Staff
    Wait Until Element Is Visible    css=i[class='icon-Menu-Customer-centric-white font32']
    Click Element    css=i[class='icon-Menu-Customer-centric-white font32']
    Wait Until Element Is Visible    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[1]/div[2]/div/div/ul/li[1]
    Click Element    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[1]/div[2]/div/div/ul/li[1]
    Wait Until Element Is Visible    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input
    Input Text    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input    A_Nam-Pros-Indi-
    Wait Until Element Is Visible    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Click Element    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Wait Until Element Is Visible    xpath=(//div[@class='e-tab-wrap'])[4]
    Click Element    xpath=(//div[@class='e-tab-wrap'])[4]
    Check Close Dialog Content
    Click Element    xpath=//i[@class='icon-Create-Conversation']
    Wait Until Element Is Visible    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/div[2]/div[4]
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/div[2]/div[4]
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${datetime}    Get Current Date    result_format=datetime
    Click Element    xpath=(//span[@class='e-input-group-icon e-date-icon e-icons'])
    Click Element    xpath=//span[text()='${datetime.day-2}']
    Click Element    xpath=(//span[@class='e-input-group-icon e-time-icon e-icons'])[1]
    Click Element    xpath=//li[@class='e-list-item '][text()='1:00 AM']
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/div[4]/div/div[2]
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/div[5]/div/div[2]
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/div[6]/div/div[1]
    Input Text    xpath=//textarea[@name='Description']    A_Conver_Sms-P-Bu-${date}-WEB
    Click Element    xpath=(//span[@class='e-input-group-icon e-date-icon e-icons'])[2]
    Click Element    xpath=//span[text()='${datetime.day+7}']
    Click Element    xpath=(//span[@class='e-input-group-icon e-time-icon e-icons'])[2]
    Click Element    xpath=//li[@class='e-list-item '][text()='5:00 AM']
    Click Button    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/button[@class='float-right sb-btn-submit e-control e-btn e-lib e-primary']
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Close Browser

17.Add Conversation Other of Customer Business
    Login Staff
    Wait Until Element Is Visible    css=i[class='icon-Menu-Customer-centric-white font32']
    Click Element    css=i[class='icon-Menu-Customer-centric-white font32']
    Wait Until Element Is Visible    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[1]/div[2]/div/div/ul/li[1]
    Click Element    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[1]/div[2]/div/div/ul/li[1]
    Wait Until Element Is Visible    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input
    Input Text    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input    A_Nam-Lead-Bus-
    Wait Until Element Is Visible    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Click Element    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Wait Until Element Is Visible    xpath=(//div[@class='e-tab-wrap'])[4]
    Click Element    xpath=(//div[@class='e-tab-wrap'])[4]
    Check Close Dialog Content
    Click Element    xpath=//i[@class='icon-Create-Conversation']
    Wait Until Element Is Visible    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/div[2]/div[5]
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/div[2]/div[5]
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${datetime}    Get Current Date    result_format=datetime
    ${contactname}    Set Variable    A_Con-Cus-Bus-${date}-WEB
    ${note}    Set Variable    A_Nam-AI-Test-${date}-WEB
    ${position}    Set Variable    A_IT-Deverlopment
    ${email}    Set Variable    Lead@Individual.com
    ${phone}    Set Variable    0888888888
    ${mobile}    Set Variable    0999999999
    Click Element    xpath=(//span[@class='e-input-group-icon e-date-icon e-icons'])
    Click Element    xpath=//span[text()='${datetime.day-2}']
    Click Element    xpath=(//span[@class='e-input-group-icon e-time-icon e-icons'])[1]
    Click Element    xpath=//li[@class='e-list-item '][text()='1:00 AM']
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/div[4]/div/div[3]
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/div[5]/div/div[2]
    Input Text    xpath=//textarea[@name='Description']    A_Conver_Other-C-Bu-${date}-WEB
    Click Button    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/button[@class='float-right sb-btn-submit e-control e-btn e-lib e-primary']
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Wait Until Element Is Visible    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/form/div[1]/div[1]/div[1]/input
    Input Text    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/form/div[1]/div[1]/div[1]/input    A_Conver-other-lead && A_P-In-${date}
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/form/div[1]/div[2]/div[1]/ejs-dropdownlist/span
    Press Key    css=.e-input-filter    Sales
    Press Key    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/form/div[1]/div[2]/div[1]/ejs-dropdownlist/span    \\13
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/form/div[1]/div[3]/div/p/span[1]
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/form/div[1]/div[5]/div[1]/div
    Click Element    xpath=//div[@class='e-ddl-footer']
    Input Text    xpath=(//input[@formcontrolname='contactName'])[6]    ${contactname}
    Input Text    xpath=(//input[@formcontrolname='contactNameEn'])[3]    ${contactname}
    Input Text    xpath=(//input[@formcontrolname='position'])[3]    ${position}
    Click Element    xpath=(//input[@formcontrolname='birthDate'])[3]
    Wait Until Element Is Visible    xpath=(//button[@class='owl-dt-control-button owl-dt-control-arrow-button'])[1]
    Click Element    xpath=(//button[@class='owl-dt-control-button owl-dt-control-arrow-button'])[1]
    Click Element    xpath=//td[@aria-label='1999']
    Click Element    xpath=//td[@aria-label='May 1999']
    Click Element    xpath=//td[@aria-label='May 6, 1999']
    Input Text    xpath=(//input[@formcontrolname='email'])[9]    ${email}
    Input Text    xpath=(//input[@formcontrolname='phone'])[6]    ${phone}
    Input Text    xpath=(//input[@formcontrolname='mobile'])[9]    ${mobile}
    Input Text    xpath=(//textarea[@formcontrolname='notes'])[7]    ${note}
    Click Button    xpath=(//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/form/button[@type='submit'])[2]
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/form/div[1]/div[6]/div[1]/div
    Wait Until Element Is Visible    xpath=(//span[text()='${datetime.day+1}'])[1]
    Click Element    xpath=(//span[text()='${datetime.day+1}'])[1]
    Input Text    xpath=//owl-date-time-timer/owl-date-time-timer-box[1]/label/input    8
    Press Key    xpath=//owl-date-time-timer/owl-date-time-timer-box[1]/label/input    \\13
    Input Text    xpath=//owl-date-time-timer/owl-date-time-timer-box[2]/label/input    0
    Press Key    xpath=//owl-date-time-timer/owl-date-time-timer-box[2]/label/input    \\13
    Click Button    xpath=//button[@class='owl-dt-control owl-dt-control-button owl-dt-container-control-button'][1]
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/form/div[1]/div[6]/div[2]/div
    Click Element    xpath=(//span[text()='${datetime.day+2}'])[1]
    Input Text    xpath=//owl-date-time-timer/owl-date-time-timer-box[1]/label/input    8
    Press Key    xpath=//owl-date-time-timer/owl-date-time-timer-box[1]/label/input    \\13
    Input Text    xpath=//owl-date-time-timer/owl-date-time-timer-box[2]/label/input    0
    Press Key    xpath=//owl-date-time-timer/owl-date-time-timer-box[2]/label/input    \\13
    Click Button    xpath=//button[@class='owl-dt-control owl-dt-control-button owl-dt-container-control-button'][2]
    Input Text    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/form/div[2]/div/textarea    CP TEST Conversation other of lead && Add Plan -INDI-${date}
    Click Button    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/form/button[1]
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Close Browser

Add Expenses Link Activity
    Login Sups
    Wait Until Element Is Visible    xpath=//i[@class='icon-Menu-Expenses']
    Click Element    xpath=//i[@class='icon-Menu-Expenses']
    Wait Until Element Is Visible    xpath=//i[@class='v-icon-bg icon-Add']
    Click Element    xpath=//i[@class='v-icon-bg icon-Add']
    Wait Until Element Is Visible    xpath=//div[@class='custom-btn-relate']
    Click Element    xpath=//div[@class='custom-btn-relate']
    Wait Until Element Is Visible    xpath=//div[@class='listview-group control-section']/div[1]/ul
    Click Element    xpath=//div[@class='listview-group control-section']/div[1]/ul
    Click Element    xpath=//span[@class='cc-g0ak cc-hy0f']
    Wait Until Element Is Visible    xpath=//*[@id='page-content-wrapper']/app-expenses/app-expenses-add/app-link-activities/ejs-sidebar/div/div[2]/div[3]/button[1]
    Click Button    xpath=//*[@id='page-content-wrapper']/app-expenses/app-expenses-add/app-link-activities/ejs-sidebar/div/div[2]/div[3]/button[1]
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${description}    Set Variable    Detail-Expenses Link-${date}
    ${datetime}    Get Current Date    result_format=datetime
    Input Text    xpath=//textarea[@formcontrolname='remark']    ${description}
    Comment    Set Selenium Speed    0.1 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[1]
    Wait Until Element Is Visible    xpath=//input[@formcontrolname='milesStart']
    Input Text    xpath=//input[@formcontrolname='milesStart']    10
    Input Text    xpath=//input[@formcontrolname='milesEnd']    100
    Press Key    xpath=//input[@formcontrolname='milesEnd']    ${\n}
    Sleep    0.2 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[2]
    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='quantity'])[2]
    Input Text    xpath=(//input[@formcontrolname='quantity'])[2]    2
    Input Text    xpath=(//input[@formcontrolname='amount1'])[2]    1000
    Press Key    xpath=(//input[@formcontrolname='amount1'])[2]    ${\n}
    Sleep    0.2 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[3]
    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='amount1'])[3]
    Input Text    xpath=(//input[@formcontrolname='amount1'])[3]    300
    Input Text    xpath=//input[@formcontrolname='amount2']    200
    Input Text    xpath=//input[@formcontrolname='amount3']    100
    Press Key    xpath=//input[@formcontrolname='amount3']    ${\n}
    Sleep    0.2 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[4]
    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='quantity'])[3]
    Input Text    xpath=(//input[@formcontrolname='quantity'])[3]    15
    Input Text    xpath=(//input[@formcontrolname='amount1'])[4]    500
    Press Key    xpath=(//input[@formcontrolname='amount1'])[4]    ${\n}
    Sleep    0.2 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[5]
    Wait Until Element Is Visible    xpath=//input[@formcontrolname='title']
    Input Text    xpath=//input[@formcontrolname='title']    Test I ${date}
    Input Text    xpath=//input[@formcontrolname='hours']    5
    Input Text    xpath=//input[@formcontrolname='minutes']    10
    Input Text    xpath=(//input[@formcontrolname='quantity'])[4]    15
    Input Text    xpath=(//input[@formcontrolname='amount1'])[5]    1000
    Click Element    xpath=//i[@class='fa fa-plus-circle add-icon ng-star-inserted']
    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='title'])[2]
    Input Text    xpath=(//input[@formcontrolname='title'])[2]    Test II ${date}
    Input Text    xpath=(//input[@formcontrolname='hours'])[2]    10
    Input Text    xpath=(//input[@formcontrolname='minutes'])[2]    20
    Input Text    xpath=(//input[@formcontrolname='quantity'])[5]    30
    Input Text    xpath=(//input[@formcontrolname='amount1'])[6]    3000
    Click Button    xpath=//div[@class='e-acrdn-panel']/div/button
    Sleep    0.2 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[6]
    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='amount1'])[7]
    Input Text    xpath=(//input[@formcontrolname='amount1'])[7]    1000
    Press Key    xpath=(//input[@formcontrolname='amount1'])[7]    ${\n}
    Sleep    0.2 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[7]
    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='quantity'])[6]
    Input Text    xpath=(//input[@formcontrolname='quantity'])[6]    30
    Input Text    xpath=(//input[@formcontrolname='amount1'])[8]    2000
    Press Key    xpath=(//input[@formcontrolname='amount1'])[8]    ${\n}
    Sleep    0.2 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[8]
    Wait Until Element Is Visible    xpath=//input[@formcontrolname='note']
    Input Text    xpath=//input[@formcontrolname='note']    ค่าใช้จ่ายอื่นๆ 1
    Input Text    xpath=(//input[@formcontrolname='amount1'])[9]    1000
    Click Element    xpath=(//i[@class='fa fa-plus-circle add-icon ng-star-inserted'])[2]
    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='note'])[2]
    Input Text    xpath=(//input[@formcontrolname='note'])[2]    ค่าใช้จ่ายอื่นๆ 2
    Input Text    xpath=(//input[@formcontrolname='amount1'])[10]    500
    Click Button    xpath=//div[@class='e-acrdn-panel']/div/button
    Click Button    xpath=//*[@id="page-content-wrapper"]/app-expenses/app-expenses-add/ejs-sidebar/div/div[2]/div[3]/div/button[1]
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Wait Until Element Is Visible    xpath=//div[@class='content-detail no-padding-T']/p[2]
    ${keyexpenses}    Get Text    xpath=//div[@class='content-detail no-padding-T']/p[2]
    Convert To String    ${keyexpenses}
    ${lengthkeyexpenses}    Get Length    ${keyexpenses}
    ${keyexpenses}    Get Substring    ${keyexpenses}    4    ${lengthkeyexpenses}
    Set Global Variable    ${keyexpenses}

Add Expenses Non Link Activity
    Login Admin
    Wait Until Element Is Visible    xpath=//i[@class='icon-Menu-Expenses']
    Click Element    xpath=//i[@class='icon-Menu-Expenses']
    Wait Until Element Is Visible    xpath=//i[@class='v-icon-bg icon-Add']
    Click Element    xpath=//i[@class='v-icon-bg icon-Add']
    Comment    Check Close Dialog Content
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${description}    Set Variable    Detail-Expenses NonLink-${date}
    ${title}    Set Variable    Add-Expenses NonLink-${date}
    ${datetime}    Get Current Date    result_format=datetime
    Input Text    xpath=//input[@formcontrolname='subject']    ${title}
    Click Element    xpath=(//span[@class='e-input-group-icon e-date-icon e-icons'])
    Click Element    xpath=//span[text()='${datetime.day-2}']
    Click Element    xpath=(//span[@class='e-input-group-icon e-time-icon e-icons'])[1]
    Sleep    0.1 seconds
    Click Element    xpath=//li[@class='e-list-item '][text()='11:00 AM']
    Input Text    xpath=//textarea[@formcontrolname='remark']    ${description}
    Comment    Set Selenium Speed    0.1 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[1]
    Wait Until Element Is Visible    xpath=//input[@formcontrolname='milesStart']
    Input Text    xpath=//input[@formcontrolname='milesStart']    10
    Input Text    xpath=//input[@formcontrolname='milesEnd']    100
    Press Key    xpath=//input[@formcontrolname='milesEnd']    ${\n}
    Sleep    0.2 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[2]
    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='quantity'])[2]
    Input Text    xpath=(//input[@formcontrolname='quantity'])[2]    2
    Input Text    xpath=(//input[@formcontrolname='amount1'])[2]    1000
    Press Key    xpath=(//input[@formcontrolname='amount1'])[2]    ${\n}
    Sleep    0.2 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[3]
    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='amount1'])[3]
    Input Text    xpath=(//input[@formcontrolname='amount1'])[3]    300
    Input Text    xpath=//input[@formcontrolname='amount2']    200
    Input Text    xpath=//input[@formcontrolname='amount3']    100
    Press Key    xpath=//input[@formcontrolname='amount3']    ${\n}
    Sleep    0.2 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[4]
    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='quantity'])[3]
    Input Text    xpath=(//input[@formcontrolname='quantity'])[3]    15
    Input Text    xpath=(//input[@formcontrolname='amount1'])[4]    500
    Press Key    xpath=(//input[@formcontrolname='amount1'])[4]    ${\n}
    Sleep    0.2 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[5]
    Wait Until Element Is Visible    xpath=//input[@formcontrolname='title']
    Input Text    xpath=//input[@formcontrolname='title']    Test I ${date}
    Input Text    xpath=//input[@formcontrolname='hours']    5
    Input Text    xpath=//input[@formcontrolname='minutes']    10
    Input Text    xpath=(//input[@formcontrolname='quantity'])[4]    15
    Input Text    xpath=(//input[@formcontrolname='amount1'])[5]    1000
    Click Element    xpath=//i[@class='fa fa-plus-circle add-icon ng-star-inserted']
    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='title'])[2]
    Input Text    xpath=(//input[@formcontrolname='title'])[2]    Test II ${date}
    Input Text    xpath=(//input[@formcontrolname='hours'])[2]    10
    Input Text    xpath=(//input[@formcontrolname='minutes'])[2]    20
    Input Text    xpath=(//input[@formcontrolname='quantity'])[5]    30
    Input Text    xpath=(//input[@formcontrolname='amount1'])[6]    3000
    Click Button    xpath=//div[@class='e-acrdn-panel']/div/button
    Sleep    0.2 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[6]
    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='amount1'])[7]
    Input Text    xpath=(//input[@formcontrolname='amount1'])[7]    1000
    Press Key    xpath=(//input[@formcontrolname='amount1'])[7]    ${\n}
    Sleep    0.2 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[7]
    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='quantity'])[6]
    Input Text    xpath=(//input[@formcontrolname='quantity'])[6]    30
    Input Text    xpath=(//input[@formcontrolname='amount1'])[8]    2000
    Press Key    xpath=(//input[@formcontrolname='amount1'])[8]    ${\n}
    Sleep    0.2 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[8]
    Wait Until Element Is Visible    xpath=//input[@formcontrolname='note']
    Input Text    xpath=//input[@formcontrolname='note']    ค่าใช้จ่ายอื่นๆ 1
    Input Text    xpath=(//input[@formcontrolname='amount1'])[9]    1000
    Click Element    xpath=(//i[@class='fa fa-plus-circle add-icon ng-star-inserted'])[2]
    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='note'])[2]
    Input Text    xpath=(//input[@formcontrolname='note'])[2]    ค่าใช้จ่ายอื่นๆ 2
    Input Text    xpath=(//input[@formcontrolname='amount1'])[10]    500
    Click Button    xpath=//div[@class='e-acrdn-panel']/div/button
    Click Button    xpath=//*[@id="page-content-wrapper"]/app-expenses/app-expenses-add/ejs-sidebar/div/div[2]/div[3]/div/button[1]
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Wait Until Element Is Visible    xpath=//div[@class='content-detail no-padding-T']/p[2]
    ${keyexpenses}    Get Text    xpath=//div[@class='content-detail no-padding-T']/p[2]
    Convert To String    ${keyexpenses}
    ${lengthkeyexpenses}    Get Length    ${keyexpenses}
    ${keyexpenses}    Get Substring    ${keyexpenses}    4    ${lengthkeyexpenses}
    Set Global Variable    ${keyexpenses}

Approve in Expenses After Add Expenses
    Login Sups
    Wait Until Element Is Visible    xpath=//i[@class='icon-Menu-Expenses']
    Click Element    xpath=//i[@class='icon-Menu-Expenses']
    Wait Until Element Is Visible    xpath=//div[@class='float-right icon-search']
    Click Element    xpath=//div[@class='float-right icon-search']
    Sleep    0.5 seconds
    Wait Until Element Is Visible    xpath=(//input[@floatlabeltype='Never'][@class='e-control e-textbox e-lib e-input'])[1]
    Input Text    xpath=(//input[@floatlabeltype='Never'][@class='e-control e-textbox e-lib e-input'])[1]    ${keyexpenses}
    Wait Until Element Is Visible    xpath=//table[@class='e-table']/tbody/tr/td/div
    Click Element    xpath=//table[@class='e-table']/tbody/tr/td/div
    ${check} =    Get Matching Xpath Count    xpath=//span[@class='cc-g0ak cc-hy0f']
    Run Keyword If    ${check} != 0    Click Element    xpath=//span[@class='cc-g0ak cc-hy0f']
    Wait Until Element Is Visible    xpath=//div[@class='approve-btn-panel ng-star-inserted']/button[@class='e-control e-btn e-lib e-primary']
    Click Element    xpath=//div[@class='approve-btn-panel ng-star-inserted']/button[@class='e-control e-btn e-lib e-primary']
    Wait Until Element Is Visible    xpath=//div[@class='swal2-actions']/button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//div[@class='swal2-actions']/button[@class='swal2-confirm swal2-styled']
    Sleep    1 seconds
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']

Approve in Expenses Not After Add Ex.
    Login Sups
    Wait Until Element Is Visible    xpath=//i[@class='icon-Menu-Expenses']
    Click Element    xpath=//i[@class='icon-Menu-Expenses']
    Wait Until Element Is Visible    xpath=//div[@class='content-wrapper']/ejs-dropdownlist
    Click Element    xpath=//div[@class='content-wrapper']/ejs-dropdownlist
    Wait Until Element Is Visible    xpath=//ul[@class='e-list-parent e-ul']/li[2]
    Click Element    xpath=//ul[@class='e-list-parent e-ul']/li[2]
    Sleep    0.5 seconds
    ${test}=    Get Matching Xpath Count    xpath=//table[@class='e-table']/tbody/tr
    ${test}=    Set Variable    ${test}-1
    Sleep    0.5 seconds
    Wait Until Element Is Visible    xpath=//table[@class='e-table']/tbody/tr[${test}]/td/div
    Click Element    xpath=//table[@class='e-table']/tbody/tr[${test}]/td/div
    Click Element    xpath=//span[@class='cc-g0ak cc-hy0f']
    Wait Until Element Is Visible    xpath=//div[@class='approve-btn-panel ng-star-inserted']/button[@class='e-control e-btn e-lib e-primary']
    Click Element    xpath=//div[@class='approve-btn-panel ng-star-inserted']/button[@class='e-control e-btn e-lib e-primary']
    Wait Until Element Is Visible    xpath=//div[@class='swal2-actions']/button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//div[@class='swal2-actions']/button[@class='swal2-confirm swal2-styled']
    Sleep    0.5 seconds
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']

Edit Expenses In Pending Approval
    Login Staff
    Wait Until Element Is Visible    xpath=//i[@class='icon-Menu-Expenses']
    Click Element    xpath=//i[@class='icon-Menu-Expenses']
    Wait Until Element Is Visible    xpath=//div[@class='content-wrapper']/ejs-dropdownlist
    Click Element    xpath=//div[@class='content-wrapper']/ejs-dropdownlist
    Wait Until Element Is Visible    xpath=//ul[@class='e-list-parent e-ul']/li[3]
    Click Element    xpath=//ul[@class='e-list-parent e-ul']/li[3]
    Sleep    0.5 seconds
    Wait Until Element Is Visible    xpath=//div[@class='expenses-list-group custom-scrollbar list-view']/div/div/ejs-accordion/div[1]/div[2]/div/ejs-grid/div[3]/div/table/tbody/tr
    ${test}=    Get Matching Xpath Count    xpath=//div[@class='expenses-list-group custom-scrollbar list-view']/div/div/ejs-accordion/div[1]/div[2]/div/ejs-grid/div[3]/div/table/tbody/tr
    Sleep    0.5 seconds
    Wait Until Element Is Visible    xpath=//table[@class='e-table']/tbody/tr[${test}]/td/div
    Click Element    xpath=//table[@class='e-table']/tbody/tr[${test}]/td/div
    ${check} =    Get Matching Xpath Count    xpath=//span[@class='cc-g0ak cc-hy0f']
    Run Keyword If    ${check} != 0    Click Element    xpath=//span[@class='cc-g0ak cc-hy0f']
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${description}    Set Variable    [Edit] Detail-Expenses-${date}
    ${title}    Set Variable    [Edit] Add-Expenses-${date}
    ${datetime}    Get Current Date    result_format=datetime
    Wait Until Element Is Visible    xpath=//i[@class='fa fa-pencil']
    Click Element    xpath=//i[@class='fa fa-pencil']
    ${x} =    Get Matching Xpath Count    xpath=//div[@class='e-toolbar-item e-template']
    Run Keyword If    ${x} == 0    Edit Non Link Activity    ${title}    ${datetime}
    Input Text    xpath=//textarea[@formcontrolname='remark']    ${description}
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[1]
    Wait Until Element Is Visible    xpath=//input[@formcontrolname='milesStart']
    Input Text    xpath=//input[@formcontrolname='milesStart']    50
    Input Text    xpath=//input[@formcontrolname='milesEnd']    60
    Press Key    xpath=//input[@formcontrolname='milesEnd']    ${\n}
    Sleep    0.2 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[2]
    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='quantity'])[2]
    Input Text    xpath=(//input[@formcontrolname='quantity'])[2]    1
    Input Text    xpath=(//input[@formcontrolname='amount1'])[2]    500
    Press Key    xpath=(//input[@formcontrolname='amount1'])[2]    ${\n}
    Sleep    0.2 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[3]
    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='amount1'])[3]
    Input Text    xpath=(//input[@formcontrolname='amount1'])[3]    200
    Input Text    xpath=//input[@formcontrolname='amount2']    100
    Input Text    xpath=//input[@formcontrolname='amount3']    50
    Press Key    xpath=//input[@formcontrolname='amount3']    ${\n}
    Sleep    0.2 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[4]
    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='quantity'])[3]
    Input Text    xpath=(//input[@formcontrolname='quantity'])[3]    5
    Input Text    xpath=(//input[@formcontrolname='amount1'])[4]    100
    Press Key    xpath=(//input[@formcontrolname='amount1'])[4]    ${\n}
    Sleep    0.2 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[5]
    Wait Until Element Is Visible    xpath=//input[@formcontrolname='title']
    Input Text    xpath=//input[@formcontrolname='title']    [Edit] Test I ${date}
    Input Text    xpath=//input[@formcontrolname='hours']    1
    Input Text    xpath=//input[@formcontrolname='minutes']    5
    Input Text    xpath=(//input[@formcontrolname='quantity'])[4]    10
    Input Text    xpath=(//input[@formcontrolname='amount1'])[5]    500
    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='title'])[2]
    Input Text    xpath=(//input[@formcontrolname='title'])[2]    [Edit] Test II ${date}
    Input Text    xpath=(//input[@formcontrolname='hours'])[2]    5
    Input Text    xpath=(//input[@formcontrolname='minutes'])[2]    10
    Input Text    xpath=(//input[@formcontrolname='quantity'])[5]    20
    Input Text    xpath=(//input[@formcontrolname='amount1'])[6]    1500
    Click Button    xpath=//div[@class='e-acrdn-panel']/div/button
    Sleep    0.2 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[6]
    Wait Until Element Is Visible    xpath=//ejs-accordion[@expandmode='Single']/div[6]/div[2]/div/form/div/div/div/ejs-numerictextbox/span/input[1]
    Input Text    xpath=//ejs-accordion[@expandmode='Single']/div[6]/div[2]/div/form/div/div/div/ejs-numerictextbox/span/input[1]    500
    Press Key    xpath=//ejs-accordion[@expandmode='Single']/div[6]/div[2]/div/form/div/div/div/ejs-numerictextbox/span/input[1]    ${\n}
    Sleep    0.2 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[7]
    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='quantity'])[6]
    Input Text    xpath=(//input[@formcontrolname='quantity'])[6]    15
    Input Text    xpath=(//input[@formcontrolname='amount1'])[8]    1000
    Press Key    xpath=(//input[@formcontrolname='amount1'])[8]    ${\n}
    Sleep    0.2 seconds
    Click Element    xpath=//ejs-accordion[@expandmode='Single']/div[8]
    Wait Until Element Is Visible    xpath=//input[@formcontrolname='note']
    Input Text    xpath=//input[@formcontrolname='note']    [Edit] ค่าใช้จ่ายอื่นๆ 1
    Input Text    xpath=(//input[@formcontrolname='amount1'])[9]    50
    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='note'])[2]
    Input Text    xpath=(//input[@formcontrolname='note'])[2]    [Edit] ค่าใช้จ่ายอื่นๆ 2
    Input Text    xpath=(//input[@formcontrolname='amount1'])[10]    100
    Press Key    xpath=(//input[@formcontrolname='amount1'])[10]    \ue004
    Press Key    xpath=//div[@class='e-acrdn-panel']/div[@class='e-acrdn-content']/button    ${\n}
    Click Button    xpath=(//div[@class='e-sample-resize-container']/button[@class='float-right sb-btn-submit e-control e-btn e-lib e-primary'])[1]
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']

Add Plan Online
    Login Staff
    Wait Until Element Is Visible    xpath=//i[@class='icon-Menu-Plan']
    Click Element    xpath=//i[@class='icon-Menu-Plan']
    Wait Until Element Is Visible    xpath=//i[@class='icon icon-Add-Plan \ color-white']
    Click Element    xpath=//i[@class='icon icon-Add-Plan \ color-white']
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${datetime}    Get Current Date    result_format=datetime
    ${subject}    Set Variable    Plan-Online-${date}-WEB
    ${keyactivity}    Set Variable    online
    ${customername}    Set Variable    A_Nam-Lead-Bus
    ${contactname}    Set Variable    Con-AI-Test-${date}-WEB
    ${note}    Set Variable    Nam-AI-Test-${date}-WEB
    ${position}    Set Variable    IT-Deverlopment
    ${email}    Set Variable    Plan@Online.com
    ${phone}    Set Variable    0888888888
    ${mobile}    Set Variable    0999999999
    Wait Until Element Is Visible    xpath=//input[@formcontrolname='subject']
    Input Text    xpath=//input[@formcontrolname='subject']    ${subject}
    Click Element    xpath=//span[@formcontrolname='activityTypeId']
    Input Text    css=.e-input-filter    ${keyactivity}
    Press Key    css=.e-input-filter    ${\n}
    Click Element    xpath=//form[@class='form-horizontal ng-invalid ng-dirty ng-touched']/div[1]/div[3]/div/p/span[1]
    Click Element    xpath=//span[@formcontrolname='customerId']
    Input Text    css=.e-input-filter    ${customername}
    Wait Until Element Is Visible    xpath=//ul[@class='e-list-parent e-ul ']
    Press Key    css=.e-input-filter    ${\n}
    Check Close Dialog Content
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/form/div[1]/div[5]/div[1]/div
    Click Element    xpath=//div[@class='e-ddl-footer']
    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='contactName'])[3]
    Input Text    xpath=(//input[@formcontrolname='contactName'])[3]    ${contactname}
    Input Text    xpath=(//input[@formcontrolname='contactNameEn'])[2]    ${contactname}
    Input Text    xpath=(//input[@formcontrolname='position'])[2]    ${position}
    Click Element    xpath=(//input[@formcontrolname='birthDate'])[2]
    Wait Until Element Is Visible    xpath=(//button[@class='owl-dt-control-button owl-dt-control-arrow-button'])[1]
    Click Element    xpath=(//button[@class='owl-dt-control-button owl-dt-control-arrow-button'])[1]
    Click Element    xpath=//td[@aria-label='1999']
    Click Element    xpath=//td[@aria-label='May 1999']
    Click Element    xpath=//td[@aria-label='May 6, 1999']
    Input Text    xpath=(//input[@formcontrolname='email'])[4]    ${email}
    Input Text    xpath=(//input[@formcontrolname='phone'])[3]    ${phone}
    Input Text    xpath=(//input[@formcontrolname='mobile'])[4]    ${mobile}
    Input Text    xpath=(//textarea[@formcontrolname='notes'])[4]    ${note}
    Click Button    xpath=(//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/form/button[@type='submit'])[2]
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/form/div[1]/div[6]/div[1]/div
    Wait Until Element Is Visible    xpath=(//span[text()='${datetime.day+1}'])[1]
    Click Element    xpath=(//span[text()='${datetime.day+1}'])[1]
    Input Text    xpath=//owl-date-time-timer/owl-date-time-timer-box[1]/label/input    8
    Press Key    xpath=//owl-date-time-timer/owl-date-time-timer-box[1]/label/input    \\13
    Input Text    xpath=//owl-date-time-timer/owl-date-time-timer-box[2]/label/input    0
    Press Key    xpath=//owl-date-time-timer/owl-date-time-timer-box[2]/label/input    \\13
    Click Button    xpath=//button[@class='owl-dt-control owl-dt-control-button owl-dt-container-control-button'][2]
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/form/div[1]/div[6]/div[2]/div
    Wait Until Element Is Visible    xpath=(//span[text()='${datetime.day+2}'])[1]
    Click Element    xpath=(//span[text()='${datetime.day+2}'])[1]
    Input Text    xpath=//owl-date-time-timer/owl-date-time-timer-box[1]/label/input    8
    Press Key    xpath=//owl-date-time-timer/owl-date-time-timer-box[1]/label/input    \\13
    Input Text    xpath=//owl-date-time-timer/owl-date-time-timer-box[2]/label/input    0
    Press Key    xpath=//owl-date-time-timer/owl-date-time-timer-box[2]/label/input    \\13
    Click Button    xpath=//button[@class='owl-dt-control owl-dt-control-button owl-dt-container-control-button'][2]
    Input Text    xpath=(//textarea[@formcontrolname='notes'])[2]    ${note}
    Click Button    xpath=(//button[@type='submit'])[2]
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Close Browser
    Close Browser

Add Plan With Customer
    Login Staff
    Wait Until Element Is Visible    xpath=//i[@class='icon-Menu-Plan']
    Click Element    xpath=//i[@class='icon-Menu-Plan']
    Wait Until Element Is Visible    xpath=//i[@class='icon icon-Add-Plan \ color-white']
    Click Element    xpath=//i[@class='icon icon-Add-Plan \ color-white']
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${datetime}    Get Current Date    result_format=datetime
    ${subject}    Set Variable    Plan-With-Customer-${date}-WEB
    ${keyactivity}    Set Variable    With Customer
    ${customername}    Set Variable    A_Nam-Pros-Bus
    ${customerOwnersStr}    Set Variable    ลลิษา ขายเก่ง
    ${contactname}    Set Variable    Con-AI-Test-${date}-WEB
    ${note}    Set Variable    Nam-AI-Test-${date}-WEB
    ${position}    Set Variable    IT-Deverlopment
    ${email}    Set Variable    Plan@Withcustomer.com
    ${phone}    Set Variable    0888888888
    ${mobile}    Set Variable    0999999999
    Wait Until Element Is Visible    xpath=//input[@formcontrolname='subject']
    Input Text    xpath=//input[@formcontrolname='subject']    ${subject}
    Click Element    xpath=//span[@formcontrolname='activityTypeId']
    Input Text    css=.e-input-filter    ${keyactivity}
    Press Key    css=.e-input-filter    ${\n}
    Click Element    xpath=//form[@class='form-horizontal ng-invalid ng-dirty ng-touched']/div[1]/div[3]/div/p/span[1]
    Click Element    xpath=//span[@formcontrolname='customerId']
    Input Text    css=.e-input-filter    ${customername}
    Wait Until Element Is Visible    xpath=//ul[@class='e-list-parent e-ul ']
    Press Key    css=.e-input-filter    ${\n}
    Check Close Dialog Content
    Comment    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/form/div[1]/div[5]/div[1]/div
    Comment    Click Element    xpath=//div[@class='e-ddl-footer']
    Comment    Wait Until Element Is Visible    xpath=(//input[@formcontrolname='contactName'])[3]
    Comment    Input Text    xpath=(//input[@formcontrolname='contactName'])[3]    ${contactname}
    Comment    Input Text    xpath=(//input[@formcontrolname='contactNameEn'])[2]    ${contactname}
    Comment    Input Text    xpath=(//input[@formcontrolname='position'])[2]    ${position}
    Comment    Click Element    xpath=(//input[@formcontrolname='birthDate'])[2]
    Comment    Wait Until Element Is Visible    xpath=(//button[@class='owl-dt-control-button owl-dt-control-arrow-button'])[1]
    Comment    Click Element    xpath=(//button[@class='owl-dt-control-button owl-dt-control-arrow-button'])[1]
    Comment    Click Element    xpath=//td[@aria-label='1999']
    Comment    Click Element    xpath=//td[@aria-label='May 1999']
    Comment    Click Element    xpath=//td[@aria-label='May 6, 1999']
    Comment    Input Text    xpath=(//input[@formcontrolname='email'])[4]    ${email}
    Comment    Input Text    xpath=(//input[@formcontrolname='phone'])[3]    ${phone}
    Comment    Input Text    xpath=(//input[@formcontrolname='mobile'])[4]    ${mobile}
    Comment    Input Text    xpath=(//textarea[@formcontrolname='notes'])[4]    ${note}
    Comment    Click Button    xpath=(//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/form/button[@type='submit'])[2]
    Comment    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Comment    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/form/div[1]/div[6]/div[1]/div
    Wait Until Element Is Visible    xpath=(//span[text()='${datetime.day+1}'])[1]
    Click Element    xpath=(//span[text()='${datetime.day+1}'])[1]
    Input Text    xpath=//owl-date-time-timer/owl-date-time-timer-box[1]/label/input    8
    Press Key    xpath=//owl-date-time-timer/owl-date-time-timer-box[1]/label/input    \\13
    Input Text    xpath=//owl-date-time-timer/owl-date-time-timer-box[2]/label/input    0
    Press Key    xpath=//owl-date-time-timer/owl-date-time-timer-box[2]/label/input    \\13
    Click Button    xpath=//button[@class='owl-dt-control owl-dt-control-button owl-dt-container-control-button'][2]
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/form/div[1]/div[6]/div[2]/div
    Wait Until Element Is Visible    xpath=(//span[text()='${datetime.day+2}'])[1]
    Click Element    xpath=(//span[text()='${datetime.day+2}'])[1]
    Input Text    xpath=//owl-date-time-timer/owl-date-time-timer-box[1]/label/input    8
    Press Key    xpath=//owl-date-time-timer/owl-date-time-timer-box[1]/label/input    \\13
    Input Text    xpath=//owl-date-time-timer/owl-date-time-timer-box[2]/label/input    0
    Press Key    xpath=//owl-date-time-timer/owl-date-time-timer-box[2]/label/input    \\13
    Click Button    xpath=//button[@class='owl-dt-control owl-dt-control-button owl-dt-container-control-button'][2]
    Input Text    xpath=(//textarea[@formcontrolname='notes'])[2]    ${note}
    Click Element    xpath=//div[@class='e-toolbar-item e-template']/div/div
    Wait Until Element Is Visible    xpath=//div[@class='e-multiselect e-input-group e-control-wrapper e-valid-input']/div
    Click Element    xpath=//div[@class='e-multiselect e-input-group e-control-wrapper e-valid-input']/div
    Input Text    css=input[formcontrolname='assignToUserIds']    ${customerOwnersStr}
    Press Key    css=input[formcontrolname='assignToUserIds']    \\13
    Click Button    xpath=(//button[@type='submit'])[2]
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Close Browser
    Comment    ...
    Comment    Click Element    xpath=//span[@class='pointer custom-btn-add']
    Comment    Wait Until Element Is Visible    xpath=(//input[@class='form-control py-2 border-right-0 ng-untouched ng-pristine ng-valid'])[1]
    Comment    Input Text    xpath=(//input[@class='form-control py-2 border-right-0 ng-untouched ng-pristine ng-valid'])[1]    วัดไร่ขิง
    Comment    Press Key    xpath=(//input[@class='form-control py-2 border-right-0 ng-untouched ng-pristine ng-valid'])[1]    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[2]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Comment    Click Element    xpath=//i[@class='fa fa-chevron-right align-self-center']
    Comment    Wait Until Element Is Visible    xpath=(//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/p)[3]
    Comment    Click Element    xpath=(//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/p)[3]
    Comment    Input Text    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ม.เกษตรกำแพงแสน
    Comment    Press Key    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Close Browser

Add Plan With Out Customer
    Login Staff
    Wait Until Element Is Visible    xpath=//i[@class='icon-Menu-Plan']
    Click Element    xpath=//i[@class='icon-Menu-Plan']
    Wait Until Element Is Visible    xpath=//i[@class='icon icon-Add-Plan \ color-white']
    Click Element    xpath=//i[@class='icon icon-Add-Plan \ color-white']
    ${date}    Get Current Date
    ${date}    Convert Date    ${date}    exclude_millis=yes
    ${datetime}    Get Current Date    result_format=datetime
    ${subject}    Set Variable    Plan-With-Out-Customer-${date}-WEB
    ${keyactivity}    Set Variable    Without Customer
    Comment    ${customername}    Set Variable    A_Nam-Cus-Bus
    ${contactname}    Set Variable    Con-AI-Test-${date}-WEB
    ${customerOwnersStrI}    Set Variable    ลลิษา ขายเก่ง
    ${customerOwnersStrII}    Set Variable    Chatnarong
    ${note}    Set Variable    Nam-AI-Test-${date}-WEB
    ${position}    Set Variable    IT-Deverlopment
    ${email}    Set Variable    Plan@Withoutcustomer.com
    ${phone}    Set Variable    0888888888
    ${mobile}    Set Variable    0999999999
    Wait Until Element Is Visible    xpath=//input[@formcontrolname='subject']
    Input Text    xpath=//input[@formcontrolname='subject']    ${subject}
    Click Element    xpath=//span[@formcontrolname='activityTypeId']
    Input Text    css=.e-input-filter    ${keyactivity}
    Press Key    css=.e-input-filter    ${\n}
    Check Close Dialog Content
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/form/div[1]/div[3]/div[1]/div
    Wait Until Element Is Visible    xpath=(//span[text()='${datetime.day+1}'])[1]
    Click Element    xpath=(//span[text()='${datetime.day+1}'])[1]
    Input Text    xpath=//owl-date-time-timer/owl-date-time-timer-box[1]/label/input    8
    Press Key    xpath=//owl-date-time-timer/owl-date-time-timer-box[1]/label/input    \\13
    Input Text    xpath=//owl-date-time-timer/owl-date-time-timer-box[2]/label/input    0
    Press Key    xpath=//owl-date-time-timer/owl-date-time-timer-box[2]/label/input    \\13
    Click Button    xpath=//button[@class='owl-dt-control owl-dt-control-button owl-dt-container-control-button'][2]
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/form/div[1]/div[3]/div[2]/div
    Wait Until Element Is Visible    xpath=(//span[text()='${datetime.day+2}'])[1]
    Click Element    xpath=(//span[text()='${datetime.day+2}'])[1]
    Input Text    xpath=//owl-date-time-timer/owl-date-time-timer-box[1]/label/input    8
    Press Key    xpath=//owl-date-time-timer/owl-date-time-timer-box[1]/label/input    \\13
    Input Text    xpath=//owl-date-time-timer/owl-date-time-timer-box[2]/label/input    0
    Press Key    xpath=//owl-date-time-timer/owl-date-time-timer-box[2]/label/input    \\13
    Click Button    xpath=//button[@class='owl-dt-control owl-dt-control-button owl-dt-container-control-button'][2]
    Input Text    xpath=(//textarea[@formcontrolname='notes'])[2]    ${note}
    Click Element    xpath=//div[@class='e-toolbar-item e-template']/div/div
    Wait Until Element Is Visible    xpath=//div[@class='e-multiselect e-input-group e-control-wrapper e-valid-input']/div
    Click Element    xpath=//div[@class='e-multiselect e-input-group e-control-wrapper e-valid-input']/div
    Input Text    css=input[formcontrolname='assignToUserIds']    ${customerOwnersStrI}
    Press Key    css=input[formcontrolname='assignToUserIds']    \\13
    Input Text    css=input[formcontrolname='assignToUserIds']    ${customerOwnersStrII}
    Press Key    css=input[formcontrolname='assignToUserIds']    \\13
    Click Button    xpath=(//button[@type='submit'])[2]
    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Close Browser
    Comment    Click Element    xpath=//span[@class='pointer custom-btn-add']
    Comment    Wait Until Element Is Visible    xpath=(//input[@class='form-control py-2 border-right-0 ng-untouched ng-pristine ng-valid'])[1]
    Comment    Input Text    xpath=(//input[@class='form-control py-2 border-right-0 ng-untouched ng-pristine ng-valid'])[1]    วัดไร่ขิง
    Comment    Press Key    xpath=(//input[@class='form-control py-2 border-right-0 ng-untouched ng-pristine ng-valid'])[1]    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[2]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Comment    Click Element    xpath=//i[@class='fa fa-chevron-right align-self-center']
    Comment    Wait Until Element Is Visible    xpath=(//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/p)[3]
    Comment    Click Element    xpath=(//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div/div[2]/p)[3]
    Comment    Input Text    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ม.เกษตรกำแพงแสน
    Comment    Press Key    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ${\n}
    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[1]
    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Close Browser

Test Equal Var.
    Open Browser    https://www.google.com    browser=chrome
    ${data2}=    Set Variable    ${EMPTY}
    ${data}=    Set Variable    ค้นหาด้วย Google
    ${d}=    Check And Set Value2    Get Value    (//input[@class='gNO89b1'])[2]
    Log    ${d}
    Should Be Equal    ${data}    ${d}
    Should Be Equal    ${data2}    ${d}
    Log    ${d}
    Comment    Input Text    xpath=//input[@class='gLFyf gsfi']    ${d}
    Comment    ${result}    Get Value    xpath=//input[@class='gLFyf gsfi']
    Comment    ${x} =    Get Matching Xpath Count    xpath=//input[@class='gLFyf gsfi']
    Comment    ...    Edit Non Link Activity
    Comment    Input Text    xpath=//input[@class='gLFyf gsfi']    ${result} .... ${x}
    ${/}

Test Equal Var.2
    Open Browser    https://www.google.com    browser=chrome
    ${d}=    Check And Set Value    Get Value    (//input[@class='gNO89b'])[2]
    Log    ${d}
    Comment    Input Text    xpath=//input[@class='gLFyf gsfi']    ${d}
    Comment    ${result}    Get Value    xpath=//input[@class='gLFyf gsfi']
    Comment    ${x} =    Get Matching Xpath Count    xpath=//input[@class='gLFyf gsfi']
    Comment    ...    Edit Non Link Activity
    Comment    Input Text    xpath=//input[@class='gLFyf gsfi']    ${result} .... ${x}

Test Basic For
    Open Browser    https://www.google.com    browser=chrome
    FOR    ${index}    IN RANGE    ${var2}
        Input Text    xpath=//input[@class='gLFyf gsfi']    ${index}
    END
    #Input Text    xpath=//input[@class='gLFyf gsfi']    ${index}

Test Get Text Var. In Lead Bus
    Login Staff
    ${customerCode}    Set Variable    LEAD-INDI-2020-12-10 10:26:51-WEB
    ${customerName}    Set Variable    LEAD-INDI-2020-12-10 10:26:51-WEB
    ${secondaryName}    Set Variable    Cp Automate Test 2020-12-10 10:26:51-WEB
    ${item}    Set Variable    Cp Automate Test 2020-12-10 10:26:51-WEB
    ${contactname}    Set Variable    Cp Automate Test 2020-12-10 10:26:51-WEB
    ${customerGroupId}    Set Variable    star
    ${classification}    Set Variable    A
    ${sourceOfLead}    Set Variable    facebook
    ${tag}    Set Variable    Venio
    ${customerOwnersStr}    Set Variable    นันทภัทร
    ${phone}    Set Variable    0811111111
    ${mobile}    Set Variable    0822222222
    ${email}    Set Variable    lead01@bisiness.com
    ${textarea}    Set Variable    Cp Automate Test 2020-12-10 10:26:51
    Wait Until Element Is Enabled    xpath=//i[@class='icon-Menu-Customer-centric-white font32']
    Click Element    xpath=//i[@class='icon-Menu-Customer-centric-white font32']
    Wait Until Element Is Visible    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[1]/div[2]/div/div/ul/li[1]
    Click Element    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[1]/div[2]/div/div/ul/li[1]
    Wait Until Element Is Visible    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input
    Input Text    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input    A_Nam-Lead-Bus-
    Wait Until Element Is Visible    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Click Element    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Wait Until Element Is Enabled    css=i[class='icon-Edit']
    Click Element    css=i[class='icon-Edit']
    ${customerCodeCheck}    Get Value    css=input[formcontrolname='customerCode']
    ${customerNameCheck}    Get Value    css=input[formcontrolname='customerName']
    ${secondaryNameCheck}    Get Value    css=input[formcontrolname='secondaryName']
    ${itemCheck}    Get Text    xpath=//tag-input[@formcontrolname='customerAlias']/div/div/tag[1]/div/div/div
    Comment    ${contactname}    Get Text    css=input[formcontrolname="contactName"]
    Comment    ${mobileCheck}    Get Text    xpath=(//input[@formcontrolname='mobile'])[3]
    Comment    ${emailCheck}    Get Text    xpath=(//input[@formcontrolname='email'])[3]
    ${phoneCheck}    Get Value    xpath=(//input[@formcontrolname='phone'])[3]
    ${mobileCheck}    Get Value    xpath=(//input[@formcontrolname='mobile'])[4]
    ${emailCheck}    Get Value    xpath=(//input[@formcontrolname='email'])[4]
    ${sourceOfLeadCheck}    Get Selected List Value    xpath=//span[@formcontrolname='sourceOfLead']/select
    ${tagCheck}    Get Text    xpath=(//form[@class='form-horizontal ng-touched ng-dirty ng-valid']/div[@class='form-group ng-star-inserted'][2]/div/div/p/span[@class='label label-with-fake-box ng-star-inserted active'])[1]
    Comment    ${customerGroupIdCheck}    Get Selected List Value    xpath=//span[@formcontrolname='customerGroupId']/select
    ${customerGroupIdCheck}=    Check And Set Value    Get Selected List Value    xpath=//span[@formcontrolname='customerGroupId']/select
    Comment    ${classificationCheck}    Get Text    xpath=//form[@class='form-horizontal ng-touched ng-dirty ng-valid']/div[@class='form-group ng-star-inserted'][4]/div/div/p/span[@class='label label-with-fake-box ng-star-inserted active']
    Comment    ${customerOwnersStrCheck}    Get Text    xpath=//div[@class='e-multi-select-wrapper']/span[1]/span[1]
    ${textareaCheck}    Get Text    css=textarea[formcontrolname='notes']
    Input Text    css=input[formcontrolname='customerCode']    ${customerGroupIdCheck}

Add Case FYI
    Login Staff
    Wait Until Element Is Visible    xpath=//i[@class='icon-Menu-Cases']
    Click Element    xpath=//i[@class='icon-Menu-Cases']
    Wait Until Element Is Visible    xpath=//i[@class='v-icon-bg icon-Add']
    Click Element    xpath=//i[@class='v-icon-bg icon-Add']
    Wait Until Element Is Visible    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div[@class='sidebar custom-scrollbar']/div[2]/form/div[1]/div[2]
    Click Element    xpath=//ejs-sidebar[@class='e-control e-sidebar e-lib e-transition e-right e-open e-push']/div[@class='sidebar custom-scrollbar']/div[2]/form/div[1]/div[2]
    Comment    ..
    Comment    ${date}    Get Current Date
    Comment    ${date}    Convert Date    ${date}    exclude_millis=yes
    Comment    ${customerCode}    Set Variable    A_L-Bu-${date}-WEB
    Comment    ${customerName}    Set Variable    A_Nam-Lead-Bus-${date}-WEB
    Comment    ${secondaryName}    Set Variable    A_Nam-AI-Test-${date}-WEB
    Comment    ${item}    Set Variable    A_Nam-AI-Test-${date}-WEB
    Comment    ${contactname}    Set Variable    A_Con-Lead-Bus-${date}-WEB
    Comment    ${customerGroupId}    Set Variable    star
    Comment    ${classification}    Set Variable    A
    Comment    ${sourceOfLead}    Set Variable    facebook
    Comment    ${tag}    Set Variable    Venio
    Comment    ${customerOwnersStr}    Set Variable    นันทภัทร
    Comment    ${phone}    Set Variable    0811111111
    Comment    ${mobile}    Set Variable    0822222222
    Comment    ${email}    Set Variable    Lead@business.com
    Comment    ${textarea}    Set Variable    A_Nam-AI-Test-${date}-WEB
    Comment    Input Text    css=input[formcontrolname='customerCode']    ${customerCode}
    Comment    Input Text    css=input[formcontrolname='customerName']    ${customerName}
    Comment    Input Text    css=input[formcontrolname="secondaryName"]    ${secondaryName}
    Comment    Input Text    css=input[formcontrolname='item']    ${item}
    Comment    Press Key    css=input[formcontrolname='item']    \\13
    Comment    Check Close Dialog Content
    Comment    Input Text    css=input[formcontrolname='contactName']    ${contactname}
    Comment    Input Text    xpath=(//input[@formcontrolname='mobile'])[1]    ${mobile}
    Comment    Input Text    xpath=(//input[@formcontrolname='email'])[1]    ${email}
    Comment    Comment    Click Element    xpath=//div[@class='custom-btn-relate item-btn w-100']    \    #Wait PI Search Address
    Comment    Comment    Input Text    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    พีเจเพลส
    Comment    Comment    Press Key    xpath=//div[@class='input-group input-search mt-5 mb-5']/input    ${\n}
    Comment    Comment    Wait Until Element Is Visible    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Comment    Click Element    xpath=//div[@class='location-data border-bottom w-100 pb-2 mt-2 ng-star-inserted'][1]
    Comment    Comment    Click Element    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/div[1]/div[1]
    Comment    Comment    Click Button    xpath=//form[@class='form-horizontal ng-untouched ng-dirty ng-valid']/button[1]
    Comment    Input Text    css=input[formcontrolname='phone']    ${phone}
    Comment    Input Text    xpath=(//input[@formcontrolname='mobile'])[2]    ${mobile}
    Comment    Input Text    xpath=(//input[@formcontrolname='email'])[2]    ${email}
    Comment    Click Element    xpath=//div[@class='custom-btn-relate item-btn w-100 ng-star-inserted']
    Comment    Click Element    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span
    Comment    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Comment    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \ue015
    Comment    Press Key    xpath=//div[@class='input-group-prepend']/ejs-dropdownlist/span    \\13
    Comment    Input Text    xpath=//input[@class='form-control ng-untouched ng-pristine ng-valid']    ฉัตรณรงค์
    Comment    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][2]/div/div/p/span[1]
    Comment    Click Element    xpath=//span[@formcontrolname='sourceOfLead']
    Comment    Input Text    css=.e-input-filter    ${sourceOfLead}
    Comment    Press Key    css=.e-input-filter    \\13
    Comment    ${sourceOfLead}    Get Selected List Value    xpath=//span[@formcontrolname="sourceOfLead"]/select
    Comment    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='form-group ng-star-inserted'][4]/div/div/p/span[1]
    Comment    Click Element    xpath=//span[@formcontrolname='customerGroupId']
    Comment    Input Text    css=.e-input-filter    ${customerGroupId}
    Comment    Press Key    css=.e-input-filter    \\13
    Comment    ${customerGroupId}    Get Selected List Value    xpath=//span[@formcontrolname='customerGroupId']/select
    Comment    Click Element    xpath=//div[@class='e-multi-select-wrapper']
    Comment    Input Text    xpath=//input[@formcontrolname='customerOwnersStr']    ${customerOwnersStr}
    Comment    Press Key    xpath=//input[@formcontrolname='customerOwnersStr']    \\13
    Comment    Input Text    xpath=//div[@class='content-section'][5]/div[1]/div/textarea    ${textarea}
    Comment    Click Element    xpath=//div[@class='sidebar custom-scrollbar add-edit-customer']/div[@class='sb-body']/form/div[@class='content-section'][5]/div[2]/div/div/div[1]/ejs-radiobutton
    Comment    Click Button    css=button[type='submit']
    Comment    Wait Until Element Is Visible    xpath=//button[@class='swal2-confirm swal2-styled']
    Comment    Click Element    xpath=//button[@class='swal2-confirm swal2-styled']
    Comment    Click Element    xpath=//div[@class='control-section-listview control-section custom-scrollbar']/ejs-accordion/div[2]/div[2]/div/div/ul/li[2]
    Comment    Wait Until Element Is Visible    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input
    Comment    Input Text    xpath=//div[@class='toolbar-report']/div[1]/div/div/ejs-textbox/span/input    ${customerCode}
    Comment    Wait Until Element Is Visible    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Comment    Click Element    xpath=//table[@class='table-fixed ng-star-inserted']/tbody/tr[1]
    Comment    Wait Until Element Is Visible    css=i[class='icon-Edit']
    Comment    Click Element    css=i[class='icon-Edit']
    Comment    Close Browser

*** Keywords ***
Login Admin
    Open Browser    https://------------/-----/    browser=chrome
    Maximize Browser Window
    Comment    Sleep    3 seconds
    Wait Until Element Is Visible    Id=Email
    Input Text    Id=Email    ---------------
    Input Password    Id=Password    ---------------
    Press Key    Id=Password    \\13
    Sleep    3 seconds

Login Staff
    Comment    Open Browser    https://---------------/    browser=chrome
    Open Browser    https://---------------/    browser=chrome
    Maximize Browser Window
    Wait Until Element Is Visible    Id=Email
    Input Text    Id=Email    ---------------
    Input Password    Id=Password    ---------------
    Press Key    Id=Password    \\13
    Sleep    3 seconds

Login Sups
    Open Browser    https://---------------/-----/    browser=chrome
    Maximize Browser Window
    Comment    Sleep    3 seconds
    Wait Until Element Is Visible    Id=Email
    Input Text    Id=Email    ---------------
    Input Password    Id=Password    ---------------
    Press Key    Id=Password    \\13

Edit Non Link Activity
    [Arguments]    ${title}    ${datetime}
    Input Text    xpath=//input[@formcontrolname='subject']    ${title}
    Click Element    xpath=(//span[@class='e-input-group-icon e-date-icon e-icons'])
    Click Element    xpath=//span[text()='${datetime.day-1}']
    Click Element    xpath=(//span[@class='e-input-group-icon e-time-icon e-icons'])[1]
    Click Element    xpath=//li[@class='e-list-item '][text()='12:00 AM']

Check And Set Value
    [Arguments]    ${Iskeyword}    ${path}
    Log    ${path}
    ${check} =    Get Matching Xpath Count    xpath=${path}
    Log    ${check}
    ${data}=    Run Keyword If    ${check} != 0    ${Iskeyword}    ${path}
    Log    ${data}
    Comment    ${data}=    Run Keyword If    ${check} == 0    Set Variable    404
    Comment    Log    ${data}
    Comment    ...
    Comment    ${data}    Set Variable    ${Iskeyword}    ${check}
    Comment    ${path}    Convert To String    ${path}
    Comment    ${check} =    Get Matching Xpath Count    ${path}
    Comment    Log    ${check}
    Comment    ${data}=    Run Keyword If    ${check} != 0    Get Value    ${path}
    [Return]    ${data}

Check Close Dialog Content
    ${check} =    Get Matching Xpath Count    xpath=//span[@class='cc-g0ak cc-hy0f']
    Run Keyword If    ${check} != 0    Click Element    xpath=//span[@class='cc-g0ak cc-hy0f']

Check And Set Value2
    [Arguments]    ${Iskeyword}    ${path}
    Log    ${path}
    ${check} =    Get Matching Xpath Count    xpath=${path}
    Log    ${check}
    ${data}=    Run Keyword If    ${check} != 0    ${Iskeyword}    xpath=${path}
    ...    ELSE    Set Variable    ${EMPTY}
    [Return]    ${data}
