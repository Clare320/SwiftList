//
//  MediumWidgetView.swift
//  SwiftList
//
//  Created by lingjie.li on 2021/6/9.
//

import SwiftUI
import WidgetKit

struct MediumWidgetView: View {
    var entry: SimpleEntry
    
    let leftView: some View =  HStack {
        VStack {
            HStack {
                LinkItem(link: "https://www.baidu.com", title: "菜单1", icon: "bolt.fill")
                LinkItem(link: "https://www.baidu.com", title: "菜单2", icon: "bolt.fill")
            }
            HStack {
                LinkItem(link: "https://www.baidu.com", title: "菜单3", icon: "bolt.fill")
                LinkItem(link: "https://www.baidu.com", title: "菜单4", icon: "bolt.fill")
            }
        }
    }
    .padding(.leading, 20)
    
    let rightDateView: some View =  HStack {
        VStack(alignment: .leading, spacing: 5) {
            Text("6月9号 周三")
            Text("农历三月三")
            Text("去看看")
        }
    }
    .font(.system(size: 13))
    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
    
    var body: some View {
        HStack {
            leftView
            Spacer()
            rightDateView
        }
    }
}

struct MediumWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        MediumWidgetView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
