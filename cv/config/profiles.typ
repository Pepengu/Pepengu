#let profiles = (
  "backend-go": (
    id: "backend-go",
    kicker: "backend / go / postgres",
    headline: "Backend-разработчик · Go, PostgreSQL, Docker",
    summary: [
      Студент ПМ-ПУ СПбГУ, разрабатываю backend-сервисы на Go и Rust.
      В командном хакатоне отвечал за интеграцию микросервисов, модель доступа
      и ленту с ранжированием; автор платформы турниров CodeDuels.
    ],
    projects: ("af-hackathon", "codeduels", "spbu-conference"),
    focus: ("core", "go", "backend", "web", "postgres", "docker"),
    defaultLimit: 2,
    limits: (
      "af-hackathon": 3,
      "codeduels": 2,
      "spbu-conference": 1,
    ),
    skills: (
      ("Языки", ("Go", "C/C++", "Rust", "Python", "Elixir", "SQL")),
      ("Backend", ("PostgreSQL", "REST", "SSE", "Docker", "Git", "Linux")),
      ("Frontend", ("React", "TypeScript", "Tailwind")),
      ("Ещё", ("Nix", "Typst", "Neovim")),
    ),
    showTeaching: true,
    showEducationNote: false,
    overrides: (:),
  ),

  "systems-cpp": (
    id: "systems-cpp",
    kicker: "systems / c++ / rust",
    headline: "C++/Rust-разработчик · Linux, низкоуровневая разработка",
    summary: [
      Студент ПМ-ПУ СПбГУ, интересуюсь системами и низкоуровневой разработкой.
      Порт MIPS64 для RTOS на Rust, песочница на Docker и Wayland-бар без GTK/Qt;
      преподаю спортивное программирование и Arduino.
    ],
    projects: ("martos", "runner", "capybar"),
    focus: ("core", "systems", "rust", "embedded", "security", "backend"),
    defaultLimit: 2,
    limits: (
      "martos": 3,
      "runner": 2,
      "capybar": 3,
    ),
    skills: (
      ("Языки", ("C/C++", "Rust", "Go", "Python", "Bash", "Lua", "Zig")),
      (
        "Системы",
        (
          "Linux",
          "Docker",
          "Wayland",
          "OpenCL",
          "RTOS",
          "MIPS64/RISC-V/ESP32",
        ),
      ),
      ("Инструменты", ("Git", "Nix", "Neovim", "Typst")),
    ),
    showTeaching: true,
    overrides: (:),
  ),

  "general": (
    id: "general",
    kicker: "software engineer / open source",
    headline: "Разработчик · Go, C/C++, Rust, Linux",
    summary: [
      Студент ПМ-ПУ СПбГУ. Разрабатываю open-source-проекты на Go, Rust и C++:
      микросервисы, RTOS, Wayland-бар и Typst-шаблон; преподаю спортивное
      программирование и Arduino.
    ],
    projects: (
      "af-hackathon",
      "codeduels",
      "runner",
      "martos",
    ),
    focus: ("core", "backend", "web", "systems", "rust", "go", "open-source"),
    defaultLimit: 1,
    limits: (
      "af-hackathon": 1,
      "codeduels": 1,
      "runner": 1,
      "martos": 1,
    ),
    skills: (
      ("Языки", ("Go", "C/C++", "Rust", "Python", "Elixir")),
      ("Backend", ("PostgreSQL", "Docker", "REST", "SSE", "Git")),
      ("Системы", ("Linux", "Nix", "Wayland", "OpenCL")),
      ("Frontend", ("React", "TypeScript", "Tailwind")),
    ),
    showTeaching: true,
    showEducationNote: false,
    overrides: (:),
  ),
)
