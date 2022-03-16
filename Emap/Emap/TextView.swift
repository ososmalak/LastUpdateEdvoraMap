//
//  TextView.swift
//  Emap
//
//  Created by Osama Farag on 16/03/2022.
//

import SwiftUI

struct TextView: View {
    let t1 : String
    let t2 : String
    var body: some View {
        VStack(alignment: .leading){
            Text(t1)
                .font(.subheadline)
            Text(t2)
                .font(.headline)
        }
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(t1: "", t2: "")
    }
}
