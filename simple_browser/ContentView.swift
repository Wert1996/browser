import SwiftUI

struct ContentView: View {
    @State var webViewStateModel: WebViewStateModel = WebViewStateModel()
    @State private var webAddress = "http://google.com"

    var body: some View {
        VStack {
            TextField("Enter Web Address", text: $webAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                webViewStateModel.pageTitle = webAddress
            }, label: {
                Image(systemName: "magnifyingglass.circle.fill")
                    .font(.title)
            })
            .padding()

            WKView(webViewStateModel: webViewStateModel)
                .frame(minWidth: 800, minHeight: 600)

            HStack {
                Button(action: {
                    webViewStateModel.goBack = true
                }, label: {
                    Image(systemName: "arrow.backward")
                })

                Button(action: {
                    webViewStateModel.goForward = true
                }, label: {
                    Image(systemName: "arrow.forward")
                })
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
