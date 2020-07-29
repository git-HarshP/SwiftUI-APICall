//
//  CountryListViewModel.swift
//  SwiftUI-APICall
//
//  Created by harshadp_MS021 on 28/07/20.
//  Copyright © 2020 com.HP. All rights reserved.
//

import Foundation


class CountryListViewModel: ObservableObject {
    
    @Published var arrCountries = [CountryModel]()
    
    typealias Completion = (_ status: Bool, _ message: String) -> Void
    
    func getCountryListAPICall(completion: @escaping Completion) {
        guard let url = URL(string: "https://restcountries.eu/rest/v2/all") else {
            completion(false, "Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let arrCountryList = try? JSONDecoder().decode([CountryModel].self, from: data) {
                    DispatchQueue.main.async {
                        self.arrCountries = arrCountryList
                    }
                    completion(true, "")
                    return
                }
            }
            completion(false, "\(error?.localizedDescription ?? "Unknown error")")
        }.resume()
        
    }
}
