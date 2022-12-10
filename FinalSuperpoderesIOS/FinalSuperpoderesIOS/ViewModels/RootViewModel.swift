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
    @Published var data: String = ""
    
    private var suscriptors = Set<AnyCancellable>()
    
    //MARK: EJEMPLO FUNCION LOGIN
    func login(user: String, password: String) {
        self.status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: NetworkHelper().getSessionLogin(user: user, password: password))
            .tryMap {
                //Compruebo el tipo de respuesta y si me da un error
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return String(decoding: $0.data, as: UTF8.self)
            }
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                    case .failure:
                        self.status = Status.error(error: "Error al cargar datos")
                    case .finished:
                        self.status = Status.loaded
                }
            } receiveValue: { data in
                self.data = data
                print("Data: \(data)")
            }
            .store(in: &suscriptors)

    }
    
    //MARK: FUNCION TEST LOGIN
    func loginTest() {
        self.status = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.status = .loaded
        }
    }
}
