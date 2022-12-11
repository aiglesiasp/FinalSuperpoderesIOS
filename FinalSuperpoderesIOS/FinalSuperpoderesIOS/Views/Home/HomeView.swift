//
//  HomeView.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel: HomeViewModel
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        NavigationStack {
            List {
                if let heros = homeViewModel.heros {
                    ForEach(heros) { hero in
                        NavigationLink {
                            //Navegar al detalle de las series testing
                            SeriesView(seriesViewModel: SeriesViewModel(testing: false, heroId: 0))
                            //Navegar al detalle de las series RED
                            //SeriesView(seriesViewModel: SeriesViewModel(heroId: hero.id))
                        } label: {
                            //Detalle de la row
                            HomeRowView(hero: hero)
                        }

                    }
                }
            }
            .toolbar{
                ToolbarItem (placement: .navigationBarTrailing) {
                    Button {
                        rootViewModel.closeSession()
                    } label: {
                        HStack {
                            Image(systemName: "xmark.circle")
                                .font(.caption)
                                .foregroundColor(.blue)
                            Text("Close Session")
                                .font(.caption)
                                .foregroundColor(.blue)
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
