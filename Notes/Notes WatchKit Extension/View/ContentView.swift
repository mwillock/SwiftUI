//
//  ContentView.swift
//  Notes WatchKit Extension
//
//  Created by Myron on 1/15/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: -  PROPERTIES
    //Type of array of note = empty array of note
    @AppStorage("lineCount") var lineCount = 1
    @State private var notes : [Note] = [Note]()
    @State private var text : String = ""
    
    
    //MARK: - FUNCTIONS
    //Used to store any kind of external Web Urls, but also for local files store directly on the device
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save(){
       // dump(notes) //should show you all instances passed as values in the consle
        
        do {
            //1. Convert the notes array to data using JsonEncoder
            let data  = try JSONEncoder().encode(notes)
            //2. Create a new URL to save the file using the getDocumentDirectory
            let url = getDocumentDirectory().appendingPathComponent("notes")
            //3. Write thr data to the give URL
            try data.write(to: url)
        }catch{
            print("Saving data has failed!")
        }
    }
    
    func load () {
        DispatchQueue.main.async {
            do {
                //1. Get Note url path
                let url = getDocumentDirectory().appendingPathComponent("notes")
                //2. Create a new property for the data
                let data = try Data(contentsOf: url)
                //3. Decode the data
                notes = try JSONDecoder().decode([Note].self, from: data)
            }catch{
                //Do Nothing
            }
        }
    }
    
    func delete(offsets: IndexSet){
        withAnimation{
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    
    //MARK: - BODY
    var body: some View {
            VStack {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add new Note", text: $text)
                    
                    Button(action: {
                        //1. Only run the button's action when the text feild is not empty
                        guard text.isEmpty == false else { return }
                        
                        //2. Create a new note item and initalize it with the txt value
                        let note = Note(id: UUID(), text: text)
                        
                        //3. add the new item to the note array (append)\
                        notes.append(note)
                        
                        //4. Make the text feild empty
                        text = ""
                        //5. save the note (function)
                        save()
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42 , weight: .semibold))
                    })
                        .fixedSize()
                        .buttonStyle(PlainButtonStyle())
                        .foregroundColor(.accentColor)
                        //.buttonStyle(BorderedButtonStyle(tint: .accentColor))
                }//:HStack
                
                Spacer()
                
                if notes.count >= 1 {
                    List{
                        ForEach(0..<notes.count, id: \.self) { i in
                            NavigationLink(destination:
                                            DetailView(
                                                note: notes[i], count: notes.count, index: i)) {
                                HStack{
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundColor(.accentColor)
                                    Text(notes[i].text)
                                        .lineLimit(lineCount)
                                        .padding(.leading, 5)
                                }//:HStack
                            }
                            
                        }//:Loop
                        .onDelete(perform: delete)
                    }
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .padding(25)
                    Spacer()
                }//:List
            }//:VStack
            .navigationTitle("Notes") //?
            .onAppear(perform: {
                load()
            })

    
    
    }
}
//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
