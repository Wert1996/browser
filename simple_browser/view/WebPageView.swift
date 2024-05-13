import SwiftUI

struct WebPageView: View {
    @State private var webAddress: String = ""
    @ObservedObject var webPageModel: WebPageTab // Use @ObservedObject to observe changes
    
    var body: some View {
        VStack {
            TextField("Enter Web Address", text: $webAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                self.webPageModel.pageTitle = self.webAddress
            }, label: {
                Image(systemName: "magnifyingglass.circle.fill")
                    .font(.title)
            })
            .padding()
            
            WKView(webPageModel: webPageModel)
                .frame(minWidth: 800, minHeight: 600)
                .padding()
        }
    }
}
