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
    let birthDate: String
    let deathDate: String?
    let birthPlace: String
    let keyAchievements: [String]
    let notableFacts: [String]

    /// Local asset image name (e.g., "pm01", "pm02", etc.)
    var imageName: String {
        String(format: "pm%02d", number)
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
            description: "Canada's first Prime Minister and a Father of Confederation. He oversaw the construction of the Canadian Pacific Railway and the expansion of Canada westward.",
            birthDate: "January 11, 1815",
            deathDate: "June 6, 1891",
            birthPlace: "Glasgow, Scotland",
            keyAchievements: [
                "Led the movement for Canadian Confederation",
                "Oversaw construction of the Canadian Pacific Railway",
                "Expanded Canada to include Manitoba, British Columbia, and PEI",
                "Established the North-West Mounted Police (now RCMP)",
                "Served as PM for nearly 19 years total"
            ],
            notableFacts: [
                "Immigrated to Canada at age 5",
                "Practiced law in Kingston, Ontario",
                "Known for his wit and political cunning",
                "His image appears on the Canadian $10 bill",
                "Died in office during his second tenure"
            ]
        ),
        PrimeMinister(
            number: 2,
            name: "Alexander Mackenzie",
            party: "Liberal",
            termStart: 1873,
            termEnd: 1878,
            terms: "1873–1878",
            description: "First Liberal PM. Introduced the secret ballot and created the Supreme Court of Canada. Known for his integrity and frugal management of public finances.",
            birthDate: "January 28, 1822",
            deathDate: "April 17, 1892",
            birthPlace: "Logierait, Scotland",
            keyAchievements: [
                "Created the Supreme Court of Canada (1875)",
                "Introduced the secret ballot for elections",
                "Established the Office of the Auditor General",
                "Founded the Royal Military College of Canada",
                "Expanded the Intercolonial Railway"
            ],
            notableFacts: [
                "Worked as a stonemason before politics",
                "Only PM to personally decline knighthood",
                "Known as 'the Stonemason Premier'",
                "Lost the 1878 election to Macdonald",
                "Remained Opposition leader until 1880"
            ]
        ),
        PrimeMinister(
            number: 3,
            name: "Sir John Abbott",
            party: "Conservative",
            termStart: 1891,
            termEnd: 1892,
            terms: "1891–1892",
            description: "First Canadian-born Prime Minister. Served briefly after Macdonald's death. Previously served as Mayor of Montreal and Dean of McGill Law Faculty.",
            birthDate: "March 12, 1821",
            deathDate: "October 30, 1893",
            birthPlace: "St. Andrews, Lower Canada",
            keyAchievements: [
                "First Canadian-born Prime Minister",
                "Dean of McGill University's Law Faculty",
                "Mayor of Montreal (1887-1889)",
                "Key advisor in building the CPR",
                "Helped draft Canada's first insolvency legislation"
            ],
            notableFacts: [
                "Reluctantly became PM at age 70",
                "Famous quote: 'I hate politics'",
                "Resigned due to ill health",
                "Served in the Senate while PM",
                "Died just a year after leaving office"
            ]
        ),
        PrimeMinister(
            number: 4,
            name: "Sir John Thompson",
            party: "Conservative",
            termStart: 1892,
            termEnd: 1894,
            terms: "1892–1894",
            description: "Reformed Canadian criminal law and created the Criminal Code. Died suddenly at Windsor Castle after being sworn into the British Privy Council.",
            birthDate: "November 10, 1845",
            deathDate: "December 12, 1894",
            birthPlace: "Halifax, Nova Scotia",
            keyAchievements: [
                "Created Canada's Criminal Code (1892)",
                "Reformed the criminal justice system",
                "Premier of Nova Scotia before federal politics",
                "Served as Minister of Justice",
                "Strong advocate for Canadian sovereignty"
            ],
            notableFacts: [
                "Converted to Catholicism upon marriage",
                "Died at Windsor Castle after meeting Queen Victoria",
                "His body was returned to Canada on HMS Blenheim",
                "Considered one of Canada's most capable PMs",
                "Only served 2 years before his sudden death"
            ]
        ),
        PrimeMinister(
            number: 5,
            name: "Sir Mackenzie Bowell",
            party: "Conservative",
            termStart: 1894,
            termEnd: 1896,
            terms: "1894–1896",
            description: "Rose from newspaper editor to Prime Minister. His government was plagued by the Manitoba Schools Question crisis.",
            birthDate: "December 27, 1823",
            deathDate: "December 10, 1917",
            birthPlace: "Rickinghall, England",
            keyAchievements: [
                "Rose from printer's apprentice to PM",
                "Served as Minister of Customs for 14 years",
                "Grand Master of the Orange Order",
                "Longest-serving Senator (over 40 years)",
                "Lived to age 93"
            ],
            notableFacts: [
                "Founded the Belleville Intelligencer newspaper",
                "Faced cabinet revolt ('Nest of Traitors')",
                "Resigned after losing cabinet support",
                "Continued serving in Senate until death",
                "One of the least remembered PMs"
            ]
        ),
        PrimeMinister(
            number: 6,
            name: "Sir Charles Tupper",
            party: "Conservative",
            termStart: 1896,
            termEnd: 1896,
            terms: "1896 (68 days)",
            description: "Shortest-serving PM at just 68 days. A Father of Confederation who was instrumental in bringing Nova Scotia into Canada.",
            birthDate: "July 2, 1821",
            deathDate: "October 30, 1915",
            birthPlace: "Amherst, Nova Scotia",
            keyAchievements: [
                "Father of Confederation",
                "Brought Nova Scotia into Confederation",
                "Premier of Nova Scotia (1864-1867)",
                "High Commissioner to the UK",
                "Helped establish free public education in NS"
            ],
            notableFacts: [
                "Shortest-serving PM (68 days)",
                "Oldest person to become PM (age 74)",
                "Lived to age 94",
                "Called the 'War Horse of Cumberland'",
                "Lost the 1896 election to Laurier"
            ]
        ),
        PrimeMinister(
            number: 7,
            name: "Sir Wilfrid Laurier",
            party: "Liberal",
            termStart: 1896,
            termEnd: 1911,
            terms: "1896–1911",
            description: "First francophone PM. Oversaw massive immigration and the creation of Alberta and Saskatchewan. His image appears on the Canadian $5 bill.",
            birthDate: "November 20, 1841",
            deathDate: "February 17, 1919",
            birthPlace: "Saint-Lin, Canada East",
            keyAchievements: [
                "First francophone Prime Minister",
                "Created provinces of Alberta and Saskatchewan",
                "Oversaw massive immigration boom",
                "Built second transcontinental railway",
                "Promoted Canadian autonomy within British Empire"
            ],
            notableFacts: [
                "Served 15 consecutive years as PM",
                "His image appears on the $5 bill",
                "Famous quote: 'Canada is free and freedom is its nationality'",
                "Fluent in both English and French",
                "Died while still serving as Opposition leader"
            ]
        ),
        PrimeMinister(
            number: 8,
            name: "Sir Robert Borden",
            party: "Conservative",
            termStart: 1911,
            termEnd: 1920,
            terms: "1911–1920",
            description: "Led Canada through WWI. Fought for and won Canada's right to sign the Treaty of Versailles independently. Introduced income tax as a 'temporary' measure.",
            birthDate: "June 26, 1854",
            deathDate: "June 10, 1937",
            birthPlace: "Grand-Pré, Nova Scotia",
            keyAchievements: [
                "Led Canada through World War I",
                "Won Canada's right to sign Treaty of Versailles",
                "Introduced federal income tax (1917)",
                "Granted women the right to vote federally",
                "Created the Canadian National Railways"
            ],
            notableFacts: [
                "Introduced conscription during WWI",
                "His image appeared on the $100 bill",
                "Formed wartime coalition government",
                "Expanded Canada's international standing",
                "Income tax was meant to be 'temporary'"
            ]
        ),
        PrimeMinister(
            number: 9,
            name: "Arthur Meighen",
            party: "Conservative",
            termStart: 1920,
            termEnd: 1921,
            terms: "1920–1921, 1926",
            description: "Served two brief terms. Known for his oratorical skills and role in the Winnipeg General Strike. Later served in the Senate.",
            birthDate: "June 16, 1874",
            deathDate: "August 5, 1960",
            birthPlace: "Anderson, Ontario",
            keyAchievements: [
                "Brilliant parliamentary debater",
                "Drafted the War Measures Act",
                "Served as Solicitor General",
                "Later served as Senator and Senate leader",
                "Secretary of State during WWI"
            ],
            notableFacts: [
                "Served two non-consecutive terms",
                "Second term lasted only 3 months",
                "Lost to Mackenzie King twice",
                "Known for photographic memory",
                "Considered one of Canada's greatest orators"
            ]
        ),
        PrimeMinister(
            number: 10,
            name: "William Lyon Mackenzie King",
            party: "Liberal",
            termStart: 1921,
            termEnd: 1948,
            terms: "1921–1926, 1926–1930, 1935–1948",
            description: "Canada's longest-serving PM (21+ years). Led Canada through WWII and expanded social programs. Known for his eccentric spiritualism.",
            birthDate: "December 17, 1874",
            deathDate: "July 22, 1950",
            birthPlace: "Berlin (now Kitchener), Ontario",
            keyAchievements: [
                "Longest-serving PM (21 years, 154 days)",
                "Led Canada through World War II",
                "Introduced unemployment insurance",
                "Established family allowances",
                "Won five federal elections"
            ],
            notableFacts: [
                "Grandson of rebel William Lyon Mackenzie",
                "Held séances and consulted mediums",
                "Never married; devoted to his mother",
                "His diary revealed his eccentric beliefs",
                "Kingsmere estate is now a national park"
            ]
        ),
        PrimeMinister(
            number: 11,
            name: "R.B. Bennett",
            party: "Conservative",
            termStart: 1930,
            termEnd: 1935,
            terms: "1930–1935",
            description: "Led during the Great Depression. Created the Bank of Canada and Canadian Broadcasting Corporation. Later became a British Viscount.",
            birthDate: "July 3, 1870",
            deathDate: "June 26, 1947",
            birthPlace: "Hopewell Hill, New Brunswick",
            keyAchievements: [
                "Created the Bank of Canada",
                "Founded the Canadian Broadcasting Corporation",
                "Established the Canadian Wheat Board",
                "Created unemployment relief camps",
                "Attempted New Deal-style reforms"
            ],
            notableFacts: [
                "Self-made millionaire before politics",
                "Personally donated millions during Depression",
                "Moved to England after losing power",
                "Became Viscount Bennett in 1941",
                "Only Canadian PM to die in the UK"
            ]
        ),
        PrimeMinister(
            number: 12,
            name: "Louis St. Laurent",
            party: "Liberal",
            termStart: 1948,
            termEnd: 1957,
            terms: "1948–1957",
            description: "Known as 'Uncle Louis.' Oversaw Newfoundland joining Confederation and Canada's role in creating NATO. Built the Trans-Canada Highway.",
            birthDate: "February 1, 1882",
            deathDate: "July 25, 1973",
            birthPlace: "Compton, Quebec",
            keyAchievements: [
                "Brought Newfoundland into Confederation",
                "Co-founded NATO",
                "Built the Trans-Canada Highway",
                "Created the St. Lawrence Seaway",
                "Introduced old age security pension"
            ],
            notableFacts: [
                "Nicknamed 'Uncle Louis'",
                "Fluently bilingual from childhood",
                "Successful corporate lawyer before politics",
                "Oversaw post-war prosperity",
                "Lost to Diefenbaker in 1957 landslide"
            ]
        ),
        PrimeMinister(
            number: 13,
            name: "John Diefenbaker",
            party: "Progressive Conservative",
            termStart: 1957,
            termEnd: 1963,
            terms: "1957–1963",
            description: "Champion of human rights who created the Canadian Bill of Rights. Extended voting rights to Indigenous peoples and expanded northern development.",
            birthDate: "September 18, 1895",
            deathDate: "August 16, 1979",
            birthPlace: "Neustadt, Ontario",
            keyAchievements: [
                "Created the Canadian Bill of Rights",
                "Extended voting rights to Indigenous peoples",
                "Appointed first female cabinet minister",
                "Won largest majority in Canadian history (1958)",
                "Championed northern development"
            ],
            notableFacts: [
                "First PM of non-British/French descent",
                "Famous for his fiery oratory",
                "Cancelled the Avro Arrow project",
                "Refused to accept nuclear warheads",
                "His funeral train crossed Canada"
            ]
        ),
        PrimeMinister(
            number: 14,
            name: "Lester B. Pearson",
            party: "Liberal",
            termStart: 1963,
            termEnd: 1968,
            terms: "1963–1968",
            description: "Nobel Peace Prize winner for resolving the Suez Crisis. Introduced universal healthcare, the Canada Pension Plan, and the maple leaf flag.",
            birthDate: "April 23, 1897",
            deathDate: "December 27, 1972",
            birthPlace: "Newtonbrook, Ontario",
            keyAchievements: [
                "Won Nobel Peace Prize (1957)",
                "Introduced universal healthcare",
                "Created the Canada Pension Plan",
                "Adopted the maple leaf flag",
                "Unified the Canadian Armed Forces"
            ],
            notableFacts: [
                "Played semi-professional baseball",
                "Served in WWI Royal Flying Corps",
                "Never won a majority government",
                "Called 'Mike' by friends",
                "Toronto airport named after him"
            ]
        ),
        PrimeMinister(
            number: 15,
            name: "Pierre Elliott Trudeau",
            party: "Liberal",
            termStart: 1968,
            termEnd: 1984,
            terms: "1968–1979, 1980–1984",
            description: "Charismatic leader who patriated the Constitution and created the Charter of Rights and Freedoms. Implemented official bilingualism.",
            birthDate: "October 18, 1919",
            deathDate: "September 28, 2000",
            birthPlace: "Montreal, Quebec",
            keyAchievements: [
                "Patriated the Constitution (1982)",
                "Created Charter of Rights and Freedoms",
                "Implemented official bilingualism",
                "Invoked War Measures Act (1970)",
                "Established multiculturalism as policy"
            ],
            notableFacts: [
                "Known for 'Trudeaumania'",
                "Famous pirouette behind Queen Elizabeth",
                "Said 'Just watch me' during October Crisis",
                "Married while in office",
                "Father of Justin Trudeau"
            ]
        ),
        PrimeMinister(
            number: 16,
            name: "Joe Clark",
            party: "Progressive Conservative",
            termStart: 1979,
            termEnd: 1980,
            terms: "1979–1980",
            description: "Youngest PM at 39. His minority government fell after just 9 months. Later served as External Affairs Minister and PC Party leader.",
            birthDate: "June 5, 1939",
            deathDate: nil,
            birthPlace: "High River, Alberta",
            keyAchievements: [
                "Youngest PM in Canadian history",
                "Later served as External Affairs Minister",
                "Constitutional Affairs Minister under Mulroney",
                "Helped unite PC and Alliance parties",
                "Promoted human rights internationally"
            ],
            notableFacts: [
                "Government fell on budget vote",
                "Served only 272 days",
                "Called 'Joe Who?' by media initially",
                "Married to Maureen McTeer",
                "Remains politically active today"
            ]
        ),
        PrimeMinister(
            number: 17,
            name: "John Turner",
            party: "Liberal",
            termStart: 1984,
            termEnd: 1984,
            terms: "1984 (79 days)",
            description: "Second shortest-serving PM. Served 79 days before calling an election that resulted in a historic defeat. Former Olympic sprinter.",
            birthDate: "June 7, 1929",
            deathDate: "September 19, 2020",
            birthPlace: "Richmond, England",
            keyAchievements: [
                "Served as Finance Minister and Justice Minister",
                "Olympic-caliber sprinter",
                "Rhodes Scholar",
                "Corporate lawyer before politics",
                "Led Liberal opposition 1984-1990"
            ],
            notableFacts: [
                "Second shortest-serving PM (79 days)",
                "Lost to Mulroney in landslide",
                "Famous debate moment on patronage",
                "Held Canadian 100m sprint record",
                "Called 'Canada's Kennedy' in his youth"
            ]
        ),
        PrimeMinister(
            number: 18,
            name: "Brian Mulroney",
            party: "Progressive Conservative",
            termStart: 1984,
            termEnd: 1993,
            terms: "1984–1993",
            description: "Negotiated free trade agreements with the US and Mexico (NAFTA). Fought against South African apartheid. Won two majority governments.",
            birthDate: "March 20, 1939",
            deathDate: "February 29, 2024",
            birthPlace: "Baie-Comeau, Quebec",
            keyAchievements: [
                "Negotiated Canada-US Free Trade Agreement",
                "Created NAFTA with US and Mexico",
                "Led fight against South African apartheid",
                "Introduced the GST",
                "Won two consecutive majorities"
            ],
            notableFacts: [
                "Won largest majority in 1984 (211 seats)",
                "Bilingual from Irish-Québécois background",
                "Previously CEO of Iron Ore Company",
                "Left office with low approval ratings",
                "Reputation improved significantly after death"
            ]
        ),
        PrimeMinister(
            number: 19,
            name: "Kim Campbell",
            party: "Progressive Conservative",
            termStart: 1993,
            termEnd: 1993,
            terms: "1993 (132 days)",
            description: "Canada's first and only female Prime Minister. Served 132 days. Her party was reduced to 2 seats in the subsequent election.",
            birthDate: "March 10, 1947",
            deathDate: nil,
            birthPlace: "Port Alberni, British Columbia",
            keyAchievements: [
                "First and only female PM of Canada",
                "First PM born in British Columbia",
                "Previously served as Defence Minister",
                "First female Justice Minister",
                "Later served as Canadian Consul General"
            ],
            notableFacts: [
                "Served only 132 days as PM",
                "Party reduced from 156 to 2 seats",
                "Never sat in Parliament as PM",
                "PhD candidate at LSE",
                "Chaired Club of Madrid democracy group"
            ]
        ),
        PrimeMinister(
            number: 20,
            name: "Jean Chrétien",
            party: "Liberal",
            termStart: 1993,
            termEnd: 2003,
            terms: "1993–2003",
            description: "Won three consecutive majority governments. Known for eliminating the federal deficit. Kept Canada out of the Iraq War.",
            birthDate: "January 11, 1934",
            deathDate: nil,
            birthPlace: "Shawinigan, Quebec",
            keyAchievements: [
                "Won three consecutive majority governments",
                "Eliminated the federal deficit",
                "Kept Canada out of Iraq War",
                "Passed Clarity Act on Quebec secession",
                "Signed Kyoto Protocol"
            ],
            notableFacts: [
                "18th of 19 children",
                "Known as 'the little guy from Shawinigan'",
                "Famous 'Shawinigan Handshake' incident",
                "Facial paralysis from childhood illness",
                "Served under 4 previous Liberal PMs"
            ]
        ),
        PrimeMinister(
            number: 21,
            name: "Paul Martin",
            party: "Liberal",
            termStart: 2003,
            termEnd: 2006,
            terms: "2003–2006",
            description: "As Finance Minister, eliminated the deficit. As PM, created the Kelowna Accord for Indigenous peoples and legalized same-sex marriage.",
            birthDate: "August 28, 1938",
            deathDate: nil,
            birthPlace: "Windsor, Ontario",
            keyAchievements: [
                "Eliminated federal deficit as Finance Minister",
                "Legalized same-sex marriage",
                "Created the Kelowna Accord",
                "Established gas tax for municipalities",
                "Negotiated health accord with provinces"
            ],
            notableFacts: [
                "Son of cabinet minister Paul Martin Sr.",
                "Successful businessman (Canada Steamship Lines)",
                "Long rivalry with Jean Chrétien",
                "Government fell on non-confidence vote",
                "Continues Indigenous advocacy work"
            ]
        ),
        PrimeMinister(
            number: 22,
            name: "Stephen Harper",
            party: "Conservative",
            termStart: 2006,
            termEnd: 2015,
            terms: "2006–2015",
            description: "Economist who led Canada through the 2008 financial crisis. Issued a formal apology for residential schools. Won three elections.",
            birthDate: "April 30, 1959",
            deathDate: nil,
            birthPlace: "Toronto, Ontario",
            keyAchievements: [
                "Led Canada through 2008 financial crisis",
                "Issued residential schools apology",
                "Lowered the GST from 7% to 5%",
                "Created the Tax-Free Savings Account",
                "Signed free trade agreements globally"
            ],
            notableFacts: [
                "Founded the Conservative Party of Canada",
                "Master's degree in economics",
                "Member of rock band (keyboards)",
                "Won three consecutive elections",
                "Longest-serving Conservative PM since Macdonald"
            ]
        ),
        PrimeMinister(
            number: 23,
            name: "Justin Trudeau",
            party: "Liberal",
            termStart: 2015,
            termEnd: 2025,
            terms: "2015–2025",
            description: "Son of Pierre Trudeau. Legalized cannabis, implemented carbon pricing, and led pandemic response. First PM born after 1950.",
            birthDate: "December 25, 1971",
            deathDate: nil,
            birthPlace: "Ottawa, Ontario",
            keyAchievements: [
                "Legalized recreational cannabis",
                "Implemented national carbon pricing",
                "Led COVID-19 pandemic response",
                "Created Canada Child Benefit",
                "Won three federal elections"
            ],
            notableFacts: [
                "Son of Pierre Elliott Trudeau",
                "First PM born after 1950",
                "Former teacher and snowboard instructor",
                "Born on Christmas Day",
                "First PM whose father was also PM"
            ]
        ),
        PrimeMinister(
            number: 24,
            name: "Mark Carney",
            party: "Liberal",
            termStart: 2025,
            termEnd: nil,
            terms: "2025–Present",
            description: "Former Governor of the Bank of Canada and Bank of England. First former central banker to become PM. Focused on economic policy.",
            birthDate: "March 16, 1965",
            deathDate: nil,
            birthPlace: "Fort Smith, Northwest Territories",
            keyAchievements: [
                "Governor of Bank of Canada (2008-2013)",
                "Governor of Bank of England (2013-2020)",
                "UN Special Envoy for Climate Action",
                "Led central banks through 2008 crisis",
                "First former central banker to become PM"
            ],
            notableFacts: [
                "Born in Northwest Territories",
                "Harvard and Oxford educated",
                "Holds both Canadian and British citizenship",
                "Former Goldman Sachs executive",
                "Known for climate finance advocacy"
            ]
        )
    ]
}
