import Foundation

struct PrimeMinister: Identifiable, Equatable {
    let id = UUID()
    let number: Int
    let name: String
    let party: String
    let termStart: Int
    let termEnd: Int?
    let terms: String
    let description: String

    /// Local asset image name (e.g., "pm01", "pm02", etc.)
    var imageName: String {
        String(format: "pm%02d", number)
    }

    /// Vertical offset to center face in card view (negative = move image up)
    var faceOffset: CGFloat {
        switch number {
        case 1: return -20    // Macdonald
        case 2: return -30    // Mackenzie
        case 3: return -20    // Abbott
        case 4: return -20    // Thompson
        case 5: return -20    // Bowell
        case 6: return -30    // Tupper
        case 7: return -20    // Laurier
        case 8: return -30    // Borden
        case 9: return -20    // Meighen
        case 10: return -20   // King
        case 11: return -20   // Bennett
        case 12: return -30   // St. Laurent
        case 13: return -30   // Diefenbaker
        case 14: return -20   // Pearson
        case 15: return -40   // P. Trudeau
        case 16: return -30   // Clark
        case 17: return -40   // Turner
        case 18: return -30   // Mulroney
        case 19: return -40   // Campbell
        case 20: return -30   // Chrétien
        case 21: return -30   // Martin
        case 22: return -30   // Harper
        case 23: return -30   // J. Trudeau
        case 24: return -30   // Carney
        default: return -20
        }
    }

    var termString: String {
        if let end = termEnd {
            return "\(termStart)–\(end)"
        }
        return "\(termStart)–Present"
    }

    var partyColor: String {
        switch party.lowercased() {
        case "liberal":
            return "Liberal"
        case "conservative", "progressive conservative", "unionist", "liberal-conservative":
            return "Conservative"
        default:
            return "Other"
        }
    }

    // Images bundled locally from Wikipedia (Wikimedia Commons)
    // Source: https://en.wikipedia.org/wiki/List_of_prime_ministers_of_Canada
    static let allPMs: [PrimeMinister] = [
        PrimeMinister(
            number: 1,
            name: "Sir John A. Macdonald",
            party: "Liberal-Conservative",
            termStart: 1867,
            termEnd: 1873,
            terms: "1867–1873, 1878–1891",
            description: "Canada's first Prime Minister and a Father of Confederation. He oversaw the construction of the Canadian Pacific Railway and the expansion of Canada westward."
        ),
        PrimeMinister(
            number: 2,
            name: "Alexander Mackenzie",
            party: "Liberal",
            termStart: 1873,
            termEnd: 1878,
            terms: "1873–1878",
            description: "First Liberal PM. Introduced the secret ballot and created the Supreme Court of Canada. Known for his integrity and frugal management of public finances."
        ),
        PrimeMinister(
            number: 3,
            name: "Sir John Abbott",
            party: "Conservative",
            termStart: 1891,
            termEnd: 1892,
            terms: "1891–1892",
            description: "First Canadian-born Prime Minister. Served briefly after Macdonald's death. Previously served as Mayor of Montreal and Dean of McGill Law Faculty."
        ),
        PrimeMinister(
            number: 4,
            name: "Sir John Thompson",
            party: "Conservative",
            termStart: 1892,
            termEnd: 1894,
            terms: "1892–1894",
            description: "Reformed Canadian criminal law and created the Criminal Code. Died suddenly at Windsor Castle after being sworn into the British Privy Council."
        ),
        PrimeMinister(
            number: 5,
            name: "Sir Mackenzie Bowell",
            party: "Conservative",
            termStart: 1894,
            termEnd: 1896,
            terms: "1894–1896",
            description: "Rose from newspaper editor to Prime Minister. His government was plagued by the Manitoba Schools Question crisis."
        ),
        PrimeMinister(
            number: 6,
            name: "Sir Charles Tupper",
            party: "Conservative",
            termStart: 1896,
            termEnd: 1896,
            terms: "1896 (68 days)",
            description: "Shortest-serving PM at just 68 days. A Father of Confederation who was instrumental in bringing Nova Scotia into Canada."
        ),
        PrimeMinister(
            number: 7,
            name: "Sir Wilfrid Laurier",
            party: "Liberal",
            termStart: 1896,
            termEnd: 1911,
            terms: "1896–1911",
            description: "First francophone PM. Oversaw massive immigration and the creation of Alberta and Saskatchewan. His image appears on the Canadian $5 bill."
        ),
        PrimeMinister(
            number: 8,
            name: "Sir Robert Borden",
            party: "Conservative",
            termStart: 1911,
            termEnd: 1920,
            terms: "1911–1920",
            description: "Led Canada through WWI. Fought for and won Canada's right to sign the Treaty of Versailles independently. Introduced income tax as a 'temporary' measure."
        ),
        PrimeMinister(
            number: 9,
            name: "Arthur Meighen",
            party: "Conservative",
            termStart: 1920,
            termEnd: 1921,
            terms: "1920–1921, 1926",
            description: "Served two brief terms. Known for his oratorical skills and role in the Winnipeg General Strike. Later served in the Senate."
        ),
        PrimeMinister(
            number: 10,
            name: "William Lyon Mackenzie King",
            party: "Liberal",
            termStart: 1921,
            termEnd: 1948,
            terms: "1921–1926, 1926–1930, 1935–1948",
            description: "Canada's longest-serving PM (21+ years). Led Canada through WWII and expanded social programs. Known for his eccentric spiritualism."
        ),
        PrimeMinister(
            number: 11,
            name: "R.B. Bennett",
            party: "Conservative",
            termStart: 1930,
            termEnd: 1935,
            terms: "1930–1935",
            description: "Led during the Great Depression. Created the Bank of Canada and Canadian Broadcasting Corporation. Later became a British Viscount."
        ),
        PrimeMinister(
            number: 12,
            name: "Louis St. Laurent",
            party: "Liberal",
            termStart: 1948,
            termEnd: 1957,
            terms: "1948–1957",
            description: "Known as 'Uncle Louis.' Oversaw Newfoundland joining Confederation and Canada's role in creating NATO. Built the Trans-Canada Highway."
        ),
        PrimeMinister(
            number: 13,
            name: "John Diefenbaker",
            party: "Progressive Conservative",
            termStart: 1957,
            termEnd: 1963,
            terms: "1957–1963",
            description: "Champion of human rights who created the Canadian Bill of Rights. Extended voting rights to Indigenous peoples and expanded northern development."
        ),
        PrimeMinister(
            number: 14,
            name: "Lester B. Pearson",
            party: "Liberal",
            termStart: 1963,
            termEnd: 1968,
            terms: "1963–1968",
            description: "Nobel Peace Prize winner for resolving the Suez Crisis. Introduced universal healthcare, the Canada Pension Plan, and the maple leaf flag."
        ),
        PrimeMinister(
            number: 15,
            name: "Pierre Elliott Trudeau",
            party: "Liberal",
            termStart: 1968,
            termEnd: 1984,
            terms: "1968–1979, 1980–1984",
            description: "Charismatic leader who patriated the Constitution and created the Charter of Rights and Freedoms. Implemented official bilingualism."
        ),
        PrimeMinister(
            number: 16,
            name: "Joe Clark",
            party: "Progressive Conservative",
            termStart: 1979,
            termEnd: 1980,
            terms: "1979–1980",
            description: "Youngest PM at 39. His minority government fell after just 9 months. Later served as External Affairs Minister and PC Party leader."
        ),
        PrimeMinister(
            number: 17,
            name: "John Turner",
            party: "Liberal",
            termStart: 1984,
            termEnd: 1984,
            terms: "1984 (79 days)",
            description: "Second shortest-serving PM. Served 79 days before calling an election that resulted in a historic defeat. Former Olympic sprinter."
        ),
        PrimeMinister(
            number: 18,
            name: "Brian Mulroney",
            party: "Progressive Conservative",
            termStart: 1984,
            termEnd: 1993,
            terms: "1984–1993",
            description: "Negotiated free trade agreements with the US and Mexico (NAFTA). Fought against South African apartheid. Won two majority governments."
        ),
        PrimeMinister(
            number: 19,
            name: "Kim Campbell",
            party: "Progressive Conservative",
            termStart: 1993,
            termEnd: 1993,
            terms: "1993 (132 days)",
            description: "Canada's first and only female Prime Minister. Served 132 days. Her party was reduced to 2 seats in the subsequent election."
        ),
        PrimeMinister(
            number: 20,
            name: "Jean Chrétien",
            party: "Liberal",
            termStart: 1993,
            termEnd: 2003,
            terms: "1993–2003",
            description: "Won three consecutive majority governments. Known for eliminating the federal deficit. Kept Canada out of the Iraq War."
        ),
        PrimeMinister(
            number: 21,
            name: "Paul Martin",
            party: "Liberal",
            termStart: 2003,
            termEnd: 2006,
            terms: "2003–2006",
            description: "As Finance Minister, eliminated the deficit. As PM, created the Kelowna Accord for Indigenous peoples and legalized same-sex marriage."
        ),
        PrimeMinister(
            number: 22,
            name: "Stephen Harper",
            party: "Conservative",
            termStart: 2006,
            termEnd: 2015,
            terms: "2006–2015",
            description: "Economist who led Canada through the 2008 financial crisis. Issued a formal apology for residential schools. Won three elections."
        ),
        PrimeMinister(
            number: 23,
            name: "Justin Trudeau",
            party: "Liberal",
            termStart: 2015,
            termEnd: 2025,
            terms: "2015–2025",
            description: "Son of Pierre Trudeau. Legalized cannabis, implemented carbon pricing, and led pandemic response. First PM born after 1950."
        ),
        PrimeMinister(
            number: 24,
            name: "Mark Carney",
            party: "Liberal",
            termStart: 2025,
            termEnd: nil,
            terms: "2025–Present",
            description: "Former Governor of the Bank of Canada and Bank of England. First former central banker to become PM. Focused on economic policy."
        )
    ]
}
