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
                        NavigationLink {
                            //Navegar al detalle de las series
                            SeriesView(seriesViewModel: SeriesViewModel(testing: true))
                        } label: {
                            //Detalle de la row
                            HomeRowView(hero: hero)
                        }

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
