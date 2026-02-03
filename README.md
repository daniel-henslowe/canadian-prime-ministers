# Canadian Prime Ministers

A beautiful, minimalist iOS app showcasing all 24 Canadian Prime Ministers from Confederation (1867) to present day.

![SwiftUI](https://img.shields.io/badge/SwiftUI-5.0-blue?logo=swift)
![iOS](https://img.shields.io/badge/iOS-17.0+-black?logo=apple)
![License](https://img.shields.io/badge/License-MIT-green)

## Features

### 🎴 Card-Based Navigation
- **Vertical swipe** (up/down) to browse Prime Ministers chronologically
- Large, elegant cards with grayscale portraits
- Smooth spring animations between transitions
- PM number displayed as large watermark overlay

### 📅 Interactive Timeline
- **Horizontal swipeable timeline** at the bottom of the screen
- Year markers from 1867 to 2025
- Tap any year to jump directly to that Prime Minister
- Visual connector lines showing historical progression
- Selected marker highlighted with ring indicator

### 🎨 Minimalist Design
- **Monochrome aesthetic** - all portraits in grayscale
- Clean serif typography for names
- Monospaced fonts for dates and labels
- Subtle shadows and rounded corners
- High contrast black/white color scheme

### 📱 Full-Screen Timeline View
- Toggle between card view and full timeline
- Circular portrait thumbnails with selection states
- Detailed info panel for selected PM
- Party affiliation badges

## Screenshots

| Card View | Timeline View | Bottom Navigation |
|-----------|---------------|-------------------|
| Swipe up/down | Full history | Swipe left/right |

## Data Included

Each Prime Minister entry includes:
- **Full name** with honorific titles
- **Political party** affiliation
- **Term dates** (including non-consecutive terms)
- **Historical description** of key accomplishments
- **Portrait image** sourced from Wikipedia

### Complete List of Prime Ministers

| # | Name | Party | Term |
|---|------|-------|------|
| 1 | Sir John A. Macdonald | Liberal-Conservative | 1867–1873, 1878–1891 |
| 2 | Alexander Mackenzie | Liberal | 1873–1878 |
| 3 | Sir John Abbott | Conservative | 1891–1892 |
| 4 | Sir John Thompson | Conservative | 1892–1894 |
| 5 | Sir Mackenzie Bowell | Conservative | 1894–1896 |
| 6 | Sir Charles Tupper | Conservative | 1896 (68 days) |
| 7 | Sir Wilfrid Laurier | Liberal | 1896–1911 |
| 8 | Sir Robert Borden | Conservative | 1911–1920 |
| 9 | Arthur Meighen | Conservative | 1920–1921, 1926 |
| 10 | William Lyon Mackenzie King | Liberal | 1921–1926, 1926–1930, 1935–1948 |
| 11 | R.B. Bennett | Conservative | 1930–1935 |
| 12 | Louis St. Laurent | Liberal | 1948–1957 |
| 13 | John Diefenbaker | Progressive Conservative | 1957–1963 |
| 14 | Lester B. Pearson | Liberal | 1963–1968 |
| 15 | Pierre Elliott Trudeau | Liberal | 1968–1979, 1980–1984 |
| 16 | Joe Clark | Progressive Conservative | 1979–1980 |
| 17 | John Turner | Liberal | 1984 (79 days) |
| 18 | Brian Mulroney | Progressive Conservative | 1984–1993 |
| 19 | Kim Campbell | Progressive Conservative | 1993 (132 days) |
| 20 | Jean Chrétien | Liberal | 1993–2003 |
| 21 | Paul Martin | Liberal | 2003–2006 |
| 22 | Stephen Harper | Conservative | 2006–2015 |
| 23 | Justin Trudeau | Liberal | 2015–2025 |
| 24 | Mark Carney | Liberal | 2025–Present |

## Technical Details

### Architecture
- **Pure SwiftUI** - No UIKit dependencies
- **MVVM-lite** - Simple state management with `@State` and `@Binding`
- **Local image assets** - All 24 PM portraits bundled in app (works offline)

### Project Structure
```
CanadianPMs/
├── CanadianPMsApp.swift      # App entry point
├── ContentView.swift          # Main view with navigation
│   ├── HeaderView             # Title and toggle button
│   ├── BottomTimelineView     # Horizontal year timeline
│   └── TimelineMarker         # Individual year marker
├── PrimeMinister.swift        # Data model with all 24 PMs
├── PrimeMinisterCard.swift    # Card component for main view
├── TimelineView.swift         # Full-screen timeline view
│   ├── HistoryTimelineView    # Scrollable portrait timeline
│   ├── TimelineCard           # Circular portrait component
│   └── TimelineDetailView     # Selected PM info panel
└── Assets.xcassets/           # App icons and colors
```

### Key SwiftUI Features Used
- `GeometryReader` for responsive layouts
- `ScrollViewReader` for programmatic scrolling
- `AsyncImage` for remote image loading
- `DragGesture` for swipe navigation
- Spring animations for natural feel
- `@State` / `@Binding` for state management

## Requirements

- **iOS 17.0** or later
- **Xcode 15.0** or later
- **Swift 5.9** or later

## Installation

### Clone and Run
```bash
git clone https://github.com/daniel-henslowe/canadian-prime-ministers.git
cd canadian-prime-ministers
open CanadianPMs.xcodeproj
```

Then select a simulator or device and press **⌘R** to run.

### Build from Command Line
```bash
xcodebuild -project CanadianPMs.xcodeproj \
  -scheme CanadianPMs \
  -destination 'platform=iOS Simulator,name=iPhone 16 Pro' \
  build
```

## Usage

1. **Launch the app** - Opens to first Prime Minister (Sir John A. Macdonald)
2. **Swipe up/down** on the card to navigate chronologically
3. **Swipe left/right** on the bottom timeline to navigate by year
4. **Tap a year** on the timeline to jump directly to that PM
5. **Tap the timeline icon** (top right) to switch to full timeline view

## Data Sources

- Historical information compiled from [Wikipedia](https://en.wikipedia.org/wiki/List_of_prime_ministers_of_Canada)
- Portrait images from Wikimedia Commons (public domain)
- Term dates from [Parliament of Canada](https://lop.parl.ca/sites/ParlInfo/default/en_CA/People/primeMinisters)

## License

MIT License - See [LICENSE](LICENSE) for details.

## Author

**Daniel Henslowe** - [@daniel-henslowe](https://github.com/daniel-henslowe)

---

*Built with SwiftUI and Claude Code*
