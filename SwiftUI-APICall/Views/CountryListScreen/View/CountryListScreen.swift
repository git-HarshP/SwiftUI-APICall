//
//  CountryListScreen.swift
//  SwiftUI-APICall
//
//  Created by harshadp_MS021 on 28/07/20.
//  Copyright © 2020 com.HP. All rights reserved.
//

import SwiftUI

struct CountryListScreen: View {
    @ObservedObject var countryListViewModel = CountryListViewModel()
    @State private var isLoading = true
    
    var body: some View {
        
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Futura-Bold", size: 16)!]
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Futura-Bold", size: 32)!]
        UITableView.appearance().separatorStyle = .none
        
        countryListViewModel.getCountryListAPICall { (status, message) in
            self.isLoading = false
        }
        
        return NavigationView {
            ZStack {
                if isLoading {
                    StretchLoadingView()
                        .frame(width: 80, height: 32)
                }
                else {
                    List {
                        ForEach(self.countryListViewModel.arrCountries, id: \.name) { country in
                            CountryCell(countryName: country.name)
                        }
                    }
//                    .listSeparatorStyle(style: .none)
                }
            }
            .navigationBarTitle("Countries")
        }
    }
}

struct CountryListScreen_Previews: PreviewProvider {
    static var previews: some View {
        CountryListScreen()
    }
}
