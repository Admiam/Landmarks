/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
//        AnyTransition.move(edge: .trailing)
        .asymmetric(
                    insertion: .move(edge: .trailing).combined(with: .opacity),
                    removal: .scale.combined(with: .opacity)
                )
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button {
                    withAnimation {
//                    (.easeInOut(duration: 4))
                    
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
//                        .animation(nil, value: showDetail)
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
//                        .animation(.spring(), value: showDetail)
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)

            }
        }
    }
}

#Preview {
    VStack {
        HikeView(hike: ModelData().hikes[0])
            .padding()
        Spacer()
    }
}
