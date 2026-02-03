import SwiftUI

struct HistoryTimelineView: View {
    @Binding var currentIndex: Int
    let primeMinsters: [PrimeMinister]
    @State private var scrollPosition: Int?

    var body: some View {
        VStack(spacing: 0) {
            // Timeline header
            HStack {
                Text("1867")
                    .font(.system(size: 12, weight: .medium, design: .monospaced))
                    .foregroundColor(.gray)

                Rectangle()
                    .fill(Color.black.opacity(0.2))
                    .frame(height: 1)

                Text("2025")
                    .font(.system(size: 12, weight: .medium, design: .monospaced))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 12)

            // Horizontal scrolling timeline
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { proxy in
                    HStack(spacing: 0) {
                        ForEach(Array(primeMinsters.enumerated()), id: \.element.id) { index, pm in
                            TimelineCard(
                                primeMinister: pm,
                                isSelected: index == currentIndex
                            )
                            .id(index)
                            .onTapGesture {
                                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                                    currentIndex = index
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .onChange(of: currentIndex) { _, newValue in
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                            proxy.scrollTo(newValue, anchor: .center)
                        }
                    }
                    .onAppear {
                        proxy.scrollTo(currentIndex, anchor: .center)
                    }
                }
            }
            .gesture(
                DragGesture()
                    .onEnded { value in
                        let threshold: CGFloat = 50
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                            if value.translation.width < -threshold && currentIndex < primeMinsters.count - 1 {
                                currentIndex += 1
                            } else if value.translation.width > threshold && currentIndex > 0 {
                                currentIndex -= 1
                            }
                        }
                    }
            )

            // Selected PM detail
            if currentIndex < primeMinsters.count {
                TimelineDetailView(primeMinister: primeMinsters[currentIndex])
                    .transition(.opacity.combined(with: .scale(scale: 0.95)))
                    .id(currentIndex)
            }

            Spacer()

            // Swipe hint
            HStack {
                Spacer()
                HStack(spacing: 8) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 12, weight: .light))
                    Text("SWIPE")
                        .font(.system(size: 9, weight: .medium, design: .monospaced))
                        .tracking(2)
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12, weight: .light))
                }
                .foregroundColor(.gray.opacity(0.5))
                Spacer()
            }
            .padding(.bottom, 8)
        }
        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: currentIndex)
    }
}

struct TimelineCard: View {
    let primeMinister: PrimeMinister
    let isSelected: Bool

    var body: some View {
        VStack(spacing: 8) {
            // Year marker
            Text(String(primeMinister.termStart))
                .font(.system(size: 10, weight: .medium, design: .monospaced))
                .foregroundColor(isSelected ? .black : .gray)

            // Connector line
            Rectangle()
                .fill(isSelected ? Color.black : Color.gray.opacity(0.3))
                .frame(width: 1, height: 20)

            // Photo
            Image(primeMinister.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .grayscale(1.0)
                .offset(y: primeMinister.faceOffset * 0.3)
                .frame(width: isSelected ? 70 : 50, height: isSelected ? 70 : 50)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(isSelected ? Color.black : Color.gray.opacity(0.2), lineWidth: isSelected ? 3 : 1)
                )
                .shadow(color: isSelected ? .black.opacity(0.15) : .clear, radius: 10, x: 0, y: 5)

            // Number
            Text(String(format: "%02d", primeMinister.number))
                .font(.system(size: 11, weight: isSelected ? .semibold : .regular, design: .monospaced))
                .foregroundColor(isSelected ? .black : .gray)
        }
        .frame(width: 90)
        .padding(.vertical, 16)
    }
}

struct TimelineDetailView: View {
    let primeMinister: PrimeMinister

    var body: some View {
        VStack(spacing: 16) {
            // Name and party
            VStack(spacing: 8) {
                Text(primeMinister.name)
                    .font(.system(size: 22, weight: .light, design: .serif))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)

                HStack(spacing: 12) {
                    Text(primeMinister.party)
                        .font(.system(size: 10, weight: .medium, design: .monospaced))
                        .tracking(1)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(
                            Capsule()
                                .fill(Color.black)
                        )

                    Text(primeMinister.terms)
                        .font(.system(size: 11, weight: .regular, design: .monospaced))
                        .foregroundColor(.gray)
                }
            }

            // Description
            Text(primeMinister.description)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.gray)
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 20)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.black.opacity(0.02))
        )
        .padding(.horizontal, 20)
    }
}

#Preview {
    HistoryTimelineView(
        currentIndex: .constant(10),
        primeMinsters: PrimeMinister.allPMs
    )
}
