
# FenigeSDK

![Swift 5.0+](https://img.shields.io/badge/Swift-5.0%2B-orange.svg)
![iOS 13.0+](https://img.shields.io/badge/iOS-12.0%2B-blue.svg)

## System Requirements
iOS 13.0 or above

## Installation

FenigeSDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FenigeSDK'
```

After installation, you could import Fenige to your project by adding this:
```swift
import FenigeSDK
```

### Init Payment

You can init payment and will have callback with `Transaction ID`:
```swift
let fenigeSDKInstance = Fenige()

let redirectUrl = RedirectUrl(successUrl: "https://paytool.fenige.pl/demo/?success=1",
                              failureUrl: "https://paytool.fenige.pl/demo/?success=0")

let address = Address(countryCode: "PL",
                      city: "Testowo",
                      postalCode: "12-345",
                      street: "Testowa",
                      houseNumber: "1")

let sender = Sender(firstName: "Test",
                    lastName: "Testowy",
                    address: address)

let payment = Payment(transactionId: "0000-0000-0000-0000-0000",
                      currencyCode: "USD",
                      amount: 10,
                      description: "Test transaction",
                      formLanguage: "en",
                      redirectUrl: redirectUrl,
                      sender: sender,
                      merchantUrl: "https://paytool.fenige.pl/demo/",
                      orderNumber: "1",
                      autoClear: true)

fenigeSDKInstance.initPayment(environment: .production, apiKey: "0000-0000-0000-0000-0000", payment: payment, containerViewController: self, completion: { [weak self] (transactionId: String?, error: FenigeError?) in
  if let err = error {
    print("Error: " + err.localizedDescription)
  }

  let transactionIdText = transactionId ?? "NIL"
    print("Transaction ID: " + transactionIdText)
})
```

|Field|Type|Description|
|--|--|--|
|environment|Enum|Environment .development or .production
|apiKey|String|This is the value you receive from the payment gateway provider for production and staging environment. It is necessary to be identified in our system
|currencyCode|String|Currency for transaction (in accordance with ISO-4217), example: USD
|amount|Int|The total transfer amount (in pennies - 1PLN = 100)
|receiverAmount|String|Information field only. Field determine receiving amount of cash transferred in one hundredth of the currency. [1PLN = 100]
|description|String|Description of the transaction, which indicates what the user is paying for
|merchantUrl|String|URL address of merchant web system
|orderNumber|String|Declarative number of order that is just purchased by cardholder, set by merchant, should be unique
|formLanguage|String|Language of transaction process in web browser in accordance with ISO 3166-1 Alpha-2, use only lowercas
|redirectUrl.successUrl|String|URL of merchant web service to forward after successful payment flow
|redirectUrl.failureUrl|String|URL of merchant web service to forward after failure payment flow
|sender.firstName|String|Cardholder's first name
|sender.lastName|String|Cardholder's last name
|sender.adress.countryCode|String|Two character ISO 3166-1 alpha-2 code of country
|sender.adress.city|String|Name of the cardholder city
|sender.adress.postalCode|String|Postal code of this address
|sender.adress.street|String|Street name in the city
|sender.adress.houseNumber|String|House number with optional flat number
|transactionConfigurationId|String|Terminal’s unique uuid to process payment
|autoClear|Bool|Automaticly this parameter is on true. It mean that transaction will be cleared automaticly by fenige in few hours. You can set this parameter as false butyou must remember to clear your transaction.

### Init Apple Pay Payment

See an example project.

## Author

Fenige, fenige.mobile.sdk@gmail.com

## License

FenigeSDK is available under the MIT license. See the LICENSE file for more info.
