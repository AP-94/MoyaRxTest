//
//  ViewController.swift
//  RxSwiftAndMova
//
//  Created by Alessandro Pace on 29/6/21.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    //MARK:: - OUTLETS -
    
    @IBOutlet weak var charactersTableView: UITableView!
    
    //MARK:: - VARS -
    
    private var homePresenter: HomePresenter?
    
    //MARK:: - OVERRIDE METHODS -
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        homePresenter = HomePresenter(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homePresenter = HomePresenter(delegate: self)
        setScreen()
    }
    
    // MARK: - @IBACTIONS -
    
    @IBAction func profileButtonTapped(_ sender: Any) {
        homePresenter?.pushNavigationToSettings()
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        
    }
    
    //MARK:: - METHODS -
    
    private func setScreen() {
        let nib = UINib(nibName: "CharacterCell", bundle: nil)
        charactersTableView.register(nib, forCellReuseIdentifier: CharacterCell.cellIdentifier)
        bindScreenTitle()
        bindTableViewData()
    }
    
    private func bindScreenTitle() {
        ///Subscribe to string in view model to change the title of view controller
        
        homePresenter?.screenTitle.subscribe(onNext: { [weak self] titleString in
            self?.title = titleString
        }).disposed(by: homePresenter?.bag ?? DisposeBag())
        
    }
    
    private func bindTableViewData() {
        ///Subscribe to list of characters, to observe when a change is made and update table view.
        
        homePresenter?.charactersList.bind(to: charactersTableView.rx.items(cellIdentifier: CharacterCell.cellIdentifier, cellType: CharacterCell.self)) { row, model, cell in
            cell.characterItem = model
            
        }.disposed(by: homePresenter?.bag ?? DisposeBag())
        
        charactersTableView.rx.modelSelected(Character.self).bind { [weak self] character in
            self?.openDetailScreen(of: character)
        }.disposed(by: homePresenter?.bag ?? DisposeBag())
        
        homePresenter?.fetchCharacters()
    }
    
    private func openDetailScreen(of character: Character) {
        homePresenter?.pushNavigationToDetail(withCharacter: character)
    }
}

extension HomeViewController: HomeDelegate {
    func pushScreen(screen: UIViewController) {
        self.navigationController?.pushViewController(screen, animated: true)
    }
    
    func changeScreenTitle(newTitle: String) {
        self.title = newTitle
    }
}
