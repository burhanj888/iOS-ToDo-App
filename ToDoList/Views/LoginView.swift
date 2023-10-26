//
//  LoginView.swift
//  ToDoList
//
//  Created by Burhanuddin Jinwala on 10/25/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "To Do List", subTitle: "Get Things Done", angle: 15, background: .pink)
                
                
                //LoginForm
                Form{
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TLButton(title: "Log In", 
                             background: .blue){
                        viewModel.login()
                        //Attempt Log in
                    }
                }
                .offset(y: -50)
                //Create Account
                
                VStack{
                    Text("New around Here?")
                    
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
