//
//  MovieDetailsView.swift
//  YTS
//
//  Created by ahmed elmemy on 8/29/20.
//  Copyright © 2020 ElMeMy. All rights reserved.
//

import SwiftUI

struct MovieDetailsView: View {
     var movieDetails:Movie

    
    var body: some View {
        Text(movieDetails.title)
    }
}
