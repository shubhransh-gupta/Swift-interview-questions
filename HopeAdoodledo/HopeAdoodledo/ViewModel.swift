//
//  ViewModel.swift
//  HopeAdoodledo
//
//  Created by Shubhransh Gupta on 15/01/25.
//

import UIKit


protocol ViewDecoratorDelegate: AnyObject {
    func didUpdateCellContent(for driver: Driver)
    func didUpdateCellContent(for user: User)
}

final class ViewModel {
    let delegate: ViewDecoratorDelegate?
    let networkManager: NetworkDataProviderDelegate?
    
    init(delegate: ViewDecoratorDelegate?, networkManager: NetworkDataProviderDelegate?) {
        self.delegate = delegate
        self.networkManager = networkManager
    }
    
    func callUserAPIForCorrespondingIndex(index: Int) {
        networkManager?.fetchUser(param: String(index), completion: { [weak self] (response: Result<User, Error>) in
            switch response {
            case .success(let data):
                self?.delegate?.didUpdateCellContent(for: data)
            case .failure(let error):
                print("error", error)
            }
        })
    }
    
    func callDriverAPIForCorrespondingIndex(index: Int) {
        networkManager?.fetchDriver(param: String(index), completion: { [weak self] (response: Result<Driver, Error>) in
            switch response {
            case .success(let data):
                self?.delegate?.didUpdateCellContent(for: data)
            case .failure(let error):
                print("error", error)
            }
        })
    }
    
}
