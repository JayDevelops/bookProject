//
//  ProfileEditor.swift
//  Bookstore
//
//  Created by Luke Williams on 7/26/22.
//

import SwiftUI

struct ProfileEditor: View {
    
    @Binding var profile: Profile

    var body: some View {
        List
        {
            HStack(spacing: 10)
            {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications)
            {
                Text("Enable Notifications").bold()
            }
            
            HStack {
                Text("Preferred Genre")
                Spacer()
                Picker("Select", selection: $profile.preferredGenre)
                {
                    ForEach(Profile.Genre.allCases)
                    {
                        genre in Text(genre.rawValue).tag(genre)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
