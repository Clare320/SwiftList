//
//  LinkItem.swift
//  SwiftListWidgetExtension
//
//  Created by lingjie.li on 2021/6/9.
//

import SwiftUI
import WidgetKit

struct LinkItemLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 3) {
            configuration.icon
            configuration.title
        }
        .font(.system(size: 13))
        .foregroundColor(.white)
        .background(Color(.clear))
    }
}

struct LinkItem: View {
    var link: String
    var title: String
    var icon: String
    
    var body: some View {
        Link(destination: URL(string: link)!) {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(.black))
                Label(title, systemImage: icon)
                    .labelStyle(LinkItemLabelStyle())
            }
            .frame(width: 50, height: 50, alignment: .center)
        }
    }
}

struct LinkItem_Previews: PreviewProvider {
    static var previews: some View {
        LinkItem(link: "https://www.baidu.com", title: "亮度", icon: "bolt.fill")
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
