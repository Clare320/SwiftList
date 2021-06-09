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
    
    let rightDateView: some View =  HStack {
        VStack(alignment: .leading, spacing: 5) {
            Text("6月9号 周三")
            Text("农历三月三")
            Text("去看看")
        }
    }
    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 70))
    
    var body: some View {
        HStack {
            HStack {
                VStack {
                    HStack {
                        
                    }
                    HStack {
                        
                    }
                }
            }
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
