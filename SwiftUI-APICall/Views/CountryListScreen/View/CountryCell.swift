//
//  CountryCell.swift
//  SwiftUI-APICall
//
//  Created by harshadp_MS021 on 29/07/20.
//  Copyright © 2020 com.HP. All rights reserved.
//

import SwiftUI

struct CountryCell: View {
    
    let countryName: String
    
    var body: some View {
        VStack {
            Text(countryName)
                .font(.custom("Futura", size: 16))
//                .foregroundColor(Color.black)
                .padding([.top, .bottom], 8)
                .padding([.leading, .trailing], 16)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color(UIColor.systemBackground))
        .cornerRadius(4)
        .shadow(color: .secondary, radius: 2, x: 0, y: 2)
//        .padding([.leading, .trailing], 16)
    }
}

struct CountryCell_Previews: PreviewProvider {
    static var previews: some View {
        CountryCell(countryName:  "India")
    }
}
