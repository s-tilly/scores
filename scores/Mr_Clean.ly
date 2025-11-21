\version "2.24.0"
\include "header.ily"


title = #"Mr Clean"
composer = #"-Freddy Hubbard"
meter = #" (Med. Funk)"
thetempo = #140
transposition = #"$transposition"
tonality = #"$tonality"


\include "main.ily"

theNotes = \relative c' {
   \set Staff.midiInstrument = "Tenor Sax"
  \key f \major
  \partial 8 c'8 |
  \bar "||"
  f f ees f r2 |
  r2 c8 bes aes f |
  bes aes f ees~ ees2~ |
  ees2 r4. c'8 | \break

  f f ees f r4 aes4~ |
  aes4 ges8 e8 aes4 e8 des |
  ees des b aes~ aes2 |
  bes8 ces bes aes f aes bes c |  \break
  f f ees f r2  |
  r2 c8 bes aes f |
  bes8 aes f ees~ ees2~ |
  ees1 | \break

  f8 bes c ees f aes f ees |
  bes c ees aes,~ aes2 |
  << \new Voice \relative c' {
       \voiceOne
       ees8 ees4 ees8~ ees8 aes f4 |
     } \\
     \new Voice \relative c'' {
       \voiceTwo
       \override NoteHead.style = #'cross
       \override NoteHead.duration-log = #2
       \override NoteHead.Y-offset = #-4.5
       c8 c4 c8~ c8 c c4 |
     }
   >>
\once \override Score.RehearsalMark.extra-offset = #'(0 . -20)
   \mark \markup {
     \override #'(font-name . "LilyJazz Text")
     \box "Solo on Fm7"
   }
   r2 r4. \parenthesize c8 | \bar "||"

}




% Just one chords charts
chordsChart = \chordmode {
  \key f \major
}

% All Chords for one theme (with intro, etc)
ThemeChords = \chordmode {
  \key c \major
  \chordsChart
  \partial 8 s8 |
  f1:m7 f1:m7 f1:m7 f1:m7
  f2.:m7 des4:m7 \skip 1 des1:m7 f1:m7
  f1:m7 f1:m7 f1:m7 f1:m7
  r1 r1 c1:7 c1:7
}

\bookpart {
  \header {
    subtitle = \markup {
      \override #'(font-name . "LilyJazz Text")
      \fontsize #5
      Theme
    }
    poet = \markup {
      \override #'(font-name . "lilyjazz-chord")
      \fontsize #4
      $tonality
    }
  }
    \score {
    <<
      \context ChordNames {
        \transpose c $transposition \ThemeChords
      }
      \new Staff { \transpose c $transposition \theNotes }
    >>
    \midi {}
    \layout {}
  }
}
