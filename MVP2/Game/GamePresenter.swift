//
//  Presenter.swift
//  MVP2
//
//  Created by Adlet Zhantassov on 30.03.2023.
//

import Foundation

protocol PresenterView: AnyObject {
    func updateGame(_ model: GameViewData)
}

class Presenter {
    
    weak var view: PresenterView?
    
    init(with view: PresenterView) {
        self.view = view
    }
    
    let csgo = Game(name: "CSGO", year: "1978", author: "Gabe Newell")
    ///какие то действия
    
    func startGame() {
        let game = GameViewData(name: csgo.name)
        view?.updateGame(game)
    }
}
