import SwiftUI
import SpriteKit

struct ContentView: View {
    
    var scene: SKScene{
       
        let scene = LevelSelector()
        scene.size = CGSize(width: 600, height: 1200)
        scene.scaleMode = .aspectFill
        return scene
    }
    
    var body: some View {

//        ZStack {
//            Color(cgColor: CGColor(red: 0, green: 1, blue: 0, alpha: 1))
//                .ignoresSafeArea(.all)
              SpriteView(scene: scene)
//                .scaledToFit()
//            ZStack
//            {
//                Text("hello new MateScout! Here we have to build a bridge. As you can see there are pieces of wood of various sizes. Click them to place it on the sea.")
//                    .frame(width: 600, height: 500, alignment: .center)
//                    .position(CGPoint(x: 300, y: 100))
//                    .foregroundColor(.black)
//                    .font(.largeTitle)
//            }
//        }
    }
}


