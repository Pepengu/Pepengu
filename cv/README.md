# CV

Typst CV with role-specific profiles. Content is written once and each profile
chooses which projects to show, how to rank bullets, and which skills to lead
with.

## Requirements

- Typst 0.13+
- Fonts: `Inter` and `JetBrainsMono NF`
  (fallbacks: `DejaVu Sans`, `DejaVu Sans Mono`)

## Build

```bash
./build.sh              # build all profiles
./build.sh backend-go   # build one profile
```

Outputs:

- `out/backend-go.pdf`
- `out/systems-cpp.pdf`
- `out/general.pdf`
- `main.pdf` — copy of the general profile, used by the root README

For live editing:

```bash
typst watch --root . profiles/backend-go.typ out/backend-go.pdf
```

## Structure

```text
cv/
├── main.typ                  # general profile -> main.pdf
├── content/
│   ├── person.typ            # name, contacts, education, languages, teaching
│   └── entries.typ           # projects and their tagged bullets
├── config/
│   └── profiles.typ          # per-role configuration
├── profiles/
│   ├── backend-go.typ        # entrypoint
│   ├── systems-cpp.typ
│   └── general.typ
├── src/
│   ├── model.typ             # resolves a profile into a document model
│   ├── theme.typ             # active theme
│   └── themes/technical.typ  # layout
├── assets/portrait.jpg
└── build.sh
```

## Profiles

| Profile | Projects | Focus |
|---|---|---|
| `backend-go` | AF Hackathon, CodeDuels, SPBUConference | Go, PostgreSQL, Docker, web |
| `systems-cpp` | Martos, Runner, capybar | C/C++, Rust, Linux, low-level |
| `general` | AF Hackathon, CodeDuels, Runner, Martos | breadth |

## Adding a project

1. Add an entry to `content/entries.typ`:

```typst
"my-project": (
  title: "My Project",
  subtitle: "Short description",
  role: "автор",
  team: none,
  period: "2026",
  link: (label: "user/repo", url: "https://github.com/user/repo"),
  stack: ("Rust", "Docker"),
  bullets: (
    (tags: ("core", "systems"), text: [What you built and why it matters.]),
    (tags: ("backend"), text: [Another angle on the same project.]),
  ),
),
```

2. Add `"my-project"` to the `projects` list of the profile in
   `config/profiles.typ`, and optionally set a per-entry limit:

```typst
limits: ("my-project": 2),
```

## How bullet selection works

- Every bullet has `tags`.
- `focus` is an ordered list of tags. Bullets matching earlier tags rank higher.
- `core` bullets are always included.
- `limits` caps the number of bullets per entry.
- `overrides` can replace a project's text for one profile:

```typst
overrides: (
  "runner": (
    role: "автор песочницы",
    bullets: (
      [Exact text for this profile only.],
    ),
  ),
),
```

If nothing matches `focus`, the first bullets are shown as a fallback.

## Adding a role profile

1. Add a new entry to `config/profiles.typ`:

```typst
"my-role": (
  id: "my-role",
  kicker: "my / role",
  headline: "Role · key technologies",
  summary: [Two or three lines tailored to this role.],
  projects: ("project-a", "project-b"),
  focus: ("core", "backend", "go"),
  defaultLimit: 2,
  limits: ("project-a": 3),
  skills: (
    ("Языки", ("Go", "Rust")),
    ("Инструменты", ("Docker", "Linux")),
  ),
  showTeaching: true,
  showEducationNote: false,
  overrides: (:),
),
```

2. Copy an entrypoint:

```bash
cp profiles/backend-go.typ profiles/my-role.typ
```

Change `"backend-go"` to `"my-role"` inside it. `build.sh` discovers all
`profiles/*.typ` automatically.

## Notes

- The CV is Russian-only; the content schema supports adding another language
  later, but no localization layer is included.
- `out/` is generated and gitignored. `main.pdf` is tracked because the root
  README links to it.
- The old LaTeX sources were removed; they remain in git history.
