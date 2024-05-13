import Foundation


class TabsModel: ObservableObject {
    let webPageTab = WebPageTab()
    @Published var tabList: [WebPageTab] = []
    @Published var activeTab: WebPageTab?
}
