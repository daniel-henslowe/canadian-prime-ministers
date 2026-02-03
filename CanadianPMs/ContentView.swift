import SwiftUI

struct ContentView: View {
    @State private var currentIndex = 0
    @State private var dragOffset: CGFloat = 0
    @State private var showTimeline = false
    @State private var timelineOffset: CGFloat = 0

    let primeMinsters = PrimeMinister.allPMs

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background
                Color.white
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    // Header
                    HeaderView(showTimeline: $showTimeline)

                    if showTimeline {
                        // Timeline View
                        HistoryTimelineView(
                            currentIndex: $currentIndex,
                            primeMinsters: primeMinsters
                        )
                        .transition(.move(edge: .leading).combined(with: .opacity))
                    } else {
                        // Main Card View with vertical swipe
                        ZStack {
                            ForEach(Array(primeMinsters.enumerated()), id: \.element.id) { index, pm in
                                PrimeMinisterCard(
                                    primeMinister: pm,
                                    isActive: index == currentIndex
                                )
                                .offset(y: calculateOffset(for: index, geometry: geometry))
                                .opacity(calculateOpacity(for: index))
                                .scaleEffect(calculateScale(for: index))
                                .zIndex(index == currentIndex ? 1 : 0)
                            }
                        }
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    dragOffset = value.translation.height
                                }
                                .onEnded { value in
                                    let threshold: CGFloat = 50
                                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                                        if value.translation.height < -threshold && currentIndex < primeMinsters.count - 1 {
                                            currentIndex += 1
                                        } else if value.translation.height > threshold && currentIndex > 0 {
                                            currentIndex -= 1
                                        }
                                        dragOffset = 0
                                    }
                                }
                        )
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                    }

                    // Navigation dots
                    NavigationDotsView(
                        currentIndex: currentIndex,
                        total: primeMinsters.count
                    )
                    .padding(.bottom, 20)
                }
            }
        }
        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: showTimeline)
    }

    private func calculateOffset(for index: Int, geometry: GeometryProxy) -> CGFloat {
        let baseOffset = CGFloat(index - currentIndex) * geometry.size.height * 0.85
        if index == currentIndex {
            return dragOffset * 0.5
        }
        return baseOffset + (dragOffset * 0.3)
    }

    private func calculateOpacity(for index: Int) -> Double {
        if index == currentIndex {
            return 1.0
        } else if abs(index - currentIndex) == 1 {
            return 0.3
        }
        return 0.0
    }

    private func calculateScale(for index: Int) -> CGFloat {
        if index == currentIndex {
            return 1.0
        }
        return 0.9
    }
}

struct HeaderView: View {
    @Binding var showTimeline: Bool

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("PRIME MINISTERS")
                    .font(.system(size: 11, weight: .semibold, design: .monospaced))
                    .tracking(2)
                    .foregroundColor(.gray)

                Text("of Canada")
                    .font(.system(size: 28, weight: .light, design: .serif))
                    .foregroundColor(.black)
            }

            Spacer()

            Button(action: {
                showTimeline.toggle()
            }) {
                Image(systemName: showTimeline ? "rectangle.stack" : "timeline.selection")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .frame(width: 44, height: 44)
                    .background(
                        Circle()
                            .fill(Color.black.opacity(0.05))
                    )
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 16)
        .padding(.bottom, 8)
    }
}

struct NavigationDotsView: View {
    let currentIndex: Int
    let total: Int

    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<total, id: \.self) { index in
                Circle()
                    .fill(index == currentIndex ? Color.black : Color.black.opacity(0.15))
                    .frame(width: index == currentIndex ? 8 : 6, height: index == currentIndex ? 8 : 6)
                    .animation(.spring(response: 0.3), value: currentIndex)
            }
        }
    }
}

#Preview {
    ContentView()
}
