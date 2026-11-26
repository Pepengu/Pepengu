#import "../content/person.typ": person
#import "../content/entries.typ": entries

#let month-names = (
  "январь",
  "февраль",
  "март",
  "апрель",
  "май",
  "июнь",
  "июль",
  "август",
  "сентябрь",
  "октябрь",
  "ноябрь",
  "декабрь",
)

#let today-label = {
  let today = datetime.today()
  month-names.at(today.month() - 1) + " " + str(today.year())
}

#let bullet-text(bullet) = if type(bullet) == dictionary {
  bullet.at("text")
} else {
  bullet
}

#let resolve-bullets(id, base, override, profile) = {
  let limit = profile
    .at("limits", default: (:))
    .at(id, default: profile.at("defaultLimit", default: 3))

  // An explicit override wins over tag-based selection.
  let explicit = override.at("bullets", default: none)
  if explicit != none {
    return explicit
      .slice(0, calc.min(limit, explicit.len()))
      .map(bullet-text)
  }

  let focus = profile.at("focus", default: ())
  let scored = ()

  for (index, bullet) in base.bullets.enumerate() {
    let tags = if type(bullet) == dictionary {
      bullet.at("tags", default: ())
    } else {
      ()
    }

    let keep = tags.len() == 0
    let score = 900

    for (position, tag) in focus.enumerate() {
      if tags.contains(tag) {
        keep = true
        score = calc.min(score, position)
      }
    }

    if tags.contains("core") {
      keep = true
      score = 0
    }

    if keep {
      scored.push((score: score, index: index, text: bullet-text(bullet)))
    }
  }

  // If nothing matches the profile's focus, still show the first bullets.
  if scored.len() == 0 {
    scored = base.bullets
      .slice(0, calc.min(limit, base.bullets.len()))
      .enumerate()
      .map(((bullet, index)) => (
        score: 1000,
        index: index,
        text: bullet-text(bullet),
      ))
  }

  scored
    .sorted(key: item => item.score * 10000 + item.index)
    .slice(0, calc.min(limit, scored.len()))
    .map(item => item.text)
}

#let resolve-entry(id, profile) = {
  let base = entries.at(id)
  let override = profile
    .at("overrides", default: (:))
    .at(id, default: (:))

  let pick(key, fallback: none) = override.at(
    key,
    default: base.at(key, default: fallback),
  )

  (
    id: id,
    title: pick("title"),
    subtitle: pick("subtitle"),
    role: pick("role"),
    team: pick("team"),
    period: pick("period"),
    link: pick("link"),
    stack: pick("stack", fallback: ()),
    bullets: resolve-bullets(id, base, override, profile),
  )
}

#let resolve(profile) = {
  let projects = profile.projects.map(id => resolve-entry(id, profile))
  let teaching = if profile.at("showTeaching", default: true) {
    person.teaching
  } else {
    ()
  }

  (
    person: person,
    kicker: profile.at("kicker", default: ""),
    headline: profile.headline,
    summary: profile.at("summary", default: none),
    skills: profile.at("skills", default: ()),
    projects: projects,
    teaching: teaching,
    education: person.education,
    showEducationNote: profile.at("showEducationNote", default: true),
    languages: person.languages,
  )
}
