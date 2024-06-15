import SwiftUI
import PhotosUI

struct TabView_TabItems: View {
    var body: some View {
        TabView {
            BMenu()
                .tabItem {
                    Image(systemName: "fork.knife.circle")
                    Text("Menus")
                }
            TabFour()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            appearance.backgroundColor = UIColor(Color.green.opacity(0.2))
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

#Preview {
    TabView_TabItems()
}
