//
//  ContentView.swift
//  Aspas
//
//  Created by Palnar on 22/05/23.
//

import SwiftUI

struct MobileNumberView: View {
    @State private var number: String = ""
    
    var body: some View {
        NavigationView{
            ZStack {
                Rectangle()
                    .fill(Color.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
                VStack{
                    Text("What's your phone number?")
                        .font(.largeTitle)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(.top, 50)
                    
                    Text("You'll get an OTP. Your OTP is not visible to others.")
                        .font(.title2)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                    
                    Spacer()
                    
                    
                    HStack {
                        Image("flag")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 30)
                            .padding(.leading, 20)
                        
                        TextField("", text: $number)
                            .keyboardType(.numberPad)
                            .accentColor(.white)
                            .font(.system(size: 30))
                            .tracking(3)
                            .foregroundColor(.white)
                            .frame(height: 50)
                            .padding(.horizontal, 25)
                            .onChange(of: number) { newValue in
                                if newValue.count > 10 {
                                    number = String(newValue.prefix(10))
                                }
                            }
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(LinearGradient(gradient: Gradient(colors: [Color.customPink, Color.customBlue]), startPoint: .leading, endPoint: .trailing), lineWidth: 3))
                    .padding(.top, 50)
                    .padding(.bottom, 50)
                    
                    Spacer()
                    
                    NavigationLink(destination: FirstNameView()){
                        Text("Next")
                            .foregroundColor(number.count == 10 ? .white:.gray)
                            .padding(.horizontal, 60)
                            .frame(height: 30)
                            .background(
                                ZStack {
                                    Capsule()
                                        .stroke(LinearGradient(gradient: Gradient(colors: number.count == 10 ? [Color.customPink, Color.customBlue]: [.gray, .gray]), startPoint: .leading, endPoint: .trailing), lineWidth: 3)
                                    
                                    Capsule()
                                        .fill(LinearGradient(gradient: Gradient(colors: number.count == 10 ? [Color.customPink.opacity(0.5), Color.customBlue.opacity(0.5)]: [.clear, .clear]), startPoint: .leading, endPoint: .trailing))
                                }
                            )
                    }
                    .disabled(number.count != 10)
                    .padding(.bottom, 20)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .multilineTextAlignment(.center)
                .padding(10)
            }
            .onTapGesture {
                hideKeyboard()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MobileNumberView()
    }
}

func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}
