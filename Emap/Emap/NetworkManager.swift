//
//  NetworkManager.swift
//  Emap
//
//  Created by Osama Farag on 13/03/2022.
//

import Foundation
import SwiftUI
class NetworkManager : ObservableObject{
    @Published var rides = [Rides]()
    @Published var stationCode = Int()
    @Published var ResultRides = [Result]()
    
    func fetchData(link : String){
        if let url = URL(string: link) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do{
                            if (link == "https://assessment.api.vweb.app/rides"){
                                let result = try decoder.decode([Rides].self, from: safeData)
                                DispatchQueue.main.async {
                                    self.rides = result
                                }
                            }else {
                                let result = try decoder.decode(User.self, from: safeData)
                                DispatchQueue.main.async {
                                    self.stationCode = result.station_code
                                }
                            }
                        }catch{
                            print(error)
                        }
                    }
                    
                }
            }
            task.resume()
        }
        
    }
    func Near(paths : [Rides] , userStation : Int) -> [Result]?{
        //var SortedRides : [Result] = []
        //        let sameDistacnce = paths[0].station_path.min(by: { abs($0 - userStation) <  abs($1 - userStation) } )!
        //
        //        SortedRides[0] = Result(station_code: userStation, id: paths[0].id, origin_station_code: paths[0].origin_station_code, station_path: paths[0].station_path, destination_station_code: paths[0].destination_station_code, date: paths[0].date, map_url: paths[0].map_url, state: paths[0].state, city: paths[0].city, nearst: sameDistacnce )
        
        for path in paths {
            
            if let sameDistacnce = path.station_path.min(by: { abs($0 - userStation) <  abs($1 - userStation) } )
            {
                if (ResultRides.contains(where: {$0.nearst == sameDistacnce}) == false )
                {
                    ResultRides.append(Result(station_code: userStation, id: path.id, origin_station_code: path.origin_station_code, station_path: path.station_path, destination_station_code: path.destination_station_code, date: path.date, map_url: path.map_url, state: path.state, city: path.city, nearst: sameDistacnce))
                }
            }
        }
        //        ForEach(ResultRides){ resutl in
        //            if SortedRides.contains(where: { $0.nearst != resutl.nearst })
        //            {
        //                ResultRides.append(resutl)
        //            }
        //        }
        //        return ResultRides.sorted(by: {$0.nearst < $1.nearst})
        //    }
        return ResultRides.sorted(by: {$0.nearst < $1.nearst})
    }
}

