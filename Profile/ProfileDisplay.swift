//
//  ProfileDisplay.swift
//  Bookstore
//
//  Created by Luke Williams on 7/26/22.
//

import SwiftUI

struct ProfileDisplay: View {
    
    var profile: Profile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10)
        {
            Text(profile.username)
                .bold()
                .font(.title)
            Text("Notifications: \(profile.prefersNotifications ? "Yes": "No")")
            Text("Preferred Genre: \(profile.preferredGenre)")
            Text("Last Updated: \(profile.updateDate)")
        }
    }
}

struct ProfileDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDisplay(profile: Profile.default)
    }
}
