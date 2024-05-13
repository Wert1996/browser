import SwiftUI

struct ContentView: View {
    @StateObject var tabs: TabsModel = TabsModel()
    
    var body: some View {
        VStack {
            HStack {
                ForEach(tabs.tabList) { tab in
                        Button(action: {
                            DispatchQueue.main.async {
                               tabs.activeTab = tab
                           }
                        }, label: {
                            Text(tab.pageTitle)
                                .font(.title)
                        })
                        .padding()
                }
                Button(action: {
                    let newWebPageTab = WebPageTab()
                    newWebPageTab.pageTitle = "https://google.com"
                    tabs.tabList.append(newWebPageTab)
                    DispatchQueue.main.async {
                       tabs.activeTab = newWebPageTab
                   }
                }, label: {
                    Text("Add a new tab")
                        .font(.title)
                })
                .padding()
                    
            }.padding()
            
            if tabs.activeTab != nil && tabs.activeTab?.pageTitle != "" {
                WebPageView(webPageModel: tabs.activeTab!)
                    .frame(minWidth: 800, minHeight: 600)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
