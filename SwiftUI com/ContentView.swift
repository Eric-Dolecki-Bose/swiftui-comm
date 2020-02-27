//
//  ContentView.swift
//  SwiftUI com
//
//  Created by Eric Dolecki on 2/27/20.
//  Copyright © 2020 Eric Dolecki. All rights reserved.
//

import SwiftUI

class SomeView: UIView {
    
    func foo() {
        print("foo was called.")
        self.backgroundColor = UIColor(hue: CGFloat(drand48()), saturation: 1, brightness: 1, alpha: 1)
    }
}
 
struct SomeViewRepresentable: UIViewRepresentable
{
    let someView = SomeView()
  
    func makeUIView(context: Context) -> SomeView {
        someView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        someView.backgroundColor = UIColor.lightGray
        return someView
    }
    
    func updateUIView(_ uiView: SomeView, context: Context) {
        //
    }
 
    func callFoo() {
        someView.foo()
    }
}
 
struct ContentView : View {
    let someView = SomeViewRepresentable()
    var body: some View {
      VStack(alignment: .center, spacing: 24) {
        someView
            .background(Color(.lightGray))
            .edgesIgnoringSafeArea(.all)
            .overlay (
                Text("UIView Here.")
                ,alignment: .center)
        HStack {
          Button(action: {
            self.someView.callFoo()
          }) {
            Text("Tap to call color on UIView")
          }
        }
      }
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
