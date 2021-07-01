//
//  HomeViewModel.swift
//  RxSwiftAndMova
//
//  Created by Alessandro Pace on 29/6/21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Moya

protocol HomeDelegate: NSObjectProtocol {
    func changeScreenTitle(newTitle: String)
    func pushScreen(screen: UIViewController)
}

class HomePresenter: NSObject {
    
    //MARK:: - VARS -
    
    weak private var homeDelegate: HomeDelegate?
    var charactersList = PublishSubject<[Character]>()
    let charactersProvider = MoyaProvider<CharactersService>()
    var screenTitle = PublishSubject<String>()
    var bag = DisposeBag()
    
    //MARK:: - METHODS -
    
    init(delegate: HomeDelegate) {
        self.homeDelegate = delegate
    }
    
    func fetchCharacters(mock: Bool = false) {
        changeViewControllerTitle()
        
        if mock {
            let characters = [Character(name: "John", birth_year: "", eye_color: "", gender: "Male", hair_color: "", height: "", mass: "", skin_color: "", homeworld: "", films: [], species: [], starships: [], vehicles: []),
                              Character(name: "Jenny", birth_year: "", eye_color: "", gender: "Female", hair_color: "", height: "", mass: "", skin_color: "", homeworld: "", films: [], species: [], starships: [], vehicles: [])]
            
            charactersList.onNext(characters)
            charactersList.onCompleted()
        } else {
            charactersProvider.rx.request(.getCharacters)
                .map(CharactersResponse.self)
                .subscribe { [weak self] characterResponse in
                    self?.charactersList.onNext(characterResponse.results ?? [])
                    self?.charactersList.onCompleted()
                } onError: { error in
                    print("ERROR IN REQUEST -> \(error)")
                }.disposed(by: bag)

            
            ///Same Moya request without RxMoya
//            charactersProvider.request(.getCharacters) { result in
//                switch result {
//                case.success(let response):
//                    if let charactesResponse = try? JSONDecoder().decode(CharactersResponse.self, from: response.data) {
//                        self.charactersList.onNext(charactesResponse.results ?? [])
//                        self.charactersList.onCompleted()
//                    }
//                case .failure(let error):
//                    print("ERROR IN REQUEST -> \(error)")
//                }
//            }
        }
    }
    
    func changeViewControllerTitle() {
        ///Example of a observable String.
        screenTitle.onNext("Star Wars API")
        screenTitle.onCompleted()
    }
    
    func pushNavigationToDetail(withCharacter: Character) {
        let detailViewController = getViewController(viewControllerIdentifier: "DetailViewController", storyBoardName: "Main") as! DetailViewController
        detailViewController.character = withCharacter
        homeDelegate?.pushScreen(screen: detailViewController)
    }
    
    func pushNavigationToSettings() {
        let viewController = getViewController(viewControllerIdentifier: "SettingsViewController", storyBoardName: "Settings") as! SettingsViewController
        homeDelegate?.pushScreen(screen: viewController)
    }
}

