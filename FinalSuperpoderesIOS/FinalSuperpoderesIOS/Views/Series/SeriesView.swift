//
//  SeriesView.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import SwiftUI

struct SeriesView: View {
    //viewmodel de series
    @StateObject var seriesViewModel: SeriesViewModel
    
    
    var body: some View {
        NavigationStack {
            List {
                if let series = seriesViewModel.series {
                    ForEach(series) { serie in
                        NavigationLink {
                            //Vista a la que navegamos
                            SeriesDetailView(serie: serie)
                        } label: {
                            SeriesRowView(serie: serie)
                        }
                    }
                }
            }
            .id(2)
        }
        .id(1)
        
    }
}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(seriesViewModel: SeriesViewModel(testing: true, heroId: 0))
    }
}
