\version "2.24.0"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #8
            \override #'(offset . 7)
            \override #'(thickness . 6)
            \underline \larger \larger #title
          \fontsize #2 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\layout {
  % make only the first clef visible
  \override Score.Clef.break-visibility = #'#(#f #f #f)
  % make only the first time signature visible
  \override Score.KeySignature.break-visibility = #'#(#f #f #f)
  % allow single-staff system bars
  \override Score.SystemStartBar.collapse-height = #1
}


\midi {
  \tempo 4 = #thetempo
}


\header {
  title = \realBookTitle
  tagline = ##f
}
