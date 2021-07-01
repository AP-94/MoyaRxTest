# MoyaRxTest
This project purpose is to test the Moya, MoyaRx and RxSwift libraries and also the structure of the project is MVP.
 
 ## App Structure
 
 The app is very simple, just 2 ViewController, one for the home and another one for the detail view. The home only have a table view, this table is populeted by data from the network, and for that we use RxSwift, to observe the list in the presenter and whenever a change its done, the table view will reload its data. For testing MoyaRx we setup a request to the network and we observe the result, is the result is succesfully mapped we fill our list, if not, throw an error.
 
 ## Data
 
 The data used in this project is fetched from swapi, the Star Wars API. You can find more about it in his website https://swapi.dev
 
 ## Cocoapods
 
 For the project we used cocoapods, so remember to run the xcworkspace. The podfile config contains:
 
 ```
  pod ‘RxSwift’, ‘~> 5.1.0’
  pod ‘RxCocoa’, ‘~> 5.1.0’
  pod ‘Moya/RxSwift’, ‘~> 14.0’
 ```
