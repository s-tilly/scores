\version "2.19.82"
\include "header.ily"


title = #"Black Jack"
composer = #"-Donald Byrd"
meter = #" (binaire)"
thetempo = #160
transposition = #"$transposition"
tonality = #"$tonality"


\include "main.ily"

theNotes = \relative c'' {
  \set Staff.midiInstrument = "Tenor Sax"
  \key c \major
  f8[ g] ees[ e] c a r c
  r ees~ ees2 r4
  r4 r a,8 c r ees\staccato
  r8 c16 bes g8 f ees4 c\staccato | \break
  <a' ees'>4\staccato <bes e>->~ <bes e>2~
  <bes e>1~
  <bes e>1
  r2 r8 a c\staccato[ ees] | \break
  r8 c16 bes g8 f ees4 c\staccato
  ees\staccato f~-> f2~
  f2 a8 c r8 f\staccato
  r8 g16 f ees8 f c4\staccato c\staccato | \break
  <a ees'>4\staccato <bes e>->~ <bes e>2~
  <bes e>1~
  <bes e>1
  e4 r r2 | \break
  \tuplet 3/2 { r8 r g(} \tuplet 3/2 {f8 g f} \tuplet 3/2 {g f g} \tuplet 3/2 {f g f}
  g4) f8( d\staccato) r2
  \tuplet 3/2 { r8 r f(} \tuplet 3/2 {ees8 f ees} \tuplet 3/2 {f ees f} \tuplet 3/2 {ees f ees}
  f4) ees8( c\staccato) r g c4\staccato | \break
  <a ees'>4\staccato <bes e>->~ <bes e>2~
  <bes e>1~
  <bes e>1~
  <bes e>4 r r2 |
}

% Just one chords charts
chordsChart = \chordmode {
  \key c \major
  c1:9 c:9 c:9 c:9
  c1:9 c:9 c:9 c:9
  f1:9 f:9 f:9 f:9
  c1:9 c:9 c:9 c:9
  g1:9 g:9 f:9 f:9
  c1:9 c:9 c:9 c:9
}

% All Chords for one theme (with intro, etc)
ThemeChords = \chordmode {
  \key c \major
  %c1:9 c:9 c:9 c:9
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