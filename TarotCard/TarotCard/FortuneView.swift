//
//  FortuneList.swift
//  TarotCard
//
//  Created by Jaden Lin on 1/23/23.
//

import SwiftUI

struct FortuneView: View {
    @State var imageURL = "https://picsum.photos/300/300"
    @State var fortune: Fortune?
    
    var body: some View {
        if let fortune = fortune {
            ZStack{
                Image("YuGiOhcard")
                VStack{
                    AsyncImage(url: URL(string: imageURL)).position(x: 150, y: 268)
                    Spacer()
                    Text(fortune.cookie.fortune)
                        .position(x: 150, y: 290)
                        .multilineTextAlignment(.center)
                    Button{
                        imageURL = "https://picsum.photos/300/300?random=\(Int.random(in: 0...1000))"
                        loadFortuneData()
                    } label: {
                        Label("New Fortune", systemImage: "plus")
                    }.position(x: 150,y: 142)
                }.frame(width: 300, height: 600)
            }
        } else {
            Text("Loading...")
                .onAppear {
                    self.loadFortuneData()
                }
        }
    }
    
    func loadFortuneData() {
        let url = URL(string: "https://digital-fortune-cookies-api.herokuapp.com/fortune")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let fortune = try decoder.decode(Fortune.self, from: data)
                    DispatchQueue.main.async {
                        self.fortune = fortune
                    }
                } catch {
                    print("Error: \(error)")
                }
            }
        }
        task.resume()
    }
}

struct FortuneList_Previews: PreviewProvider {
    static var previews: some View {
        FortuneView()
    }
}
