//
//  HomeView.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel: HomeViewModel
    
    var body: some View {
        NavigationStack {
            List {
                if let heros = homeViewModel.heros {
                    ForEach(heros) { hero in
                        Text(hero.name)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeViewModel: HomeViewModel(testing: true))
    }
}
