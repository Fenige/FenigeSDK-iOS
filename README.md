# FenigeSDK

[![Version](https://img.shields.io/cocoapods/v/FenigeSDK.svg?style=flat)](https://cocoapods.org/pods/FenigeSDK)
![Swift 5.0+](https://img.shields.io/badge/Swift-5.0%2B-orange.svg)
![iOS 12.0+](https://img.shields.io/badge/iOS-12.0%2B-blue.svg)
[![Platform](https://img.shields.io/cocoapods/p/FenigeSDK.svg?style=flat)](https://cocoapods.org/pods/FenigeSDK)

## System Requirements
iOS 12.0 or above

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
let redirectUrl = RedirectUrl(successUrl: "https://paytool-dev.fenige.pl/demo/?success=1",
                              failureUrl: "https://paytool-dev.fenige.pl/demo/?success=0")

let address = Address(countryCode: "PL",
                      city: "Testowo",
                      postalCode: "12-345",
                      street: "Testowa",
                      houseNumber: "1")

let sender = Sender(firstName: "Test",
                    lastName: "Testowy",
                    address: address)

let payment = Payment(transactionId: "39c92ae5-90bc-4a9f-9a29-661d958ffa41",
                      currencyCode: "USD",
                      amount: 10,
                      description: "Test transaction",
                      formLanguage: "en",
                      redirectUrl: redirectUrl,
                      sender: sender,
                      merchantUrl: "https://paytool-dev.fenige.pl/demo/",
                      orderNumber: "1")

fenigeSDKInstance.initPayment(apiKey: "0000-0000-0000-0000-0000", payment: payment, containerViewController: self, completion: { [weak self] (transactionId: String?) in
    let transactionIdText = transactionId ?? "NIL"
    print("Transaction ID: " + transactionIdText)
})
```

## Author

Fenige, fenige.mobile.sdk@gmail.com

## License

FenigeSDK is available under the MIT license. See the LICENSE file for more info.
