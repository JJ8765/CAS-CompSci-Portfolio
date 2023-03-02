
import SwiftUI

struct DraggableImage: View {
    @State private var offset = CGSize.zero
    @State private var lastOffset = CGSize.zero
    
    let imageName: String
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                self.offset = CGSize(
                    width: value.translation.width + self.lastOffset.width,
                    height: value.translation.height + self.lastOffset.height
                )
            }
            .onEnded { value in
                self.lastOffset = self.offset
            }
        
        return Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .offset(offset)
            .gesture(dragGesture)
    }
}

struct DragView: View {
    let imageNames = ["image1", "image2", "image3", "image4", "image5", "image6", "image7", "image8", "image9"]
    
    var body: some View {
            Text("Assemble The Puzzle:")
        
                ForEach(imageNames, id: \.self) { imageName in
                    DraggableImage(imageName: imageName)
        }
    }
}

