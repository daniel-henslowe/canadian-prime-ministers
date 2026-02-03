import SwiftUI

struct PrimeMinisterCard: View {
    let primeMinister: PrimeMinister
    let isActive: Bool

    var body: some View {
        VStack(spacing: 0) {
            // Image section
            ZStack(alignment: .bottomLeading) {
                Image(primeMinister.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .grayscale(1.0)
                    .contrast(1.1)
                    .offset(y: primeMinister.faceOffset)
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
