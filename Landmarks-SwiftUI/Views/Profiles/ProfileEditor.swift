//
//  ProfileEditor.swift
//  Landmarks-SwiftUI
//
//  Created by Hitesh on 27/07/24.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profileData: Profile
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                Spacer()
                TextField("g_kumar", text: $profileData.username)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            
            Toggle(isOn: $profileData.prefersNotifications) {
                Text("Enable Notifications")
            }
            
            Picker("Seasonal Photo", selection: $profileData.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue)
                        .tag(season)
                }
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profileData: .constant(.default))
    }
}
