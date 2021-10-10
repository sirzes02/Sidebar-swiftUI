//
//  SideMenuView.swift
//  SideMenu
//
//  Created by Santiago Varela Mejía on 8/10/21.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                SideMenuHeaderView(isShowing: $isShowing)
                    .frame(height: 240)
                
                ForEach(SideMenuViewModel.allCases, id: \.self) { options in
                    NavigationLink(destination: Text(options.title), label: {
                        SideMenuOptionView(viewModel: options)
                    })
                }
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isShowing: .constant(true))
    }
}
