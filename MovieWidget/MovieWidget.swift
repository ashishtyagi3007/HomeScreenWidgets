//
//  MovieWidget.swift
//  MovieWidget
//
//  Created by Ashish Tyagi on 09/10/20.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    var marvelUniverse: MarvelUniverse = MarvelUniverse()

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), movie: marvelUniverse.movie)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(),movie: marvelUniverse .movie)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
    var entries = [SimpleEntry]()
        var nextUpdateDate = Date()
        for (i, movie) in marvelUniverse.movies.enumerated() {
            nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 1 * i, to: Date())!
            let entry = SimpleEntry(date: nextUpdateDate, movie: movie)
            entries.append(entry)
        }

        let timeline = Timeline(
            entries: entries,
            policy: .atEnd
        )

        completion(timeline)
        
        
    }
}

struct SimpleEntry: TimelineEntry {
    public let date: Date
    public let movie: MarvelUniverseCharacter

}

struct MovieWidgetEntryView : View {
    var entry: Provider.Entry

    var gradient: Gradient {
        Gradient(stops:
                    [Gradient.Stop(color: .clear, location: 0),
                     Gradient.Stop(color: Color.black.opacity(0.95),
                                   location: 0.6)])
    }
    
    var body: some View {
        ZStack {
            Image(entry.movie.characterImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .mask(
                    RoundedRectangle(cornerRadius: 10)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(minHeight: 0, maxHeight: .infinity)
                )
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(minHeight: 0, maxHeight: .infinity)
            
            VStack {
                Spacer()
                LinearGradient(gradient: gradient,
                               startPoint: .top,
                               endPoint: .bottom)
                    .frame(height: 100)
            }
            VStack(alignment: .leading) {
                Spacer()
                Text(entry.movie.name)
                    .padding(.all, 10)
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
    }
}

@main
struct MovieWidget: Widget {
    let kind: String = "MovieWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MovieWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct MovieWidget_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}
