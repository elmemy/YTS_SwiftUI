//
//  MovieCell.swift
//  YTS
//
//  Created by ahmed elmemy on 8/29/20.
//  Copyright © 2020 ElMeMy. All rights reserved.
//

import SwiftUI

struct MovieCell: View {
    var item:Movie
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack{
            AsyncImage(
                url: URL(string:item.mediumCoverImage)!,
                placeholder: Text("Loading ...")
            )
                .frame(width: 130, height: 130, alignment: .leading)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(10)
            
            VStack{
                Text(item.title)
                    .font(.custom(FontManger.CairoBold, size: CGFloat(FontManger.BigSize)))
                    .foregroundColor(self.colorScheme == .dark ? ColorManager.White : ColorManager.Black )
                    .frame(minWidth: 0, maxWidth: .infinity,alignment: .topLeading)
                    .padding([.top,.bottom])
                
                RatingView(rating: .constant(item.rating))
                    .frame(minWidth: 0, maxWidth: .infinity,alignment: .topLeading)
                    .padding([.bottom])
                
                
                Text(item.dateUploaded)
                    .font(.custom(FontManger.CairoBold, size: CGFloat(FontManger.SmallSize)))
                    .foregroundColor(self.colorScheme == .dark ? ColorManager.White : ColorManager.Black )
                    .frame(minWidth: 0, maxWidth: .infinity,alignment: .topLeading)
                Spacer()
                
            }
            
        }
    }
}
