 //
//  DevoteWidget.swift
//  DevoteWidget
//
//  Created by Myron on 1/14/22.
//

import WidgetKit
import SwiftUI
import Devote


struct Provider: TimelineProvider {// Advises when widgeKit should update display
    func placeholder(in context: Context) -> SimpleEntry {
        //Representing a placeholder for the widget
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        //Timeline Entry representing the current Time and State of a widget
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        //Provides an [] of timeline-entries for the current time and ?future times
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct DevoteWidgetEntryView : View {
    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) var widgetFamily
    
    var fontStyle:Font{
        if widgetFamily == .systemSmall{
            return .system(.footnote , design: .rounded)
        } else {
            return .system(.headline, design: .rounded)
        }
    }

    var body: some View {
        //Text(entry.date, style: .time)
        //- W/ The reader we can place the logo where we want
        GeometryReader { geometry in
            ZStack{
                backgroundGradient
                
                Image("rocket-small")
                    .resizable()
                    .scaledToFit()
                
                Image("logo")
                    .resizable()
                    .frame(
                        width: widgetFamily != .systemSmall ? 56 : 36,
                        height: widgetFamily != .systemSmall ? 56 : 36)
                    .offset(
                        x: (geometry.size.width / 2) - 20,
                        y: (geometry.size.height / -2) + 20
                    )
                    .padding(.top, widgetFamily != .systemSmall ? 32 : 12)
                    .padding(.trailing, widgetFamily != .systemSmall ? 32 : 12)
                
                HStack {
                    Text("Just do it")
                        .foregroundColor(.white)
                        .font(fontStyle)
                        .fontWeight(.bold)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(
                            Color(red: 0, green: 0, blue: 0, opacity: 0.5)
                                .blendMode(.overlay)
                        )
                    .clipShape(Capsule())
                    
                    if widgetFamily != .systemSmall{
                        Spacer()
                    }
                }//:HStack
                .padding()
                .offset(y: (geometry.size.height / 2) - 24)
            }//:ZStack
        }//:GeometryReader
    }
}
//-Declares this will be the entry point of this widget
@main
struct DevoteWidget: Widget {
    let kind: String = "DevoteWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            DevoteWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Devote Launcher")
        .description("This is an example widget for ther personal task manager app.")
    }
}

struct DevoteWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DevoteWidgetEntryView(entry: SimpleEntry(date: Date()))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            
            DevoteWidgetEntryView(entry: SimpleEntry(date: Date()))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            
            DevoteWidgetEntryView(entry: SimpleEntry(date: Date()))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
