//
//  GlobalFunctions.swift
//  RxSwiftAndMoya
//
//  Created by Alessandro Pace on 1/7/21.
//

import Foundation
import UIKit

internal func getViewController(viewControllerIdentifier: String, storyBoardName: String) -> UIViewController {
    let storyBoard : UIStoryboard = UIStoryboard(name: storyBoardName, bundle:nil)
    return storyBoard.instantiateViewController(withIdentifier: viewControllerIdentifier)
}
