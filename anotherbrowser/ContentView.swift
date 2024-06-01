import SwiftUI


struct ContentView: View {
//    @StateObject var navigationState = NavigationState()
    @StateObject var navigationState = NavigationState()
    @State var webAddress: String = "Enter something my man"
    @FocusState private var addressIsFocused: Bool
    
    var body: some View {
        HStack(alignment: VerticalAlignment.top) {
            VStack(spacing: 0){
                HStack(spacing: 0) {
                    Button(action: {
                        navigationState.selectedWebView?.goBack()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .padding(10)
                    
                    Button(action: {
                        navigationState.selectedWebView?.goForward()
                    }) {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .padding(10)
                    
                    Button(action: {
                        navigationState.createNewWebView(withRequest: URLRequest(url: URL(string: "https://www.google.com")!))
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .padding(10)
                    
                }.padding(0).frame(alignment: .topLeading)
                
                TextField(
                        "Internet pin",
                        text: $webAddress
                    )
                    .focused($addressIsFocused)
                    .onSubmit {
                        navigationState.selectedWebView?.load(URLRequest(url: URL(string: webAddress)!))
                    }
                    .disableAutocorrection(true)
                    .border(Color.blue)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                
//                Text(navigationState.currentURL?.absoluteString ?? "").padding(5)
                
                List {
                    ForEach(navigationState.webViews, id: \.self) { tab in
                        Button(action: {
                            navigationState.selectedWebView = tab
                        }) {
                            Text(tab.url?.absoluteString ?? "?")
                        }.padding(10)
                    }
                }.listStyle(PlainListStyle())
                 .scrollContentBackground(.hidden)
                
//                Button(action: {
//                    navigationState.createNewWebView(withRequest: URLRequest(url: URL(string: "https://www.google.com")!))
//                }) {
//                    Text("Create a new tab").cornerRadius(0).frame(width: .infinity)
//                }.frame(maxWidth: .infinity).background(Color.blue)
//                .padding(0)
//                .background(Color.blue)
            }.frame(width: 150).padding().frame(alignment: .topLeading)
                .background(
                    Image("wall")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                )
            WebView(navigationState: navigationState)
            //                .frame(minWidth: 400, minHeight: 400)
                .clipped()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
