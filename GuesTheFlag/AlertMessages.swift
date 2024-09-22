//
//  AlertMessages.swift
//  GuesTheFlag
//
//  Created by Joan May on 20/09/24.
//

import SwiftUI

struct AlertMessages: View {
    @State var showAlert: Bool = false
    var body: some View {
        
        Button("Show alert!"){
            showAlert = true
        }
        .alert("Important messange", isPresented: $showAlert) {
            Button("Delete", role: .destructive) {}
            Button("Cancel", role: .cancel){}
        } message: {
            Text("Please read this.")
        }
    }
}

#Preview {
    AlertMessages()
}
