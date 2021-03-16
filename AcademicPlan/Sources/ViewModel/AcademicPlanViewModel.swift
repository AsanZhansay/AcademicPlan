//
//  AcademicPlanViewModel.swift
//  AcademicPlan
//
//  Created by Asanali Zhansay on 16.03.2021.
//

import Foundation

class AcademicPlanViewModel {
    
    var object: AcademicPlan?
    
    init() {
        guard let data = readLocalFile(forName: "data") else { return }
        let object = parse(jsonData: data)
        
        self.object = object
    }
}

extension AcademicPlanViewModel {
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    private func parse(jsonData: Data) -> AcademicPlan? {
        do {
            let decodedData = try JSONDecoder().decode(AcademicPlan.self, from: jsonData)
            return decodedData
        } catch {
            print("decode error")
            return nil
        }
    }
}
