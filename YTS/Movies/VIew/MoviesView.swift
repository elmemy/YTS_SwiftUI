//
//  ContentView.swift
//  YTS
//
//  Created by ahmed elmemy on 8/28/20.
//  Copyright © 2020 ElMeMy. All rights reserved.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var MoviesViewModels = MoviesViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            List(MoviesViewModels.Movies) { item in
                NavigationLink(destination:MovieDetailsView(movieDetails: item)) {
                    MovieCell(item: item)
                }
            }
            .navigationBarTitle("Home", displayMode: .inline)
            
        }
            
            
        .onAppear(perform: MoviesViewModels.FetchData)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
            .environment(\.colorScheme, .dark)
        
    }
}

