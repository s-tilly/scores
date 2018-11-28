\version "2.19.82"
\include "header.ily"


title = #"Pithecanthropus Erectus"
composer = #"-Charles Mingus"
meter = #" (Med. Swing)"
thetempo = #130
transposition = #"$transposition"
tonality = #"$tonality"


\include "main.ily"

theNotes = \relative c' {
  \set Staff.midiInstrument = "Tenor Sax"
  \key aes \major

  % Part A
  c1~ |
  c   |
  des~ |
  des  | \break
  des~ |
  des2. des4 |
  e1 |
  d4\staccato r4 r2 | \break
  ees1~ |
  ees2 \tuplet 3/2 { des4 ees des } |
  c4 \tuplet 3/2 {c8 c c} c2~ |
  c2~ c8 c8 des16 f aes c | \break
  ces1~ |
  ces   |
  bes4 \tuplet 3/2 {bes8 bes bes} bes2 ~ |
  bes~ bes8 c, \tuplet 3/2 {des8 e bes' } \bar "||" \break

  % Part B
  \repeat volta 2 { aes1 | r1 }

  % Part C
  \repeat unfold 4 { \rs } |
  \repeat unfold 4 { \rs } |
  \repeat unfold 4 { \rs } |
  \repeat unfold 4 { \rs } \bar "||" \break
}

% Just one chords charts
chordsChart = \chordmode {
  \key aes \major
  \mark "A"
  f:m     | des:maj7 | g:m7.5-  | c:7.9-          |
  f:m     | d:maj7   | ees:7    | aes:7           |
  g:m7.5- | ees:7    | f:m7     | des:maj7        |
  aes:m7  | des:7    | ges:maj7 | g2:m7.5- c:7.9- |

  \mark "B"
  f1:m7   | f1:m7    |

  \mark "C"
  g1:m7.5- | g1:m7.5- | c:7 | c:7 |
}

% All Chords for one theme (with intro, etc)
ThemeChords = \chordmode {
  \key aes \major
  \chordsChart
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
%\bookpart {
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