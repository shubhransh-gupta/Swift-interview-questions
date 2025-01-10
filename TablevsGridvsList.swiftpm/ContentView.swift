import SwiftUI

struct ContentView: View {
  
    @State var data = [
            ("Apple", "Fruit", "$1.00"),
            ("Carrot", "Vegetable", "$0.50"),
            ("Milk", "Dairy", "$1.50")
        ]
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
    
        List {
                    // Header
            Text("Displsy using List")
                .fontWeight(.heavy)
            
                    HStack {
                        Text("Name").bold()
                        Spacer()
                        Text("Category").bold()
                        Spacer()
                        Text("Price").bold()
                    }
                    .padding()
                    
                    // Data Rows
                    ForEach(data, id: \.0) { item in
                        HStack {
                            Text(item.0)
                            Spacer()
                            Text(item.1)
                            Spacer()
                            Text(item.2)
                        }
                        .swipeActions(allowsFullSwipe: true, content: {
                            Button(action: {
                                data.reverse()
                            }) {
                                Text("Reverse")
                                    .foregroundStyle(Color.red)
                            }
                        })
                        .padding()
                    }
        }
        
        Grid {
                    GridRow {
                        Text("Name").bold()
                        Text("Category").bold()
                        Text("Price").bold()
                    }
                    Divider()
                    ForEach(data, id: \.0) { item in
                        GridRow {
                            Text(item.0)
                            Text(item.1)
                            Text(item.2)
                        }
                        Divider()
                    }
                }
                .padding()
        
        TableView()
    }
}

struct Item: Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let price: String
}


struct TableView: View {
   @State var items = [
        Item(name: "Apple", category: "Fruit", price: "$1.00"),
        Item(name: "Carrot", category: "Vegetable", price: "$0.50"),
        Item(name: "Milk", category: "Dairy", price: "$1.50")
   ].sorted(using: KeyPathComparator(\.price))

    @State var sortOrder = [KeyPathComparator(\Item.name)]
    var body: some View {
        NavigationStack {
            Table(items, sortOrder: $sortOrder) {
                TableColumn("Name", value: \.name)
                
                
                TableColumn("Category") { item in
                    Text(item.category)
                }
                
                
                TableColumn("Price") { item in
                    Text(item.price).bold()
                }
                
            }
            .padding()
            .onChange(of: sortOrder) { new in
                items.sort(using: new)
            }
            .navigationTitle("TableView")
        }
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TableView()
        }
    }
}
