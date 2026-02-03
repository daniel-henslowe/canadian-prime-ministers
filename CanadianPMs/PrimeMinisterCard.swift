import SwiftUI

struct PrimeMinisterCard: View {
    let primeMinister: PrimeMinister
    let isActive: Bool
    @State private var showDetail = false

    var body: some View {
        VStack(spacing: 0) {
            // Image section
            ZStack(alignment: .bottomLeading) {
                GeometryReader { geo in
                    Image(primeMinister.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .grayscale(1.0)
                        .contrast(1.1)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .top)
                }
                .frame(height: 340)
                .clipped()

                // Number overlay
                Text(String(format: "%02d", primeMinister.number))
                    .font(.system(size: 120, weight: .thin, design: .serif))
                    .foregroundColor(.white.opacity(0.9))
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 0)
                    .offset(x: -10, y: 30)
            }

            // Content section
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(primeMinister.name)
                        .font(.system(size: 24, weight: .light, design: .serif))
                        .foregroundColor(.black)

                    HStack(spacing: 12) {
                        // Party pill
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

                        // Years
                        Text(primeMinister.terms)
                            .font(.system(size: 12, weight: .regular, design: .monospaced))
                            .foregroundColor(.gray)
                    }
                }

                // Divider
                Rectangle()
                    .fill(Color.black.opacity(0.1))
                    .frame(height: 1)

                // Description
                Text(primeMinister.description)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.gray)
                    .lineSpacing(4)
                    .fixedSize(horizontal: false, vertical: true)

                // More button
                Button {
                    showDetail = true
                } label: {
                    HStack(spacing: 6) {
                        Text("MORE")
                            .font(.system(size: 11, weight: .semibold, design: .monospaced))
                            .tracking(1.5)
                        Image(systemName: "arrow.right")
                            .font(.system(size: 10, weight: .semibold))
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(
                        Capsule()
                            .stroke(Color.black.opacity(0.2), lineWidth: 1)
                    )
                }
                .buttonStyle(.plain)
                .padding(.top, 8)

                Spacer()

                // Swipe hint
                if isActive {
                    HStack {
                        Spacer()
                        VStack(spacing: 4) {
                            Image(systemName: "chevron.up")
                                .font(.system(size: 12, weight: .light))
                            Text("SWIPE")
                                .font(.system(size: 9, weight: .medium, design: .monospaced))
                                .tracking(2)
                            Image(systemName: "chevron.down")
                                .font(.system(size: 12, weight: .light))
                        }
                        .foregroundColor(.gray.opacity(0.5))
                        Spacer()
                    }
                }
            }
            .padding(24)
            .background(Color.white)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .black.opacity(0.08), radius: 20, x: 0, y: 10)
        .padding(.horizontal, 20)
        .fullScreenCover(isPresented: $showDetail) {
            PrimeMinisterDetailView(primeMinister: primeMinister)
        }
    }
}

// MARK: - Detail View

struct PrimeMinisterDetailView: View {
    let primeMinister: PrimeMinister
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
                VStack(spacing: 0) {
                    // Header with image
                    ZStack(alignment: .bottomLeading) {
                        Image(primeMinister.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        .grayscale(1.0)
                        .contrast(1.1)
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .overlay(
                            LinearGradient(
                                colors: [.clear, .black.opacity(0.7)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )

                    VStack(alignment: .leading, spacing: 8) {
                        Text(String(format: "%02d", primeMinister.number))
                            .font(.system(size: 60, weight: .thin, design: .serif))
                            .foregroundColor(.white.opacity(0.8))

                        Text(primeMinister.name)
                            .font(.system(size: 28, weight: .light, design: .serif))
                            .foregroundColor(.white)
                    }
                    .padding(24)
                }

                VStack(alignment: .leading, spacing: 24) {
                    // Party and term info
                    HStack(spacing: 12) {
                        Text(primeMinister.party)
                            .font(.system(size: 11, weight: .medium, design: .monospaced))
                            .tracking(1)
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(
                                Capsule()
                                    .fill(Color.black)
                            )

                        Text(primeMinister.terms)
                            .font(.system(size: 12, weight: .regular, design: .monospaced))
                            .foregroundColor(.gray)
                    }

                    // Birth info
                    VStack(alignment: .leading, spacing: 8) {
                        DetailSectionHeader(title: "PERSONAL")

                        DetailInfoRow(label: "Born", value: primeMinister.birthDate)
                        DetailInfoRow(label: "Birthplace", value: primeMinister.birthPlace)
                        if let deathDate = primeMinister.deathDate {
                            DetailInfoRow(label: "Died", value: deathDate)
                        }
                    }

                    // Description
                    VStack(alignment: .leading, spacing: 8) {
                        DetailSectionHeader(title: "OVERVIEW")

                        Text(primeMinister.description)
                            .font(.system(size: 15, weight: .regular))
                            .foregroundColor(.black.opacity(0.8))
                            .lineSpacing(6)
                    }

                    // Key achievements
                    VStack(alignment: .leading, spacing: 12) {
                        DetailSectionHeader(title: "KEY ACHIEVEMENTS")

                        ForEach(primeMinister.keyAchievements, id: \.self) { achievement in
                            HStack(alignment: .top, spacing: 12) {
                                Circle()
                                    .fill(Color.black)
                                    .frame(width: 6, height: 6)
                                    .padding(.top, 6)

                                Text(achievement)
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(.black.opacity(0.8))
                                    .lineSpacing(4)
                            }
                        }
                    }

                    // Notable facts
                    VStack(alignment: .leading, spacing: 12) {
                        DetailSectionHeader(title: "NOTABLE FACTS")

                        ForEach(primeMinister.notableFacts, id: \.self) { fact in
                            HStack(alignment: .top, spacing: 12) {
                                Image(systemName: "star.fill")
                                    .font(.system(size: 8))
                                    .foregroundColor(.gray)
                                    .padding(.top, 5)

                                Text(fact)
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(.black.opacity(0.7))
                                    .lineSpacing(4)
                            }
                        }
                    }

                    Spacer(minLength: 40)
                }
                .padding(24)
            }
        }
        .background(Color.white)
        .ignoresSafeArea(edges: .top)
        .safeAreaInset(edge: .bottom) {
            HStack {
                Spacer()
                HStack(spacing: 8) {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12, weight: .light))
                    Text("SWIPE RIGHT TO CLOSE")
                        .font(.system(size: 9, weight: .medium, design: .monospaced))
                        .tracking(2)
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12, weight: .light))
                }
                .foregroundColor(.gray.opacity(0.5))
                Spacer()
            }
            .padding(.vertical, 16)
            .background(Color.white)
        }
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.width > 100 {
                        dismiss()
                    }
                }
        )
    }
}

struct DetailSectionHeader: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.system(size: 11, weight: .semibold, design: .monospaced))
            .tracking(2)
            .foregroundColor(.gray)
            .padding(.bottom, 4)
    }
}

struct DetailInfoRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack(alignment: .top) {
            Text(label)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.gray)
                .frame(width: 80, alignment: .leading)

            Text(value)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.black.opacity(0.8))
        }
    }
}

#Preview {
    PrimeMinisterCard(
        primeMinister: PrimeMinister.allPMs[0],
        isActive: true
    )
    .padding(.vertical, 40)
    .background(Color.gray.opacity(0.1))
}
