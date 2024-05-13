import Foundation


//class Tab: ObservableObject {
//    @Published var defaultTab: Bool = true
//}

class WebPageTab: Identifiable, ObservableObject {
    @Published var pageTitle: String = "https://google.com"
    let id: UUID = UUID()
    
//    init(pageTitle: String) {
//        self.pageTitle = pageTitle
//    }
}
