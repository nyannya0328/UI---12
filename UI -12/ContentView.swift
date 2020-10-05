//
//  ContentView.swift
//  UI -12

//Share Sheet
//
//  Created by にゃんにゃん丸 on 2020/10/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    
    @State var itemes : [Any] = []
    
    @State var sheet = false
    var body: some View{
        
        VStack{
            
            Button(action: {
                
                itemes.removeAll()
                itemes.append(UIImage(named: "image")!)
                sheet.toggle()
                
                
                
            }, label:  {
                
                Image("image").resizable().frame(width: 150, height: 150).clipShape(Circle())
                
                
                
            })
            
        }
        .sheet(isPresented: $sheet, content: {
            sharesheet(items: itemes)
        })
      
        
    }
}


struct sharesheet : UIViewControllerRepresentable {
    
    let items : [Any]
    
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        return controller
        
        
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
    
}
