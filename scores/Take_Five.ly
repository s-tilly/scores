\version "2.19.82"
\include "header.ily"


title = #"Take Five"
composer = #"-Paul Desmond"
meter = #" (Med. Swing)"
thetempo = #160
transposition = #"$transposition"
tonality = #"$tonality"


\include "main.ily"

theNotes = \relative c' {
  \set Staff.midiInstrument = "Tenor Sax"
  \key ges \major
  \time 5/4

  \partial 2 bes8[ ees ges aes]

  \bar "||"
  %% part "A"
  a[ bes a aes] ges4 bes,( des\staccato) |
  ees2. f16( ges f ees des4) |
  ees2. des16( ees des bes aes4) |
  bes2. bes8[ ees ges aes] |  \break
  a[ bes a aes] ges4 bes,( des\staccato) |
  ees2. des16( ees des bes aes4) |
  bes2. f'16( ges f ees des4) |
  ees2.~ ees4 r4 | \break

  %% part "B"
  \bar "||"
  ees'8 ges4 ees8 ces4 aes8[ bes ces c] |
  des f4 des8 bes4 ges8[ aes a bes] |
  ces8 ees4 ces8 aes4 f8[ ges aes a] |
  bes[ a bes ces] des4 des8[ c des d] | \break
  ees8 ges4 ees8 ces4 aes8[ bes ces c] |
  des f4 des8 bes4 ges8[ aes a bes] |
  ces8 ees4 ces8 aes4 f8[ aes des ces] |
  bes2. bes,8[ ees ges aes] | \break

  %% part "A"
  \bar "||"
  a[ bes a aes] ges4 bes,( des\staccato) |
  ees2. f16( ges f ees des4) |
  ees2. des16( ees des bes aes4) |
  bes2. bes8[ ees ges aes] |  \break
  a[ bes a aes] ges4 bes,( des\staccato) |
  ees2. des16( ees des bes aes4) |
  bes2. f'16( ges f ees des4) |
  ees2.~ ees4 r4 | \break
  \bar "||"
}

% Just one chords charts
chordsChart = \chordmode {
  \key f \major
  \time 5/4
}

% All Chords for one theme (with intro, etc)
ThemeChords = \chordmode {
  \key f \major
  \time 5/4
  \partial 2 s2 |

  \mark "A"
  ees2.:m bes2:m7 | ees2.:m bes2:m7 | ees2.:m bes2:m7 | ees2.:m bes2:m7 |
  ees2.:m bes2:m7 | ees2.:m bes2:m7 | ees2.:m bes2:m7 | ees2.:m bes2:m7 |

  \mark "B"
  ces2.:maj aes2:m6 | bes2.:m7 ees2:m | aes2.:m7 des2:7 | ges2.:maj s2 |
  ces2.:maj aes2:m6 | bes2.:m7 ees2:m | aes2.:m7 des2:7 | f2.:m7 bes2:7 |

  \mark "A"
  ees2.:m bes2:m7 | ees2.:m bes2:m7 | ees2.:m bes2:m7 | ees2.:m bes2:m7 |
  ees2.:m bes2:m7 | ees2.:m bes2:m7 | ees2.:m bes2:m7 | ees2.:m bes2:m7 |
}

% The Theme part
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

%% The Solo part (chords charts, backs if needed)
% \bookpart {
%     \header {
%       subtitle = \markup {
%         \override #'(font-name . "LilyJazz Text")
%         \fontsize #5
%         Improvisation
%       }
%       poet = \markup {
%         \override #'(font-name . "lilyjazz-chord")
%         \fontsize #4
%         $tonality
%       }
%       piece = \markup {
%         \override #'(font-name . "LilyJazz Text")
%         \fontsize #1
%         Solo
%       }
%     }
%
%     \score {
%       <<
%         \context ChordNames {
%           \transpose c $transposition \ChordsChart
%         }
%         \new Staff {
%           % \repeat unfold 16 { \rs } \break => One line of four bars
%           % \repeat unfold 3 {\repeat unfold 16 { \rs } \break} => Twelve bars blues
%           \repeat unfold 3 {\repeat unfold 16 { \rs } \break}
%         }
%       >>
%       \layout {
%         \context {
%           \Staff
%           \remove "Time_signature_engraver"
%           \remove "Clef_engraver"
%         }
%       }
%     }
% }