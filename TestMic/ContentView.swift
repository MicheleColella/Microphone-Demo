import SwiftUI

struct ContentView: View{
    @ObservedObject var audio: AudioRecorder
        @ObservedObject var player = AudioPlayer()
    
    var body: some View{
        VStack{
            Button(action: {
                if audio.recording{
                    audio.stopRecording()
                }else{
                    audio.startRecording()
                }
            }, label: {
                Image(systemName: "mic.fill.badge.plus")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(audio.recording ? .red : .green)
                    .frame(width: 70, height: 70)
            })
            
            Text(audio.recording ? "Recording..." : "Click to Record")
                .font(.caption)
                .bold()
            
            Button(action: {
                            if player.isPlaying {
                                player.stopPlayback()
                            } else {
                                if let recordingURL = audio.audioRecorder?.url {
                                    player.startPlayback(audio: recordingURL)
                                }
                            }
                        }, label: {
                            Image(systemName: player.isPlaying ? "stop.fill" : "play.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(player.isPlaying ? .red : .green)
                                .frame(width: 70, height: 70)
                        })
                    }
        }
    }


struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView(audio: AudioRecorder())
    }
}
