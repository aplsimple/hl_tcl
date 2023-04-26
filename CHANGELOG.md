# Last changes:


Version `1.0.5 (26 Apr'23)`

  - CHANGE: clear up my::data(LIST_TXT) (in *clearup* procs)


Version `1.0.4 (13 Apr'23)`

  - CHANGE: catch in .internal proc (for deleted texts)


Version `1.0.3 (31 Mar'23)`

  - CHANGE: 'timerate' added


Version `1.0.2 (24 Mar'23)`

  - NEW   : clearup proc: clears data related to text


Version `1.0.1 (23 Mar'23)`

  - NEW   : isdone proc: checks if the highlighting is done


Version `1.0.0 (15 Mar'23)`

  - NEW   : -plaincom option for plain highlighting line by line
  - NEW   : hl_tcl::iscurline to set/get a flag of highlighting lines
  - NEW   : -dobind option to force keys binding (in hl_init)


Version `0.9.49 (22 Feb'23)`

  - CHANGE: colors reordered: 1st set is least florid


Version `0.9.48 (8 Feb'23)`

  - CHANGE: some colors & ornament a-la alited


Version `0.9.47 (2 Feb'23)`

  - BUGFIX: highlighting "--longoption"


Version `0.9.46 (25 Jan'23)`

  - CHANGE: CoroModified: "after idle $cmd" instead of {*}$cmd


Version `0.9.45 (4 Jan'23)`

  - CHANGE: "finally" highlighted


Version `0.9.44 (4 Nov'22)`

  - CHANGE: "break, continue" are highlighted like "return"
  - CHANGE: data(SYNTAXCOLORS,1) - STR (strings)


Version `0.9.43 (25 Oct'22)`

  - NEW   : hl_tcl_html.tcl highlights TODO comments
  - CHANGE: data(SYNTAXCOLORS,1): string colors


Version `0.9.42 (4 Aug'22)`

  - CHANGE: RE for TODO comments is a variable


Version `0.9.41 (27 May'22)`

  - NEW   : hl_commands to list all Tcl/Tk commands registered here
  - CHANGE: string color of data(SYNTAXCOLORS,1) made green


Version `0.9.39 (22 May'22)`

  - BUGFIX: highlighting an alone command that is just followed by ";"


Version `0.9.38 (23 Apr'22)`

  - CHANGE: curr.line & TODO comment colors; depending on CS


Version `0.9.37 (21 Mar'22)`

  - BUGFIX: highlighting several adjacent quotes ("" "") in plain texts


Version `0.9.36 (8 Mar'22)`

  - NEW   : quotes highlighted
  - CHANGE: docs


Version `0.9.34 (26 Jan'22)`

  - CHANGE: hl_tcl::addingColors - try to get $dark from apave


Version `0.9.33 (19 Jan'22)`

  - NEW   : #TODO and #! comments highlighted specially
  - NEW   : hl_tcl::addingColors to get two adding colors
  - CHANGE: hl_tcl_html.tcl counts $darkedit


Version `0.9.32 (15 Jan'22)`

  - CHANGE: 'namespace eval' to be highlighted like proc/return
  - CHANGE: 'SYNTAXCOLORS,2' made green