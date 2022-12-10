//
//  LoginViewModel.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import Foundation
import Combine

final class RootViewModel: ObservableObject {
    @Published var status = Status.login
    @Published var heros: [Heros]?
    
    private var suscriptors = Set<AnyCancellable>()
    
    //MARK: FUNCION TEST LOGIN
    func loginSimulator() {
        self.status = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.status = .loaded
        }
    }
}
