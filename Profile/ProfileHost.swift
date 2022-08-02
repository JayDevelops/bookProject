//
//  ProfileHost.swift
//  Bookstore
//
//  Created by Luke Williams on 7/26/22.
//

import SwiftUI

struct ProfileHost: View {
    
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: BookModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10)
        {
            HStack {
                if editMode?.wrappedValue == .active
                {
                    Button("Cancel")
                    {
                        draftProfile = modelData.profile
                        editMode?.wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive
            {
                ProfileDisplay(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
            Spacer()
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(BookModelData())
    }
}
