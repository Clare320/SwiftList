//
//  SLIntentTimeProvider.swift
//  SwiftListWidgetExtension
//
//  Created by lingjie.li on 2021/6/15.
//

import WidgetKit

struct IntentEntry: TimelineEntry {
    var date: Date
    var character: GameCharacter
}

struct SLIntentTimeProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> IntentEntry {
        let character = GameCharacter(identifier: "扫一扫", display: "扫一扫")
        character.name = "扫一扫"
        return IntentEntry(date: Date(), character: character)
    }
    
    func getSnapshot(for configuration: SelectCharacterIntent, in context: Context, completion: @escaping (IntentEntry) -> Void) {
        
    }
    
    func getTimeline(for configuration: SelectCharacterIntent, in context: Context, completion: @escaping (Timeline<IntentEntry>) -> Void) {
        let character = GameCharacter(identifier: "扫一扫", display: "扫一扫")
        character.name = "扫一扫"
        
        let entry = IntentEntry(date: Date(), character: character)
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}
