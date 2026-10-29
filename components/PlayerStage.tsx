:root {
  --bg-deep: #120d17;
  --bg-mid: #2b1c2d;
  --bg-warm: #ffd7a4;
  --panel: rgba(19, 17, 22, 0.66);
  --panel-border: rgba(255, 255, 255, 0.12);
  --rose: #ffb09c;
  --gold: #f5d089;
  --text: #f8f0ea;
  --muted: #d2b8b2;
  --shadow: rgba(0, 0, 0, 0.38);
}

* { box-sizing: border-box; }

html, body {
  margin: 0;
  min-height: 100%;
  background: var(--bg-deep);
  color: var(--text);
  font-family: Arial, Helvetica, sans-serif;
}

body {
  min-height: 100vh;
  overflow-x: hidden;
}

button {
  font: inherit;
}

.anime-wrapper {
  min-height: 100vh;
  background:
    radial-gradient(circle at top, rgba(147, 116, 196, 0.18), transparent 40%),
    linear-gradient(180deg, #0f1219 0%, #1d1320 18%, #1a1a1d 100%);
}

.anime-scene {
  position: relative;
  min-height: 100vh;
  overflow: hidden;
  background:
    linear-gradient(180deg, rgba(12, 17, 27, 0.25) 0%, rgba(12, 17, 27, 0.38) 26%, rgba(12, 17, 27, 0.7) 100%),
    #201a26;
}

.sky-layer {
  position: absolute;
  inset: 0;
  background:
    linear-gradient(180deg, rgba(29, 31, 53, 0.28), rgba(15, 18, 30, 0.88)),
    radial-gradient(circle at 50% 18%, rgba(253, 219, 145, 0.44), transparent 22%);
}

.moon-glow {
  position: absolute;
  width: 42vw;
  height: 42vw;
  max-width: 520px;
  max-height: 520px;
  left: 12%;
  top: 4%;
  border-radius: 50%;
  background: radial-gradient(circle, rgba(255, 220, 151, 0.9) 0%, rgba(255, 195, 110, 0.2) 28%, rgba(255, 195, 110, 0) 64%);
  filter: blur(16px);
  opacity: 0.8;
}

.cloud {
  position: absolute;
  border-radius: 999px;
  background: rgba(255, 255, 255, 0.08);
  filter: blur(10px);
  opacity: 0.7;
  animation: drift 18s ease-in-out infinite alternate;
}

.cloud-a {
  width: 28vw;
  height: 8vh;
  left: 18%;
  top: 18%;
}

.cloud-b {
  width: 22vw;
  height: 7vh;
  right: 15%;
  top: 22%;
  animation-duration: 22s;
}

@keyframes drift {
  0% { transform: translateX(-18px) scale(1); }
  100% { transform: translateX(30px) scale(1.08); }
}

.mountains {
  position: absolute;
  inset: auto 0 24vh 0;
  height: 34vh;
  background:
    linear-gradient(180deg, rgba(31, 28, 48, 0.15), rgba(8, 8, 14, 0.7)),
    linear-gradient(135deg, rgba(80, 95, 120, 0.7) 0%, rgba(30, 34, 46, 0.65) 44%, rgba(12, 16, 22, 0.92) 100%);
  clip-path: polygon(0% 100%, 0% 60%, 12% 48%, 24% 44%, 30% 54%, 42% 32%, 54% 58%, 66% 40%, 74% 50%, 86% 32%, 100% 58%, 100% 100%);
  opacity: 0.94;
}

.city-lights {
  position: absolute;
  inset: auto 0 17vh 0;
  height: 20vh;
  background:
    repeating-linear-gradient(
      to right,
      rgba(247, 194, 94, 0.28) 0,
      rgba(247, 194, 94, 0.28) 4px,
      transparent 4px,
      transparent 18px
    );
  opacity: 0.8;
  transform: perspective(600px) rotateX(12deg);
}

.cafe-frames {
  position: absolute;
  inset: 22vh 0 0 0;
  background:
    linear-gradient(90deg, rgba(12, 13, 18, 0.8) 0%, rgba(12, 13, 18, 0.2) 30%, rgba(12, 13, 18, 0.2) 70%, rgba(12, 13, 18, 0.8) 100%),
    linear-gradient(180deg, rgba(255, 255, 255, 0.02), rgba(0, 0, 0, 0.2));
  opacity: 0.7;
}

.room-glow {
  position: absolute;
  inset: auto 0 0 0;
  height: 44vh;
  background: linear-gradient(180deg, rgba(255, 201, 121, 0.14), rgba(18, 14, 16, 0));
}

.counter {
  position: absolute;
  left: 9%;
  right: 9%;
  bottom: 7vh;
  height: 15vh;
  border-radius: 28px 28px 0 0;
  background:
    linear-gradient(180deg, rgba(98, 66, 42, 0.9), rgba(53, 34, 27, 0.95)),
    repeating-linear-gradient(90deg, rgba(255,255,255,0.06) 0 2px, transparent 2px 30px);
  box-shadow: 0 25px 38px rgba(0, 0, 0, 0.28);
  transform: translateY(1vh);
}

.counter-shadow {
  position: absolute;
  left: 12%;
  right: 12%;
  bottom: 3vh;
  height: 5vh;
  border-radius: 50%;
  background: rgba(0, 0, 0, 0.3);
  filter: blur(18px);
}

.overlay-copy {
  position: absolute;
  left: 8vw;
  top: 12vh;
  max-width: min(34rem, 42vw);
  z-index: 2;
}

.eyebrow {
  margin: 0 0 0.8rem;
  letter-spacing: 0.22em;
  text-transform: uppercase;
  color: rgba(255, 216, 159, 0.9);
  font-size: 0.7rem;
}

.overlay-copy h1 {
  margin: 0;
  font-size: clamp(2.1rem, 4vw, 5rem);
  line-height: 0.98;
  letter-spacing: -0.06em;
  text-shadow: 0 12px 32px rgba(0, 0, 0, 0.24);
}

.lede {
  max-width: 28rem;
  margin-top: 1rem;
  font-size: clamp(0.95rem, 1.5vw, 1.15rem);
  line-height: 1.6;
  color: rgba(245, 239, 232, 0.8);
}

.player-viewport {
  position: absolute;
  right: clamp(1.5rem, 3vw, 4rem);
  bottom: clamp(2rem, 4vw, 5rem);
  width: min(36rem, 42vw);
  height: min(34rem, 60vh);
  min-height: 320px;
  z-index: 4;
  border-radius: 28px;
  background: rgba(13, 12, 16, 0.22);
  border: 1px solid var(--panel-border);
  box-shadow: 0 28px 80px rgba(0, 0, 0, 0.28);
  backdrop-filter: blur(10px);
  overflow: hidden;
}

.player-viewport canvas {
  width: 100% !important;
  height: 100% !important;
  display: block;
  background: radial-gradient(circle at center, rgba(44, 22, 14, 0.28), transparent 60%);
}

.player-meta {
  position: absolute;
  left: 1.3rem;
  top: 1.1rem;
  display: flex;
  align-items: center;
  gap: 0.8rem;
  z-index: 10;
  background: rgba(0, 0, 0, 0.22);
  border: 1px solid rgba(255, 255, 255, 0.08);
  border-radius: 999px;
  padding: 0.38rem 0.7rem 0.38rem 0.46rem;
  backdrop-filter: blur(10px);
}

.playing-indicator {
  width: 0.8rem;
  height: 0.8rem;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.3);
  box-shadow: 0 0 0 rgba(255, 255, 255, 0);
  transition: all 0.25s ease;
}

.playing-indicator[data-active='true'] {
  background: #86ffb4;
  box-shadow: 0 0 14px rgba(120, 255, 170, 0.8);
}

.meta-label {
  margin: 0;
  opacity: 0.7;
  font-size: 0.69rem;
  letter-spacing: 0.12em;
  text-transform: uppercase;
}

.player-meta h2 {
  margin: 0.1rem 0 0.1rem;
  font-size: 1rem;
  line-height: 1.2;
}

.player-meta p {
  margin: 0;
  color: rgba(255,255,255,0.72);
  font-size: 0.82rem;
}

.player-controls {
  position: absolute;
  left: 1.25rem;
  right: 1.25rem;
  bottom: 1.1rem;
  z-index: 10;
  display: flex;
  gap: 0.7rem;
  align-items: center;
  justify-content: center;
}

.player-controls button {
  border: 1px solid rgba(255, 255, 255, 0.15);
  background: rgba(15, 12, 18, 0.6);
  color: var(--text);
  border-radius: 999px;
  min-width: 4rem;
  min-height: 2.8rem;
  padding: 0.55rem 0.9rem;
  cursor: pointer;
  transition: transform 0.2s ease, border-color 0.2s ease, box-shadow 0.2s ease;
}

.player-controls button:hover {
  transform: translateY(-1px);
  border-color: rgba(248, 196, 120, 0.8);
  box-shadow: 0 0 16px rgba(248, 196, 120, 0.18);
}

.player-controls .primary {
  min-width: 7rem;
  background: linear-gradient(180deg, rgba(250, 202, 118, 0.8), rgba(192, 89, 48, 0.82));
  color: #1a120d;
  font-weight: 700;
}

.canvas-placeholder {
  position: absolute;
  inset: 0;
  display: grid;
  place-items: center;
  color: rgba(255,255,255,0.7);
  font-size: 0.9rem;
  letter-spacing: 0.14em;
  text-transform: uppercase;
}

.player-button-label {
  font-size: 0.7rem;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  background: rgba(15, 12, 18, 0.7);
  color: white;
  border: 1px solid rgba(255,255,255,0.12);
  padding: 0.28rem 0.45rem;
  border-radius: 999px;
  white-space: nowrap;
}

@media (max-width: 880px) {
  .overlay-copy {
    top: 7vh;
    left: 1.5rem;
    right: 1.5rem;
    max-width: none;
  }

  .player-viewport {
    right: 1rem;
    left: 1rem;
    width: auto;
    height: min(420px, 55vh);
    bottom: 4.2rem;
  }

  .anime-scene {
    min-height: 100dvh;
  }
}

@media (prefers-reduced-motion: reduce) {
  .cloud,
  .player-controls button {
    animation: none !important;
    transition: none !important;
  }
}
