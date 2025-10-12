#let thesis = (
  name: "Webová aplikace pro přihlášky do domova mládeže",
  major: "Informační technologie",
  class: "ITB4",
  year: 2025,
  author: "Jan Prokůpek",
  abstract-cs: par([
    Maturitní práce má za úkol usnadnit proces přihlašování žáků a správu přihlášek vychovateli. Úvod krátce popisuje problémy aktuálního systému,
    které vychovatelé používají a jejich potenciální řešení.
    V teoretické části budou shrnuty technologie, které byly při vývoji použity a důvody, proč byly vybrány pro vývoj. Praktická část pojednává
    o shrnutí vlastní implementace projektu, strategiích, které byly při vývoji použity a průběhem nasazením aplikace na server
    Střední průmyslové školy Třebíč.
  ]),
  abstract-en: par([
    The graduation thesis aims to facilitate the application process for students and the management of applications by caregivers.
    The introduction describes the problems of the current solution and ways to improve or resolve them.
    The theoretical part summarizes the technologies used in development and the reasons why they were chosen for development.
    The practical part deals with the project's own implementation, strategies used during development, and the process of deploying the application to the server
    of the school.
  ]),
  keywords-cs: par([
    přihlašovací formulář, domov mládeže, webová aplikace
  ]),
  keywords-en: par([
    application form, dormitory, web application
  ]),
  acknowledgements: par([
    Děkuji vedoucímu práce Ing. Matěji Brožkovi za cenné rady a odborné vedení při
    zpracování této práce. Dále děkuji Tomáši Kebrlovi za rady a pomoc v procesu vývoje.
  ]),
  assignment: [
    #par([
      Cílem práce je návrh a implementace webové aplikace pro evidenci přihlášek zájemců o ubytování v domově mládeže a pro podporu komunikace mezi žadateli a administrátory. Aplikace bude sloužit k centralizované správě procesu podávání žádostí a poskytne uživatelům přehledný a transparentní způsob sledování stavu jejich přihlášky.
    ])
    #par([
      Uživatelé budou mít možnost vytvářet a spravovat své žádosti prostřednictvím systému ticketů, kde bude zobrazena časová osa jednotlivých kroků řízení včetně vyjádření ze strany administrátora. Administrátorská část aplikace umožní pracovníkům domova mládeže spravovat přijaté žádosti, komunikovat se zájemci a vyhodnocovat je také na základě dojezdových vzdáleností či dalších relevantních kritérií.
    ])
    #par([
      Aplikace bude vyvíjena s využitím frameworku Next.js v jazyce TypeScript, pro tvorbu uživatelského rozhraní bude použit TailwindCSS a databázová vrstva bude řešena prostřednictvím PostgreSQL a ORM Prisma. Součástí práce bude také návrh databázového modelu a architektury aplikace, implementace uživatelských i administrátorských modulů a ošetření základních bezpečnostních aspektů.
    ])
    #par([
      Významnou součástí projektu bude nasazení hotové aplikace do produkčního prostředí na servery Střední průmyslové školy Třebíč, její praktické ověření v reálném provozu a zpracování uživatelské i technické dokumentace, která bude sloužit pro následnou údržbu a využívání systému v praxi.
    ])
  ],
)

= Úvod


#par([
  Správa přihlašovacích formulářů do domova mládeže je často náročný a časově intenzivní proces, který vyžaduje efektivitu při zpracování žádosti a případné komunikaci se
  žadateli. Cílem této práce je navrhnout a implementovat webovou aplikaci, která tento proces zjednoduší a zpřehlední jak pro žadatele, tak pro administrátory domova mládeže.
])

#par([
  V současné době je správa přihlášek často řešena pomocí postupů, které nepřináší
  vychovatelům dostatečnou efektivitu, přehlednost a možnost práce s daty. Často
  se setkávají s opakujícími se problémy, které jsou řešeny manuálně, což vede
  ke zbytečné administrativní zátěži a potenciálním chybám.
])

#par([
  Ultimátním cílem této práce je vytvořit webovou aplikaci, která umožní
  vychovatelům efektivně a optimálně spravovat přihlašovací proces, přijaté
  žádosti a komunikaci se žadateli. Žadatelům pak poskytne přehledný a
  transparentní způsob sledování stavu jejich přihlášky.
])

#pagebreak()

#set heading(numbering: "1.1")

= Teoretická část


