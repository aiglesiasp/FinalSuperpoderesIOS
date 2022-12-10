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
                            Text("PANTALLA DE DETALLE DE SERIES \(serie.items[0].name)")
                            
                        } label: {
                            //Detalle de la ROW
                            SeriesRowView(serie: serie)
                        }
                    }
                }
            }
        }
        
    }
}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(seriesViewModel: SeriesViewModel(testing: true))
    }
}
