//
//  SwipeView.swift
//  Aspas
//
//  Created by Palnar on 23/05/23.
//

import SwiftUI

struct SwipeView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.black)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack{
                ProgressView(progress: 2)
                
                Spacer()
            }
        }
        .background(Color.gray)
        .navigationBarHidden(true)
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
