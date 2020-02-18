//
//  ContentView.swift
//  FormDemo
//
//  Created by Arjun on 30/01/20.
//  Copyright © 2020 Arjun Patel. All rights reserved.
//

import SwiftUI

struct SectionHeader: View {
    var title:String
    var body: some View {
        Text(title).font(.largeTitle)
    }
}


struct From_WithControl: View {
    @State private var isON = true
    @State private var textFieldData = "This is textfield data"
    var body: some View {
        Form {
            Section(header: SectionHeader(title: "Controls Form")) {
                Text("This will gives you idea How different contrils render in form.")
                    .font(.title)
            }
            Section{
                Button(action: {
                    //Action
                }, label: {
                    Text("Button")
                    
                })
                
                Toggle(isOn: $isON, label: {
                    Text("Toggle")
                })
                
                Stepper(onIncrement: {
                    // Increment
                }, onDecrement: {
                    //Decrement
                }, label: {
                    Text("Stpper")
                })
                
                TextField("", text: $textFieldData).textFieldStyle(RoundedBorderTextFieldStyle())
                Image(systemName: "leaf.arrow.circlepath").font(.title)
                Circle()
                Text("Notice the shape are centered")
                
            }
            
        }
    }
}

struct ListRowInset: View {
    var body: some View {
        Form{
            Section(header: Text("Form").font(.largeTitle)) {
                
                Text("List row Inset")
                    .foregroundColor(.gray)
                    .font(.title)
                
                Text("Using this color, You can see where is the default margin")
                
                Color.purple
                
                Text("You can use the list row insets modifire to edjust the margin.")
                
                Color.purple.listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
        }
    }
}

struct BackGroundImage: View {
    var body: some View {
        Form {
            Section(header: Text("Form").font(.largeTitle)) {
                Text("List row background")
                    .font(.title)
                    .foregroundColor(.gray)
                Text("Image work here little difrently you can see here.")
                Text("The Image actualy set on row and second section.")
            }
            
            Section(header: Text("Image")) {
                Text("An image is set on background row below. This works fine for a row but when you use image on section level it's repeted for all rows.")
                Text("The image is set on this rows but it extend and pass the bounds. it also hides the row below this one and goes under previous row")
                
                Text("This Row can not be seen.")
            }.listRowBackground(
                Image("5")
                    .renderingMode(.original)
                    .clipped()
                    .blur(radius: 1)
            )
        }
    }
}

struct ListRowBackground: View {
    var body: some View {
        Form {
            Section(header: Text("Form").font(.largeTitle)) {
                Text("List Row BackGround")
                    .font(.title)
                    .foregroundColor(.gray)
                Text("Form and list both allow you to set background view it's function called \"ListRowBackground(View:)\".")
                Text("You can call this modifire function on one Row like this")
                    .listRowBackground(Color.yellow)
            }
            
            Section(header: Text("Whole section")) {
                Text("Or you can set view or color for whole section")
                Image(systemName: "smiley.fill")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .frame(maxWidth:.infinity, alignment: .center)
                Text("Note even through the color is set on section it's not effected on Header")
                
            }.listRowBackground(Color.yellow)
                .foregroundColor(.white)
            
        }
    }
}


struct sectionTextAndImage:View {
    var name:String
    var image:String
    var body: some View {
        HStack {
            Image(systemName: image)
            Text(name)
        }
        .font(.title)
        .padding()
        .foregroundColor(.purple)
    }
    
}

struct SectionHeaderAndFooter:View {
    
    var body: some View {
        Form {
            Section(header: Text("Section Heder Text")) {
                Text("You can add any view in header")
                Text("Notice the default forground color is gray")
            }
            
            Section(header: sectionTextAndImage(name: "People", image: "person.2.square.stack.fill")) {
                Text("Here's an example of section heder with Text amd Image")
            }
            
            Section(header: Text("Last Section"), footer: Text("Total:$1799").foregroundColor(.red)
            ) {
                Text("Here is combine example of header and footer")
            }
            
        }
    }
}
struct ContentView: View {
    var body: some View {
        Form{
            Section {
                Text("This is form")
                    .font(.title)
                Text("You can put any content here")
                Text("The cells with grow to fit the content.")
                Text("Remeber it's just a view inside the views")
            }
            
            Section {
                Text("Limitation")
                    .font(.largeTitle)
                Text("There is buit in margin that are difficult to get around.Take a look at the color below so you can see Where is the margins are:")
                Color.purple
                HStack {
                    Text("Arjun")
                    Spacer()
                    Text("Patel")
                }
                Text("Lazy Coder")
            }
            
            Section {
                Text("Summary")
                    .font(.title)
                Text("Pretty much what you see here is What you get.")
            }
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct
ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            ContentView()
            SectionHeaderAndFooter()
            ListRowBackground()
            BackGroundImage()
            ListRowInset()
            From_WithControl()
        }
    }
}
