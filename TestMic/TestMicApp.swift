import SwiftUI

@main
struct MyApp: App {
    var audioRecorder = AudioRecorder()

    var body: some Scene {
        WindowGroup {
            ContentView(audio: audioRecorder)
        }
    }
}
