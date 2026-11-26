#let person = (
  fullName: "Плотников Даниил Михайлович",
  firstName: "Даниил",
  lastName: "Плотников",
  patronymic: "Михайлович",
  photo: "/assets/portrait.jpg",
  contacts: (
    (
      label: "email",
      text: "d.m.plotnikov04@gmail.com",
      url: "mailto:d.m.plotnikov04@gmail.com",
    ),
    (
      label: "telegram",
      text: "@PlotnikovDaniil",
      url: "https://t.me/PlotnikovDaniil",
    ),
    (
      label: "github",
      text: "github.com/Pepengu",
      url: "https://github.com/Pepengu",
    ),
    (
      label: "location",
      text: "Санкт-Петербург",
      url: none,
    ),
  ),
  education: (
    institution: "СПбГУ",
    faculty: "Факультет прикладной математики и процессов управления",
    facultyShort: "Факультет ПМ-ПУ",
    program: "Программирование и информационные технологии",
    location: "Санкт-Петербург",
    period: "2022–2027",
    note: [
      Учебные проекты на C++: интерпретатор, структуры данных, СУБД с WebSocket —
      #link("https://github.com/Pepengu/spbu-assignments")[spbu-assignments].
    ],
  ),
  languages: (
    ("Русский", "родной"),
    ("Английский", "B2"),
  ),
  teaching: (
    (
      label: "Преподавание",
      text: [
        Курс спортивного программирования СПбГУ (2024 — н. в.);
        выездные школы по Arduino и спортивному программированию;
        научно-популярные лекции (2025 — н. в.).
      ],
    ),
    (
      label: "Организация",
      text: [
        I и II Чемпионаты ПМ-ПУ, Чемпионат по спортивному программированию
        Student Fest 2025.
      ],
    ),
  ),
)
