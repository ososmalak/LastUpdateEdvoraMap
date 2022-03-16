//
//  SwiftUIView.swift
//  Emap
//
//  Created by Osama Farag on 13/03/2022.
//
import Foundation
import SwiftUI

struct SelectedRide: View {
    var dataPassed : Result?
    var body: some View {
        VStack(alignment: .center){
            if let safedData = dataPassed {
                AsyncImage(url: URL(string: safedData.map_url))
                HStack{
                    TextView(t1: "Ride Id", t2: String(safedData.id))
                    Spacer()
                    TextView(t1:"Station Code", t2:String(safedData.origin_station_code))
                }.padding()
                Divider()
                HStack{
                TextView(t1: "Date", t2: safedData.date)
                    Spacer()
                TextView(t1: "Distance    ", t2: String(safedData.nearst))
                }.padding()
                Divider()
                HStack{
                TextView(t1: "State", t2: safedData.state)
                    Spacer()
                TextView(t1: "City        " , t2: safedData.city)
                }.padding()
                Divider()
                Text("Station Path")
                    .font(.subheadline)
                HStack{
                    ForEach(dataPassed!.station_path , id: \.self)  { SP in
                        Text(String(SP))
                    }
                }.font(.headline)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedRide(dataPassed: nil)
    }
}

