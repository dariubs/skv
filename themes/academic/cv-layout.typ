// ── Palette ───────────────────────────────────────────────────
#let ink    = rgb("#1a1a18")
#let gold   = rgb("#e8c84a")
#let muted  = rgb("#6b6b62")
#let faint  = rgb("#a0a096")
#let border = rgb("#e2dfd6")

// ── Sidebar helpers ───────────────────────────────────────────
#let sidelabel(t) = {
  v(0.65em)
  block(below: 0.2em,
    text(size: 6.5pt, weight: "bold", fill: ink, tracking: 0.07em, upper(t))
  )
}

#let siderow(t) = text(size: 8pt, fill: muted, t)

// ── Main render ───────────────────────────────────────────────
#let render-cv(data, body) = {
  set page(
    paper: "us-letter",
    margin: (top: 0.9in, bottom: 0.9in, left: 0.75in, right: 0.75in),
    numbering: none,
  )
  set text(font: "Tilda Sans VF", size: 10pt, fill: ink)
  set par(leading: 0.65em)

  show heading.where(level: 2): it => block(above: 1.2em, below: 0.5em, {
    text(size: 7.5pt, weight: "bold", tracking: 0.06em, upper(it.body))
    v(-0.3em)
    line(length: 100%, stroke: 1pt + gold)
  })
  show heading.where(level: 3): it => block(above: 0.9em, below: 0.2em,
    text(size: 10pt, weight: "bold", it.body)
  )
  show link: it => text(fill: ink, it)

  // ── Sidebar content ───────────────────────────────────────
  let sidebar = {
    text(size: 11pt, weight: "bold", fill: ink, data.name)
    v(0.2em)
    line(length: 100%, stroke: 1.5pt + gold)
    v(0.25em)

    siderow(data.position);    linebreak()
    siderow(data.at("department",  default: "")); linebreak()
    siderow(data.at("institution", default: "")); linebreak()
    siderow(data.at("university",  default: ""))

    sidelabel("Contact")
    siderow(data.at("location", default: ""))
    linebreak()
    link("mailto:" + data.email, text(size: 8pt, fill: ink, data.email))

    if data.at("website", default: none) != none {
      linebreak()
      link(data.website, siderow("Website"))
    }
    if data.at("linkedin", default: none) != none {
      linebreak()
      link("https://" + data.linkedin, siderow("LinkedIn"))
    }
    if data.at("googlescholar", default: none) != none {
      linebreak()
      link("https://" + data.googlescholar, siderow("Google Scholar"))
    }
    if data.at("orcid", default: none) != none {
      linebreak()
      link("https://orcid.org/" + data.orcid,
        siderow("ORCID: " + data.orcid))
    }
    if data.at("github", default: none) != none {
      linebreak()
      link("https://" + data.github, siderow("GitHub"))
    }

    if data.at("supervisor", default: none) != none {
      sidelabel("Supervisor")
      siderow(data.supervisor)
      if data.at("cosupervisor", default: none) != none {
        linebreak()
        siderow(data.cosupervisor + " (co-supervisor)")
      }
    }

    if data.at("affiliation", default: none) != none {
      sidelabel("Affiliation")
      siderow(data.affiliation)
    }

    let interests = data.at("interests", default: ())
    if interests.len() > 0 {
      sidelabel("Interests")
      for item in interests {
        siderow("• " + item)
        linebreak()
      }
    }

    let skills = data.at("skills", default: ())
    if skills.len() > 0 {
      sidelabel("Skills")
      for skill in skills {
        text(size: 8pt, weight: "bold", fill: ink, skill.category)
        linebreak()
        siderow(skill.items)
        v(0.25em)
      }
    }

    let languages = data.at("languages", default: ())
    if languages.len() > 0 {
      sidelabel("Languages")
      for lang in languages {
        grid(
          columns: (1fr, auto),
          text(size: 8pt, fill: ink,   lang.lang),
          text(size: 8pt, fill: faint, lang.level),
        )
      }
    }

    if data.at("updated", default: none) != none {
      v(1em)
      text(size: 6.5pt, fill: faint, style: "italic",
        "Updated: " + data.updated)
    }
  }

  // ── Two-column layout ─────────────────────────────────────
  grid(
    columns: (28%, 4%, 68%),
    align: top,
    sidebar,
    [],
    body,
  )
}
