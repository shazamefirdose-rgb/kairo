#!/usr/bin/env bash
set -e

# KAIRO Phase-1 scaffold generator
# Usage: ./setup-kairo.sh
# Creates files and folders for a Next.js + Tailwind starter scaffold.

echo "Creating KAIRO scaffold..."

mkdir -p app title components public styles data scripts .github/workflows

cat > package.json <<'EOF'
{
  "name": "kairo",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint",
    "seed:demo": "node ./scripts/seed-demo.js"
  },
  "dependencies": {
    "next": "14.0.0",
    "react": "18.2.0",
    "react-dom": "18.2.0",
    "hls.js": "1.4.0"
  },
  "devDependencies": {
    "@types/node": "18.0.0",
    "@types/react": "18.0.0",
    "autoprefixer": "10.4.14",
    "postcss": "8.4.21",
    "tailwindcss": "3.4.8",
    "typescript": "5.2.2",
    "eslint": "8.45.0",
    "eslint-config-next": "14.0.0"
  }
}
EOF

cat > tsconfig.json <<'EOF'
{
  "compilerOptions": {
    "target": "ES2020",
    "lib": ["DOM", "DOM.Iterable", "ESNext"],
    "allowJs": false,
    "skipLibCheck": true,
    "esModuleInterop": true,
    "allowSyntheticDefaultImports": true,
    "strict": true,
    "forceConsistentCasingInFileNames": true,
    "module": "ESNext",
    "moduleResolution": "Node",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true,
    "jsx": "react-jsx",
    "incremental": true
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx", "scripts"],
  "exclude": ["node_modules"]
}
EOF

cat > tailwind.config.js <<'EOF'
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./app/**/*.{ts,tsx,js,jsx}", "./components/**/*.{ts,tsx,js,jsx}", "./pages/**/*.{ts,tsx,js,jsx}"],
  theme: {
    extend: {
      colors: {
        'kairo-bg': '#0b0b0c',
        'kairo-surface': '#1f1f22',
        'kairo-accent': '#c0392b',
        'kairo-gold': '#b8860b',
        'kairo-text': '#f5f5f6',
        'kairo-muted': '#9aa0a6'
      },
      borderRadius: {
        card: '10px'
      }
    }
  },
  plugins: []
}
EOF

cat > postcss.config.js <<'EOF'
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {}
  }
}
EOF

cat > next.config.js <<'EOF'
/**
 * Minimal Next.js config for App Router and image domains placeholder
 */
const nextConfig = {
  reactStrictMode: true,
  images: {
    domains: ["images.unsplash.com", "placehold.co"]
  }
}

module.exports = nextConfig
EOF

cat > public/logo.svg <<'EOF'
<!doctype html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>KAIRO — Every story finds you</title>
  </head>
  <body>
    <svg xmlns="http://www.w3.org/2000/svg" width="224" height="64" viewBox="0 0 224 64">
      <rect width="224" height="64" fill="#0b0b0c" />
      <text x="16" y="40" fill="#f5f5f6" font-family="Inter, sans-serif" font-size="28">KAIRO</text>
      <text x="16" y="56" fill="#9aa0a6" font-family="Inter, sans-serif" font-size="10">Every story finds you.</text>
    </svg>
  </body>
</html>
EOF

cat > styles/globals.css <<'EOF'
/* globals.css */
@tailwind base;
@tailwind components;
@tailwind utilities;

:root{
  --bg-main:#0b0b0c;
  --surface:#1f1f22;
  --accent:#c0392b;
  --gold:#b8860b;
  --text:#f5f5f6;
  --muted:#9aa0a6;
}

html,body,#root{
  height:100%;
}

body{
  background:var(--bg-main);
  color:var(--text);
  font-family: Inter, ui-sans-serif, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
}

.card{
  background:linear-gradient(180deg, rgba(255,255,255,0.02), rgba(0,0,0,0.08));
  border-radius:10px;
  box-shadow: 0 6px 20px rgba(0,0,0,0.6);
}
EOF

mkdir -p app
cat > app/layout.tsx <<'EOF'
import './styles/globals.css'
import React from 'react'

export const metadata = {
  title: 'KAIRO',
  description: 'Every story finds you.'
}

export default function RootLayout({ children }: { children: React.ReactNode }){
  return (
    <html lang="en">
      <body>
        <div className="min-h-screen">
          {children}
        </div>
      </body>
    </html>
  )
}
EOF

cat > app/page.tsx <<'EOF'
import React from 'react'
import Hero from '../components/Hero'
import Sidebar from '../components/Sidebar'
import BottomNav from '../components/BottomNav'

export default function Home(){
  return (
    <div className="min-h-screen flex text-kairo-text">
      <aside className="hidden md:block w-72 p-6">
        <Sidebar />
      </aside>
      <main className="flex-1 p-6">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-2xl mb-4">Good evening, Guest</h2>
          <Hero />

          <section className="mt-8">
            <h3 className="text-lg mb-4">Continue Watching</h3>
            <div className="flex gap-4 overflow-x-auto">
              {/* placeholder cards */}
              {Array.from({length:6}).map((_,i)=> (
                <div key={i} className="w-40 card p-2 shrink-0">
                  <div className="h-56 bg-gray-800 rounded-md mb-2" />
                  <div className="text-sm">Fictional Drama {i+1}</div>
                </div>
              ))}
            </div>
          </section>

          <section className="mt-8">
            <h3 className="text-lg mb-4">Trending Now</h3>
            <div className="flex gap-4 overflow-x-auto">
              {Array.from({length:10}).map((_,i)=> (
                <div key={i} className="w-40 card p-2 shrink-0">
                  <div className="h-56 bg-gray-800 rounded-md mb-2" />
                  <div className="text-sm">Trending {i+1}</div>
                </div>
              ))}
            </div>
          </section>

        </div>
      </main>

      <footer className="md:hidden fixed bottom-0 left-0 right-0">
        <BottomNav />
      </footer>
    </div>
  )
}
EOF

mkdir -p components
cat > components/Hero.tsx <<'EOF'
'use client'
import React from 'react'

export default function Hero(){
  return (
    <div className="relative h-96 card overflow-hidden rounded-xl">
      <div className="absolute inset-0" style={{backgroundImage:'linear-gradient(180deg, rgba(0,0,0,0.1), rgba(0,0,0,0.5))'}} />
      <div className="absolute inset-0 flex items-end p-8">
        <div className="max-w-2xl">
          <h1 className="text-3xl font-bold">Moonlight Harbor</h1>
          <p className="mt-2 text-kairo-muted">A heartwarming drama about second chances and seaside confessions.</p>
          <div className="mt-4 flex gap-3">
            <button className="px-4 py-2 bg-kairo-accent rounded-md">Watch Now</button>
            <button className="px-4 py-2 border border-gray-600 rounded-md">Watch Trailer</button>
            <button className="px-3 py-2 bg-gray-800 rounded-md">+ My List</button>
          </div>
        </div>
      </div>
    </div>
  )
}
EOF

cat > components/Sidebar.tsx <<'EOF'
import React from 'react'

export default function Sidebar(){
  const items = ['Home','Trending','New Releases','K-Dramas','C-Dramas','J-Dramas','Movies','Genres','Countries','Find Your Story','Continue Watching','My List','Downloads']
  return (
    <div>
      <div className="flex items-center gap-3 mb-6">
        <img src="/logo.svg" alt="KAIRO" className="w-36" />
      </div>
      <nav className="space-y-2">
        {items.map(i=> (
          <div key={i} className="px-3 py-2 rounded-md hover:bg-gray-800 cursor-pointer">{i}</div>
        ))}
      </nav>

      <div className="mt-8 border-t border-gray-800 pt-4">
        <div className="px-3 py-2 rounded-md hover:bg-gray-800 cursor-pointer">Notifications</div>
        <div className="px-3 py-2 rounded-md hover:bg-gray-800 cursor-pointer">Profile</div>
        <div className="px-3 py-2 rounded-md hover:bg-gray-800 cursor-pointer">Settings</div>
      </div>
    </div>
  )
}
EOF

cat > components/BottomNav.tsx <<'EOF'
import React from 'react'

export default function BottomNav(){
  const items = ['Home','Search','My List','Downloads','Profile']
  return (
    <div className="bg-black/80 backdrop-blur p-2 flex justify-between">
      {items.map(i=> (
        <div key={i} className="flex-1 text-center py-2 text-sm">{i}</div>
      ))}
    </div>
  )
}
EOF

mkdir -p app/title
cat > app/title/[slug]/page.tsx <<'EOF'
import React from 'react'

export default function TitlePage({ params }: { params: { slug: string } }){
  const { slug } = params
  return (
    <div className="p-6">
      <div className="card p-6">
        <div className="h-72 bg-gray-800 rounded-md mb-4" />
        <h1 className="text-2xl font-bold">{slug.replace('-', ' ')}</h1>
        <p className="mt-2 text-kairo-muted">Series • South Korea • 2024 • 16 eps • Romance / Drama</p>
        <div className="mt-4 flex gap-3">
          <button className="px-4 py-2 bg-kairo-accent rounded-md">Play</button>
          <button className="px-4 py-2 border border-gray-600 rounded-md">Watch Trailer</button>
          <button className="px-3 py-2 bg-gray-800 rounded-md">+ My List</button>
        </div>
      </div>

      <section className="mt-6">
        <h3 className="text-lg mb-2">Episodes</h3>
        <div className="space-y-2">
          {Array.from({length:8}).map((_,i)=> (
            <div key={i} className="flex items-center gap-4 card p-3">
              <div className="w-28 h-16 bg-gray-800 rounded-md" />
              <div className="flex-1">
                <div className="font-medium">Episode {i+1} • 45m</div>
                <div className="text-kairo-muted text-sm">Short summary of episode {i+1}.</div>
              </div>
              <div className="text-sm">32 min watched</div>
            </div>
          ))}
        </div>
      </section>
    </div>
  )
}
EOF

cat > data/demo-titles.js <<'EOF'
// simple demo data file (seed for frontend)
module.exports = [
  {
    id: 'moonlight-harbor',
    type: 'series',
    title: 'Moonlight Harbor',
    original_title: 'Moonlight Harbor (KR)',
    release_year: 2024,
    countries: ['South Korea'],
    genres: ['Romance','Drama'],
    demo: true
  },
  {
    id: 'summer-rain',
    type: 'movie',
    title: 'Summer Rain',
    original_title: 'Summer Rain (JP)',
    release_year: 2023,
    countries: ['Japan'],
    genres: ['Drama'],
    demo: true
  }
]
EOF

cat > scripts/seed-demo.js <<'EOF'
#!/usr/bin/env node
const fs = require('fs')
const path = require('path')
const data = require('../data/demo-titles')
const out = path.resolve(process.cwd(), 'public', 'demo-catalog.json')
fs.writeFileSync(out, JSON.stringify(data, null, 2))
console.log('Wrote demo catalog to', out)
EOF
chmod +x scripts/seed-demo.js

cat > .github/workflows/ci.yml <<'EOF'
name: CI
on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Use Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '18'
      - name: Install deps
        run: npm ci
      - name: Build
        run: npm run build
EOF

cat > README.md <<'EOF'
# KAIRO — Starter scaffold

This repository contains the Phase‑1 starter scaffold for KAIRO — "Every story finds you." It includes a Next.js + TypeScript app, Tailwind CSS brand tokens, a responsive layout (desktop sidebar + mobile bottom nav), placeholder pages (Home, Title detail), a mock hero, and a small demo catalog.

What is included:
- Next.js (App Router) + TypeScript
- Tailwind CSS with KAIRO color tokens
- Global layout, Sidebar, BottomNav, Hero, Title page
- Demo catalog JSON generator (scripts/seed-demo.js)
- CI workflow (lint/build)

How to run locally
1. Install dependencies: npm install
2. Start dev server: npm run dev
3. Generate demo catalog: npm run seed:demo

Notes
- This is a UI-first Phase‑1 scaffold. No production backend or DRM is included.
- Replace the placeholder \`public/logo.svg\` with your brand assets when ready.
- The repo should be private during early development.

Next steps I can take (pick one):
- Wire a minimal Next.js API + Prisma schema and seed endpoints.
- Implement the mock HLS player with hls.js and a demo manifest.
- Build the Auth flows and connect to a database.

Tell me which I should do next and I’ll continue.
EOF

echo "Scaffold created. Run 'npm install' and 'npm run seed:demo' next."
