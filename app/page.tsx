import PlayerStage from '../components/PlayerStage';

const trackList = [
  {
    id: 'soundhelix-1',
    title: 'SoundHelix Song 1',
    artist: 'SoundHelix',
    source: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
  },
  {
    id: 'soundhelix-2',
    title: 'SoundHelix Song 2',
    artist: 'SoundHelix',
    source: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
  },
  {
    id: 'soundhelix-3',
    title: 'SoundHelix Song 3',
    artist: 'SoundHelix',
    source: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
  },
];

export default function Home() {
  return (
    <main className="anime-wrapper">
      <div className="anime-scene" aria-label="Anime-inspired listening room scene">
        <div className="sky-layer" />
        <div className="moon-glow" />
        <div className="cloud cloud-a" />
        <div className="cloud cloud-b" />
        <div className="mountains" />
        <div className="city-lights" />
        <div className="room-glow" />
        <div className="cafe-frames" />
        <div className="counter" />
        <div className="counter-shadow" />

        <div className="overlay-copy">
          <p className="eyebrow">Night Listening Room</p>
          <h1>After the rain, the record spins again.</h1>
          <p className="lede">
            A hand-painted anime café meets a tactile vintage stereo in a softly lit late-night world.
          </p>
        </div>

        <PlayerStage tracks={trackList} />
      </div>
    </main>
  );
}
