//
//  MediumWidgetView.swift
//  SwiftList
//
//  Created by lingjie.li on 2021/6/9.
//

import SwiftUI
import WidgetKit

struct MediumWidgetView: View {
    var entry: IntentEntry
    
    let leftView: some View =  HStack {
        VStack {
            HStack {
                LinkItem(link: "sl://ljie.com/menu1", title: "菜单1", icon: "bolt.fill")
                LinkItem(link: "sl://ljie.com/menu2", title: "菜单2", icon: "bolt.fill")
            }
            HStack {
                LinkItem(link: "sl://ljie.com/menu3", title: "菜单3", icon: "bolt.fill")
                LinkItem(link: "sl://ljie.com/menu4", title: "菜单4", icon: "bolt.fill")
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
    static var characters: GameCharacter = {
        let character = GameCharacter(identifier: "扫一扫", display: "扫一扫")
        character.name = "扫一扫"
        return character
    }()
    static var previews: some View {
        MediumWidgetView(entry: IntentEntry(date: Date(), character: characters))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
