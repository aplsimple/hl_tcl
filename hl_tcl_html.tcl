# _______________________________________________________________________ #
#
# Highlighting Tcl code with html tags.
#
# Scripted by Alex Plotnikov (aplsimple@gmail.com).
# License: MIT.
# _______________________________________________________________________ #

package require Tk
lappend auto_path [file dirname [info script]]
package require hl_tcl

namespace eval ::hl_tcl_html {
}

proc  ::hl_tcl_html::insertTag {pN tN lcodeN} {
  # Inserts a html tag into Tcl code.
  #   pN - variable's name for a position of the tag
  #   tN - variable's name for the tag
  #   lcodeN - variable's name for the list of code lines
  
  upvar 1 $pN p $tN t $lcodeN lcode
  lassign [split $p .] l c
  incr l -1
  set line [lindex $lcode $l]
  set line1 [string range $line 0 $c-1]
  set line2 [string range $line $c end]
  set lcode [lreplace $lcode $l $l "$line1$t$line2"]
}

proc ::hl_tcl_html::highlight {htmlfile tag1 tag2 {darkedit ""} {multi ""}} {
  # Processes html file to find and highlight embedded Tcl code.
  #   htmlfile - file name
  #   tag1 - opening tag(s) of Tcl code snippet
  #   tag2 - ending tag(s) of Tcl code snippet
  #   darkedit - flag "the text widget has dark background" ("no" by default)
  #   multi - flag "process multi-line strings" ("yes" by default)

  set txt .t
  text $txt
  set chan [open $htmlfile]
  set text [read $chan]
  close $chan
  set tCOM1 "<b><font color=#922b23>"
  set tCOM2 "</font></b>"
  set tCOMTK1 "<b><font color=#771008>"
  set tCOMTK2 "</font></b>"
  set tSTR1 "<font color=#035103>"
  set tSTR2 "</font>"
  set tVAR1 "<font color=#4A181B>"
  set tVAR2 "</font>"
  set tCMN1 "<font color=#646464>"
  set tCMN2 "</font>"
  set ic [set ic2 0]
  while {$ic>=0 && $ic2>=0} {
    set ic [string first $tag1 $text $ic]
    if {$ic>=0} {
      incr ic [string length $tag1]
      set ic2 [string first $tag2 $text $ic]
      if {$ic>=0} {
        set code [string range $text $ic $ic2-1]
        set code [string map [list "&quot;" \" "&amp;" &] $code]
        ::hl_tcl::hl_init $txt
        $txt replace 1.0 end $code
        ::hl_tcl::hl_text $txt
        set taglist [list]
        foreach tag {tagCOM tagCOMTK tagSTR tagVAR tagCMN tagPROC} {
          foreach {p1 p2} [$txt tag ranges $tag] {
            lassign [split $p1 .] l1 c1
            lassign [split $p2 .] l2 c2
            lappend taglist [list [format %06d $l1][format %06d $c1] $tag 1 $p1]
            lappend taglist [list [format %06d $l2][format %06d $c2] $tag 2 $p2]
          }
        }
        set taglist [lsort -decreasing $taglist]
        set lcode [split $code \n]
        foreach tagdat $taglist {
          lassign $tagdat -> tag typ pos
          switch $tag {
            tagCOM {
              set t1 "<b><font color=#922b23>"
              set t2 "</font></b>"
            }
            tagCOMTK {
              set t1 "<b><font color=#771008>"
              set t2 "</font></b>"
            }
            tagPROC {
              set t1 "<b><font color=#800080>"
              set t2 "</font></b>"
            }
            tagSTR {
              set t1 "<font color=#035103>"
              set t2 "</font>"
            }
            tagVAR {
              set t1 "<font color=#4A181B>"
              set t2 "</font>"
            }
            tagCMN {
              set t1 "<font color=#646464>"
              set t2 "</font>"
            }
          }
          if {$typ==1} {
            insertTag pos t1 lcode
          } else {
            insertTag pos t2 lcode
          }
        }
        set code ""
        foreach lc $lcode {
          if {$code ne ""} {append code \n}
          append code $lc
        }
        set code [string map [list \" "&quot;"] $code]
        set text1 [string range $text 0 $ic-1]
        set text2 [string range $text $ic2 end]
        set text "$text1$code$text2"
        set ic [expr {$ic2+[string length $tag2]}]
      }
    }
  }
  set chan [open $htmlfile w]
  puts -nonewline $chan $text
  close $chan
}
after idle exit
# _________________________________ EOF _________________________________ #
#RUNF1: ./tcl_html.tcl .bak/hl_tcl.html