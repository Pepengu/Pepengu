#let entries = (
  "af-hackathon": (
    title: "Альфа Хак 2026",
    subtitle: "Сервис новостной аналитики для крупного бизнеса",
    role: "Backend / Fullstack-разработчик",
    team: "команда из 5 человек",
    period: "окт. 2026",
    link: (
      label: "alistkova/AF_Hackathon",
      url: "https://github.com/alistkova/AF_Hackathon",
    ),
    stack: ("Go", "PostgreSQL", "React", "TypeScript", "Python", "Docker"),
    bullets: (
      (
        tags: ("core", "backend", "integration"),
        text: [
          Интегрировал identity, company и content в gateway: сессии, проверка
          доступа по компаниям, проксирование запросов.
        ],
      ),
      (
        tags: ("core", "web", "postgres", "backend"),
        text: [
          Реализовал ленту с ранжированием под профиль компании, фасетными
          фильтрами и кэшированием; вынес поиск в сайдбар.
        ],
      ),
      (
        tags: ("web", "frontend", "backend"),
        text: [
          Сделал профиль компании и управление участниками (owner/member) —
          API и UI.
        ],
      ),
      (
        tags: ("core", "llm", "backend"),
        text: [
          Связал Go-бэкенд с Python-агентом через SSE: прогресс разбора,
          реконнект по Last-Event-ID, структурированный ответ и дисклеймер.
        ],
      ),
      (
        tags: ("infra", "docker"),
        text: [
          Довёл демо до запуска одной командой: Docker Compose, seed-данные,
          README со скриншотами, CI.
        ],
      ),
    ),
  ),

  "runner": (
    title: "Runner",
    subtitle: "Песочница для проверки олимпиадных задач",
    role: "автор",
    team: none,
    period: "2026",
    link: (
      label: "Pepengu/Runner",
      url: "https://github.com/Pepengu/Runner",
    ),
    stack: ("Rust", "Docker", "Linux"),
    bullets: (
      (
        tags: ("core", "systems", "security", "backend"),
        text: [
          Песочница на Rust и Docker: изоляция сети, CPU, RAM и PIDs,
          read-only mounts, запуск без capabilities и с no-new-privileges.
        ],
      ),
      (
        tags: ("core", "systems", "backend"),
        text: [
          Поддержка Polygon-формата: монтирование тестов и checker.cpp,
          компиляция чекера на старте, ограничения по времени и памяти.
        ],
      ),
      (
        tags: ("core", "go", "web"),
        text: [
          JSON-конфиг для интеграции с турнирными платформами;
          используется в CodeDuels для асинхронной проверки решений.
        ],
      ),
    ),
  ),

  "codeduels": (
    title: "CodeDuels",
    subtitle: "Платформа для турниров по спортивному программированию",
    role: "автор",
    team: none,
    period: "март — авг. 2026",
    link: (
      label: "Pepengu/CodeDuels",
      url: "https://github.com/Pepengu/CodeDuels",
    ),
    stack: ("Elixir", "Phoenix", "LiveView", "PostgreSQL", "Docker"),
    bullets: (
      (
        tags: ("core", "web", "backend", "postgres"),
        text: [
          Швейцарская система турниров, дуэли один-на-один, live-таблицы
          и регистрация участников на Phoenix LiveView.
        ],
      ),
      (
        tags: ("core", "backend", "docker", "systems"),
        text: [
          Асинхронная проверка решений в Docker через Runner: C++17/23,
          Python, Java, Go; live-обновление статусов через PubSub.
        ],
      ),
      (
        tags: ("core", "web", "frontend"),
        text: [
          Импорт задач в формате Polygon, редактор с подсветкой, страницы
          задач и посылок, тёмная и светлая темы.
        ],
      ),
    ),
  ),

  "capybar": (
    title: "capybar",
    subtitle: "Wayland-бар без GTK/Qt",
    role: "автор",
    team: none,
    period: "май 2025 — н. в.",
    link: (
      label: "CapyCore/capybar",
      url: "https://github.com/CapyCore/capybar",
    ),
    stack: ("Rust", "Wayland", "Nix"),
    bullets: (
      (
        tags: ("core", "systems", "rust"),
        text: [
          Нативный Wayland-бар на Rust: работа напрямую с протоколами
          композитора, без GTK/Qt и внешних демонов.
        ],
      ),
      (
        tags: ("core", "systems", "rust"),
        text: [
          Виджеты батареи, CPU, часов и раскладки; конфигурация в TOML,
          собственный движок стилей и сигналов.
        ],
      ),
      (
        tags: ("core", "infra", "nix"),
        text: [
          Nix-пакет и Home Manager-модуль; опубликован на crates.io.
        ],
      ),
    ),
  ),

  "martos": (
    title: "Martos",
    subtitle: "RTOS на Rust для мультиагентных систем",
    role: "контрибьютор",
    team: none,
    period: "2024–2025",
    link: (
      label: "IvanArkhipov1999/Martos",
      url: "https://github.com/IvanArkhipov1999/Martos",
    ),
    stack: ("Rust", "MIPS64", "ESP32", "RISC-V"),
    bullets: (
      (
        tags: ("core", "systems", "rust", "embedded"),
        text: [
          Порт MIPS64: линкер, примеры на Rust и C, сборка C-библиотеки и CI.
        ],
      ),
      (
        tags: ("core", "systems", "rust", "embedded"),
        text: [
          Bump-аллокатор и trait-порт HAL; примеры для ESP32, RISC-V
          и MIPS64.
        ],
      ),
      (
        tags: ("core", "systems", "rust"),
        text: [
          Участие в разработке RTOS с кооперативной и вытесняющей
          планировкой, поддержкой сети ESP-NOW.
        ],
      ),
    ),
  ),

  "pepentation": (
    title: "pepentation",
    subtitle: "Typst-шаблон для академических презентаций",
    role: "автор",
    team: none,
    period: "окт. 2025 — н. в.",
    link: (
      label: "Pepengu/pepentation",
      url: "https://github.com/Pepengu/pepentation",
    ),
    stack: ("Typst",),
    bullets: (
      (
        tags: ("core", "open-source", "typst"),
        text: [
          Шаблон с темами, навигацией, автоматическим футером и 9 типами
          смысловых блоков.
        ],
      ),
      (
        tags: ("core", "open-source", "typst"),
        text: [
          Опубликован в Typst Universe, версия 0.3.0.
        ],
      ),
    ),
  ),

  "spbu-conference": (
    title: "SPBUConference",
    subtitle: "Сайт конференции «Ананьевские чтения»",
    role: "Backend-разработчик / tech lead",
    team: "команда из 3 человек",
    period: none,
    link: none,
    stack: ("Go", "Gin", "PostgreSQL", "React", "TypeScript", "Tailwind"),
    bullets: (
      (
        tags: ("core", "backend", "web", "postgres"),
        text: [
          Отвечал за backend, схему данных и координацию разработки.
        ],
      ),
      (
        tags: ("core", "backend", "web"),
        text: [
          Сайт для организации конференций СПбГУ; стек Go/Gin
          и PostgreSQL на backend, React/TypeScript и Tailwind на frontend.
        ],
      ),
    ),
  ),
)
