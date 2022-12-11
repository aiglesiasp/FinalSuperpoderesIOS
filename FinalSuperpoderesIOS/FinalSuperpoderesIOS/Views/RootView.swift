//
//  RootView.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    var body: some View {
        switch rootViewModel.status {
        case Status.login:
            LoginView()
        case Status.loading:
            LoadingView()
        case Status.error(error: let errorString):
            ErrorView(errorString: errorString)
        case Status.loaded:
            HomeView(homeViewModel: HomeViewModel(testing: false))
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(RootViewModel())
    }
}
