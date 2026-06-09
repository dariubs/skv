#import "themes/academic/cv-layout.typ": render-cv

// ── Sidebar data ─────────────────────────────────────────────
#let data = (
  name:         "Sanaz Kakavand",
  position:     "PhD Candidate",
  department:   "Business Technology Management",
  institution:  "Haskayne School of Business",
  university:   "University of Calgary",
  location:     "Calgary, AB, Canada",
  email:        "sanazkv@gmail.com",
  website:      "https://sanazkv.github.io/skv",
  linkedin:     "linkedin.com/in/sanazkakavand",
  googlescholar: none,
  orcid:        none,
  github:       "github.com/sanazkv",
  supervisor:   "Dr. Hooman Hidaji",
  cosupervisor: none,
  affiliation:  "Informatics Research Centre (iRC)",
  interests: (
    "Digital Platform Economics",
    "Privacy & Data Regulation",
    "Blockchain & Token Systems",
    "Behavioral Economics",
    "User Welfare",
  ),
  languages: (
    (lang: "English",         level: "Fluent"),
    (lang: "Persian (Farsi)", level: "Native"),
  ),
  skills: (
    (category: "Methods", items: "Analytical Modelling, Empirical Analysis, Game Theory"),
    (category: "Tools",   items: "Stata, R, Python, LaTeX"),
  ),
  updated: "June 2026",
)

// ── CV body ──────────────────────────────────────────────────
#let body = [
  == Education

  *PhD, Business Technology Management* · 2021 – present \
  Haskayne School of Business, University of Calgary \
  Supervisor: Dr. Hooman Hidaji · Informatics Research Centre (iRC)

  *Master's Degree* · prior to 2021, Iran

  == Dissertation

  _Monetization Models and User Behavior on Digital Platforms_

  === Chapter 1 — Blockchain & Move-to-Earn Gaming

  Analyzes tokenized incentive systems using STEPN as a case study. Examines how financial rewards interact with intrinsic motivation, user retention, and long-run platform sustainability.

  === Chapter 2 — Consent-or-Pay Monetization and User Welfare

  Studies welfare implications of consent-based monetization under GDPR. Focuses on "Consent-or-Pay" mechanisms and their effects on user welfare, firm profitability, and market efficiency.

  === Chapter 3 — Privacy Regulation and Platform Behavior _(in progress)_

  Examines how broad data privacy frameworks shape platform investment, competition, and user outcomes.

  == Teaching

  *Teaching Assistant*, Haskayne School of Business, University of Calgary · 2021 – present

  Courses and details available upon request.

  == Awards & Recognition

  - Student Spotlight, University of Calgary · 2024

  == Publications & Working Papers

  Working papers available upon request. Please contact
  #link("mailto:sanazkv@gmail.com")[sanazkv\@gmail.com].
]

// ── Render ───────────────────────────────────────────────────
#render-cv(data, body)
