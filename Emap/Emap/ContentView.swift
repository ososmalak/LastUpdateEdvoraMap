//
//  ContentView.swift
//  Emap
//
//  Created by Osama Farag on 13/03/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            VStack{
                HStack(spacing: 20) {
                    Button("Nearst"){
                        
                    }.foregroundColor(.black)
                    Button("Upcoming") {
                        
                    }
                    .foregroundColor(.black)
                    Button("Past") {
                        
                    }
                    .foregroundColor(.black)
                    .padding()
                    VStack{
                        Menu("Filter") {
                            Button(action: {
                               
                                
                            })
                            {
                                Text("State")
                                Image("DropDown")
                            }
                            
                            Button(action: {})
                            {
                                Text("City")
                                Image("DropDown")
                                
                            }
                            
                        }
                        
                    }
                }
                
                List(networkManager.Near(paths: networkManager.rides, userStation: networkManager.stationCode)!)
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
                .navigationBarTitle("Edvora")
            }
        }
        .onAppear{
            networkManager.fetchData(link: "https://assessment.api.vweb.app/rides")
            networkManager.fetchData(link: "https://assessment.api.vweb.app/user")
        }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
