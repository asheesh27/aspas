//
//  FirstNameView.swift
//  Aspas
//
//  Created by Palnar on 23/05/23.
//

import SwiftUI

struct ProgressView: View {
    
    var progress: Int
    var body: some View {
        HStack {
            Button(action: {
                // Perform action for chevron left arrow button
            }) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .accentColor(.gray)
            }
            
            ForEach(1...3, id: \.self) { index in
                Capsule()
                    .foregroundColor(.clear).background(
                        LinearGradient(
                            gradient: Gradient(colors: index <= progress ? [Color.customPink, Color.customBlue] : [.gray.opacity(0.2),.gray.opacity(0.2)]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .mask(Capsule())
                    )
                    .frame(height: 8)
            }
            
            Button(action: {
                // Perform action for info circle button
            }) {
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .accentColor(.gray)
            }
        }
        .frame(height: 50)
        .padding(.horizontal, 15)
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(progress: 1)
    }
}
