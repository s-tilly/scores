\version "2.24.0"
\include "header.ily"


title = #"Red Baron"
composer = #"-Billy Cobhan"
meter = #" (binaire)"
thetempo = #85
transposition = #"$transposition"
tonality = #"$tonality"


\include "main.ily"

theNotes = \relative c'' {
  \set Staff.midiInstrument = "Tenor Sax"
  \key bes \major
  r1 r r r | \break
  r r r r2 r4 r8 g'16 g, \bar "||" \break
  \repeat volta 2 { \bar ".|:-|"
    r2 f16 g8\staccato g16 r g r g | % 9
    bes8\staccato a16 g a bes g8~ g4 r8 g'16 g, |
    r2 f16 g8\staccato g16 r g r g | \break
    \tuplet 3/2 { des'8 d bes16 a16 } \tuplet 3/2 { g8 des' d } \tuplet 3/2 { bes16 a g8 des' } \tuplet 3/2 { d8 bes16 a g' g,~ } | % 12
    g4 r4 f16 g8\staccato g16 r g r g |
    bes8\staccato a16 g a bes g8~ g4 g16 bes8\staccato c16 | \break
    des16 d8\staccato g16 r d r g, bes8 \tuplet 3/2 { a16 g f } \tuplet 3/2 { d8 bes'16 a8 g16 } % 15
    \tuplet 3/2 { a8 g16 f8 a16~ } a2. |
  }
  \alternative {
    { g2. r8 g'16 g, | }
    { g2. r4 \bar "|." }
  }
}

% Just one chords charts
chordsChart = \chordmode {
  \key c \major
  \set noChordSymbol = ""

  \mark "Intro"
  g2:m7 c2:7 g2:m7 c2:7 g2:m7 c2:7 g2:m7 c2:7
  g2:m7 c2:7 g2:m7 c2:7 g2:m7 c2:7 g2:m7 c2:7
  \repeat volta 2 {
    \mark "Theme"
    g2:m7 c2:7 g2:m7 c2:7 g2:m7 c2:7 g2:m7 c2:7
    g2:m7 c2:7 g2:m7 c2:7 g2:m7 c2:7 r4 f2.:/ees
  }
  \alternative {
    { ees1:/des }
    { ees1:/des }
  }
}

% All Chords for one theme (with intro, etc)
ThemeChords = \chordmode {
  \key c \major
  %c1:9 c:9 c:9 c:9
  \chordsChart
}

  \header {
    poet = \markup {
      \override #'(font-name . "lilyjazz-chord")
      \fontsize #4
      $tonality
    }
  }

% The Theme part
\bookpart {
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
