//
//  RatingView.swift
//  YTS
//
//  Created by ahmed elmemy on 8/29/20.
//  Copyright © 2020 ElMeMy. All rights reserved.
//
import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Double
    
    var label = ""
    
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1) { number in
                self.image(for: Double(number))
                    .foregroundColor( Double(number) > self.rating ? self.offColor : self.onColor)
                    .onTapGesture {
                        self.rating = Double(number)
                }
            }
        }
    }
    
    
    
    func image(for number: Double) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
    
    
    
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
            .environment(\.colorScheme, .dark)
        
    }
}




