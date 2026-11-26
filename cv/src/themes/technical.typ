#import "../model.typ": resolve, today-label

#let accent = rgb("#B45309")
#let ink = rgb("#1F2328")
#let muted = rgb("#6B7280")
#let hair = rgb("#D6D3D1")
#let body-font = ("Inter", "DejaVu Sans")
#let mono-font = ("JetBrainsMono NF", "DejaVu Sans Mono")

#let contact-line(contacts) = {
  contacts
    .map(c => if c.url == none { c.text } else { link(c.url)[#c.text] })
    .join([  \/  ])
}

#let section(number, title, body) = {
  v(2.1mm)
  grid(
    columns: (9mm, 1fr),
    column-gutter: 2mm,
    [
      #text(font: mono-font, size: 8pt, fill: accent)[#number /]
    ],
    [
      #text(
        font: mono-font,
        size: 8pt,
        weight: 700,
        tracking: 0.06em,
        fill: ink,
      )[#upper(title)]
      #v(0.7mm)
      #line(length: 100%, stroke: 0.5pt + hair)
      #v(1.2mm)
      #body
    ],
  )
}

#let skill-grid(skills) = {
  let cells = ()
  for (label, items) in skills {
    cells.push(
      text(font: mono-font, size: 7.8pt, fill: muted)[#upper(label)],
    )
    cells.push(items.join(", "))
  }
  grid(columns: (25mm, 1fr), row-gutter: 1.2mm, column-gutter: 3mm, ..cells)
}

#let teaching-grid(teaching) = {
  let cells = ()
  for group in teaching {
    cells.push(
      text(font: mono-font, size: 7.8pt, fill: muted)[#upper(group.label)],
    )
    cells.push(group.text)
  }
  grid(columns: (27mm, 1fr), row-gutter: 1.3mm, column-gutter: 3mm, ..cells)
}

#let education-block(e, showNote: true) = {
  grid(
    columns: (1fr, auto),
    column-gutter: 4mm,
    [
      #text(size: 9.8pt, weight: 700)[#e.institution]
      #h(2pt)
      #text(size: 8.4pt, fill: muted)[· #e.location]
    ],
    align(right)[
      #text(font: mono-font, size: 7.8pt, fill: muted)[#e.period]
    ],
  )
  v(0.7mm)
  text(size: 8.7pt)[#e.facultyShort · #e.program]
  if showNote and e.note != none {
    v(0.6mm)
    text(size: 8.2pt, fill: muted)[#e.note]
  }
}

#let entry(e) = {
  grid(
    columns: (1fr, auto),
    column-gutter: 4mm,
    [
      #text(size: 9.9pt, weight: 700)[#e.title]
      #if e.link != none [
        #h(2pt)
        #text(font: mono-font, size: 7.6pt, fill: muted)[#link(e.link.url)[#e.link.label]]
      ]
    ],
    align(right)[
      #if e.period != none [
        #text(font: mono-font, size: 7.8pt, fill: muted)[#e.period]
      ]
    ],
  )
  let meta = ()
  if e.role != none and e.role != "автор" { meta.push(e.role) }
  if e.team != none { meta.push(e.team) }
  if e.stack.len() > 0 { meta.push(e.stack.join(" · ")) }
  if meta.len() > 0 {
    v(0.45mm)
    text(size: 8.4pt, fill: muted)[#meta.join(" · ")]
  }
  v(0.7mm)
  list(..e.bullets)
}

#let header(m) = {
  grid(
    columns: (1fr, 26mm),
    column-gutter: 7mm,
    align: (left + top, right + top),
    [
      #text(font: mono-font, size: 7.8pt, fill: accent)[#upper(m.kicker)]
      #v(2mm)
      #text(size: 19.5pt, weight: 700, tracking: -0.015em)[#m.person.fullName]
      #v(1.2mm)
      #text(size: 9.8pt, weight: 600)[#m.headline]
      #v(3.5mm)
      #text(font: mono-font, size: 7.5pt, fill: muted)[#contact-line(m.person.contacts)]
    ],
    box(
      width: 26mm,
      height: 26mm,
      radius: 1.5mm,
      clip: true,
      image(
        m.person.photo,
        width: 26mm,
        height: 26mm,
        fit: "cover",
      ),
    ),
  )
  v(3.2mm)
  line(length: 100%, stroke: 0.8pt + ink)
  v(0.8mm)
  line(length: 24mm, stroke: 2pt + accent)
}

#let render(profile) = {
  let m = resolve(profile)

  set document(
    title: "Плотников Даниил — CV (" + profile.id + ")",
    author: m.person.fullName,
    keywords: ("CV", "backend", "Go", "C++", "Rust"),
  )
  set page(
    paper: "a4",
    margin: (x: 15mm, top: 9mm, bottom: 9mm),
    footer: align(
      center,
      text(font: mono-font, size: 6.8pt, fill: muted)[
        обновлено: #today-label
      ],
    ),
  )
  set text(
    font: body-font,
    size: 8.8pt,
    lang: "ru",
    region: "RU",
    fill: ink,
    hyphenate: false,
  )
  set par(justify: false, leading: 0.45em)
  set list(
    marker: text(font: mono-font, fill: accent)[›],
    indent: 0.55em,
    body-indent: 0.35em,
    spacing: 0.4em,
  )
  show link: it => text(fill: accent, it)

  header(m)

  if m.summary != none {
    section("01", "Профиль", m.summary)
  }
  section("02", "Технологии", skill-grid(m.skills))
  section("03", "Проекты", {
    for (i, e) in m.projects.enumerate() [
      #if i > 0 [#v(1.0mm)]
      #entry(e)
    ]
  })
  if m.teaching.len() > 0 {
    section("04", "Преподавание и организация", teaching-grid(m.teaching))
  }
  section("05", "Образование", {
    let lang-line = m.languages
      .map(pair => [#pair.at(0) — #pair.at(1)])
      .join([ ·  ])
    education-block(m.education, showNote: m.showEducationNote)
    v(1.4mm)
    text(size: 8.4pt)[
      #text(font: mono-font, size: 7.4pt, fill: muted)[ЯЗЫКИ] #lang-line
    ]
  })
}
