//
//  ContentView.swift
//  ListarObjetos
//
//  Created by pedro on 09/03/23.
//

import SwiftUI


struct ContentView: View {
    @State private var currentTodo=""
    @State private var todos: [Item] = []
    
    private func save(){
        UserDefaults.standard.set(
            try? PropertyListEncoder().encode(self.todos), forKey: "myTodosKey"
        )
    }
    
    
    
    var body: some View{
        NavigationView{
            VStack{
                HStack{
                    TextField("New Todo...", text: $currentTodo).textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action:{
                        guard !self.currentTodo.isEmpty else {return}
                        self.todos.append(Item(todo: self.currentTodo))
                        self.currentTodo=""
                        self.save()
                    })
                    {
                        Image(systemName: "text.badge.plus")
                    }
                    .padding(.leading, 5)
                }.padding()
                
                List {
                    ForEach(todos) { todoEntry in
                        Text(todoEntry.todo)
                        
                        //    Text("This is something in my list")
                        //    Text("this is also in my list")
                        //    Text("and anothe thing")
                        //    Text("Aprovacao 10/03")
                    } .onDelete(perform: delete)
                }
            }
            .navigationTitle("Todo lista")
        }.onAppear(perform: load_command)
    }
}


 /*   var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
}}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
*/
