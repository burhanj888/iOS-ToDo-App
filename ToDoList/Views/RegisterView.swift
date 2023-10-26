//
//  RegisterView.swift
//  ToDoList
//
//  Created by Burhanuddin Jinwala on 10/25/23.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        
        VStack{
            HeaderView(title: "Register", subTitle: "Start Organizing To Dos", angle: -15, background: .orange)
            
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create Account", background: .green){
                    //Attempt registration
                    viewModel.register()
                }
                
            }
            .offset(y: -50)
            
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
