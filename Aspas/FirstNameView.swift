//
//  FirstNameView.swift
//  Aspas
//
//  Created by Palnar on 23/05/23.
//

import SwiftUI

struct FirstNameView: View {
    
    @State var firstName: String = ""
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.black)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack{
                ProgressView(progress: 1)
                
                Text("What's your first \n name?")
                    .modifier(GradientTextModifier(text: "What's your first \n name?", colors: [Color.red, Color.blue]))
                    .font(.largeTitle)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding(.top, 30)
                
                Spacer()
                
                TextField("First Name", text: $firstName)
                    .keyboardType(.asciiCapable)
                    .accentColor(.white)
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .focused($isTextFieldFocused)
                    .frame(height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(LinearGradient(gradient: Gradient(colors: [Color.customPink, Color.customBlue]), startPoint: .leading, endPoint: .trailing), lineWidth: 3))
                    .padding(.horizontal, 50)
                    .padding(.bottom, 50)
                
                Spacer()
                
                
                NavigationLink(destination: SwipeView()){
                    Text("Next")
                        .foregroundColor(firstName.count > 0 ? .white:.gray)
                        .padding(.horizontal, 60)
                        .frame(height: 30)
                        .background(
                            ZStack {
                                Capsule()
                                    .stroke(LinearGradient(gradient: Gradient(colors: firstName.count > 0 ? [Color.customPink, Color.customBlue]: [.gray, .gray]), startPoint: .leading, endPoint: .trailing), lineWidth: 3)
                                
                                Capsule()
                                    .fill(LinearGradient(gradient: Gradient(colors: firstName.count > 0 ? [Color.customPink.opacity(0.5), Color.customBlue.opacity(0.5)]: [.clear, .clear]), startPoint: .leading, endPoint: .trailing))
                            }
                        )
                }
                .disabled(firstName.count < 1)
                .padding(.bottom, 20)
                
            }
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isTextFieldFocused = true
            }
        })
        .onTapGesture {
            hideKeyboard()
    }
        .background(Color.gray)
        .navigationBarHidden(true)
    }
}

struct FirstNameView_Previews: PreviewProvider {
    static var previews: some View {
        FirstNameView()
    }
}

struct GradientTextModifier: ViewModifier {
    var text: String
    var colors: [Color]
    
    func body(content: Content) -> some View {
        let gradient = LinearGradient(
            gradient: Gradient(colors: colors),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        return content
            .foregroundColor(.clear)
            .overlay(
                Text(text)
                    .background(gradient)
                    .mask(content)
            )
    }
}
