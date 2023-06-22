import SwiftUI

struct MainView: View {
  
  @State var selectedTab: Tab = .home
  
  var body: some View {
    ZStack {
      tabView
    }
  }
  
  @ViewBuilder
  var tabView: some View {
    VStack {
      switch selectedTab {
      case .home:
        HomeView()
      case .sleep:
        SleepView()
      case .meditateTab:
        MeditateView()
      case .profile:
        ProfileView()
      }
      CustomTabBar(selectedTab: $selectedTab)
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
