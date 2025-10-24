#let thesis = (
  name: "Webová aplikace pro přihlášky do domova mládeže",
  major: "Informační technologie",
  class: "ITB4",
  year: 2025,
  author: "Jan Prokůpek",
  abstract-cs: par([
    Maturitní práce má za úkol usnadnit proces přihlašování žáků a správu přihlášek vychovateli vytvořením aplikace pro správu přihlašovacího procesu. Úvod krátce
    popisuje aktuální řešení a problémy s ním spojené. V teoretické části jsou shrnuty technologie, které byly při vývoji použity a důvody, proč byly vybrány pro vývoj. Praktická část pojednává
    o shrnutí vlastní implementace projektu, strategiích, které byly při vývoji použity a průběhem nasazením aplikace na server
    Střední průmyslové školy Třebíč.
  ]),
  abstract-en: par([
    The graduation thesis aims to simplify the process of student registration and application management for educators by creating an application for managing the registration process.
    The introduction briefly describes the current solution and the problems associated with it.
    The theoretical part summarizes the technologies used during development and explains the reasons why they were chosen.
    The practical part discusses the implementation of the project itself, the strategies used during development, and the process of deploying the application on the server of the Secondary Technical School in Třebíč.
  ]),
  keywords-cs: par([
    přihlašovací formulář, domov mládeže, webová aplikace
  ]),
  keywords-en: par([
    application form, dormitory, web application
  ]),
  acknowledgements: par([
    Děkuji vedoucímu práce Mgr. Matěji Brožkovi za cenné rady a odborné vedení při zpracování této práce.
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
  žadateli. Cílem této práce je navrhnout a implementovat webovou aplikaci za použití
  moderních technologií, která tento proces zjednoduší a zpřehlední jak pro žadatele, tak pro vychovatele domova mládeže.
  Historicky bylo přihlašování do domova mládeže řešeno prostřednictvím papírových formulářů, které
  byly vyplňovány ručně a posílány e-mailem. V posledních letech se však začali hledat alternativy, které by umožnily digitalizaci tohoto procesu. Minulý rok bylo pilotně zavedeno zasílání
  přihlášek prostřednictvím Google Forms, což přineslo určité zlepšení. Nicméně tento systém má své limity, zejména pokud jde o evidenci a archivování přijatých žádostí. Přesně tyto problémy
  se snaží tato práce řešit vytvořením specializované webové aplikace.
])

#par([
  Mezi primární funkce aplikace patří možnost vytváření a správu přihlášek žadateli, kteří budou moci sledovat stav své žádosti v reálném čase. Vychovatelé na domově mládeže pak získají
  nástroje pro správu přihlášky, automatizovanou komunikaci se žadateli a přehled o všech přijatých žádostech. Aplikace bude také obsahovat funkce pro hodnocení a výběr žadatelů na základě bodů, které budou automaticky uděleny na základě odpovědí na otázky.
])

#par([
  Výsledná aplikace by měla být přínostná pro všechny strany, jmenovitě pro žadatele, kteří získají
  pohodlnou a transparentní cestu k podání přihlášky, a pro vychovatele, kteří budou mít efektivní nástroj pro správu a zpracování přihlášek.
])

#pagebreak()

#set heading(numbering: "1.1")

= Problematika stávajícího řešení

Jak již bylo zmíněno v úvodu, aktuální stav systému pro přihlašování a správu přihlášek pro
domov mládeže je neoptimální a obsahuje množství funkcí, které lze implementovat pro celkové
zlepšení uživatelské přívětivosti a pohodlnosti. Pro jednoduché ustanovaní těchto funkcí
je však se potřeba podívat na všechny typy, které kdy byly zvažovány pro použití a následně
tato data zohlednit při návrhu nového systému.

== Fyzické přihlášky

Fyzické přihlášky, také zvané papírové přihlášky, jsou již dnes považovány za staromódní,
avšak je potřeba si z nich vzít důležité poznámky o tom, jaké nevýhody přinášeli a ty následně zvážit
při implementaci našeho řešení.

Při porovnání s ostatními řešeními mají bezkonkurenčně nejvíce nevýhod. Mezi nevýhody definitivně patří:
- Nutnost fyzického doručení přihlášky na určené místo, což může být pro některé žadatele komplikované.
- Obtížná správa a archivace papírových přihlášek. Papírové dokumenty se těžce hledají, třídí a uchovávají, což dokáže zvýšit administrativní zátěž pro vychovatele.
- Omezené možnosti pro automatizaci procesu hodnocení a kalkukace bodů na základě odpovědí žadatelů.

== Google Forms

Google Forms je online nástroj pro tvorbu formulářů, sběr a statistiku dat.
Nabízí široké možnosti přizpůsobení formulářů, integraci s dalšími službami Google a automatické shromažďování odpovědí do přehledných tabulek.
@google-forms

Mezi hlavní výhody Google Forms patří hlavně intuitivní uživatelské rozhraní, jednoduché
nastavení a možnost rychlého sdílení formulářů prostřednictvím odkazu. Dále nabízí
automatický export dat do tabulek. Všechny tyto funkce výrazně usnadňují přihlašovací proces, avšak přichází i funkce které jsou vitální a chybí. Pro školní rok 2025/2026 byly
Google Forms pilotně využity jako nástroj pro sběr přihlášek. Část procesu přihlašování z administrativní
strany tvoří např. archivace přijatých přihlášek ve formátu PDF #footnote("Tento krok byl řešen automaticky za pomocí zautomatizovaného skriptu v Google Sheets, z vlastní zkušenosti bylo toto řešení však velice chybové a často se muselo upravovat."), či komunikace se žadateli. Tyto funkce však Google Forms nenabízí, což vede k nutnosti manuálního zpracování.

== Externí řešení

Externí řešení patří zdaleka k nejvhodnějším možnostem, jak řešit přihlašovací proces. Mezi hlavní výhody
patří především fakt, že produkty lze přizpůsobit na míru dle požadavků a potřeb domova mládeže. Nabízejí
též opravu chyb, aktualizace a technickou podporu, což může být velice užitečné pro zajištění hladkého chodu systému. Mezi nevýhody však patří především finanční náročnost, jelikož
externí řešení často vyžadují měsíční nebo roční poplatky za podporu a údržbu.

#pagebreak()

= Stanovení požadavků na novou aplikaci

Při diskuzi o tvorbě nové aplikacei byly též stanoveny požadavky na funkce, které by měla aplikace
obsahovat, odvíjely jsme se především od problémů, které přinášela stávající řešení. Tyto požadavky
můžeme pro přehlednost rozdělit do dvou hlavních kategorií: *požadavky na uživatelské funkce* a *požadavky na administrátorské funkce*. Na základě těchto požadavků bude následně proveden výběr technologií a návrh architektury aplikace.

== Uživatelské funkce

- Zobrazení formuláře pro přihlášení do domova mládeže s možností vyplnění a odeslání přihlášky.
- Možnost sledování stavu přihlášky v reálném čase prostřednictvím _ticket systému_.

== Administrátorské funkce

- Zobrazení přehledu všech přijatých přihlášek s možností filtrování, či přidávání poznámek.
- Možnost komunikace se žadateli prostřednictvím integrované funkce pro zasílání zpráv za pomoci e-mailu.
- Automatické bodování přihlášek na základě odpovědí žadatelů.
- Generování a archivace přijatých přihlášek společně s možností exportu do PDF.
- Možnost úpravy formuláře pro přihlášení dle aktuálních potřeb.
- Zabezpečení přístupu k administrátorským funkcím pomocí autentizačního systému s RBAC #footnote([
  Role-Based Access Control @decoding-rbac
]), který zajistí různé úrovně přístupu pro různé role vychovatelů.

== Ideální proces přihlašování

= Technologie použité při vývoji
== Next.js
== PostgreSQL
== Prisma ORM
== TypeScript
== TailwindCSS