//
//  destitationList.swift
//  Emap
//
//  Created by Osama Farag on 16/03/2022.
//

import SwiftUI

struct destitationList: View {
    let paths : [Rides]?
    let userS : Int?
    var networkManager2 : NetworkManager?
    var body: some View {
        if let networkManager = networkManager2 {
            List(networkManager.Near(paths: paths!, userStation: userS!)!)
            { ride in
                NavigationLink(destination: SelectedRide(dataPassed:ride)){
                    
                    VStack{
                        AsyncImage(url: URL(string: ride.map_url))
                            .aspectRatio(contentMode: .fill)
                        HStack{
                            Text("#")
                                .foregroundColor(.blue)
                            Text(String(ride.id))
                            Spacer()
                            Image("date")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .leading)
                            Text(ride.date)
                        }
                    }
                }
            }
        }
    }
}

struct destitationList_Previews: PreviewProvider {
    static var previews: some View {
        destitationList(paths: nil, userS: nil)
    }
}
