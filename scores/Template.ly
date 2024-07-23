\version "2.24.0"
\include "header.ily"


title = #"Title"
composer = #"-Composer"
meter = #" (Med. Swing)"
thetempo = #100
transposition = #"$transposition"
tonality = #"$tonality"


\include "main.ily"

theNotes = \relative c' {
  \set Staff.midiInstrument = "Tenor Sax"
  \key c \major
}

% Just one chords charts
chordsChart = \chordmode {
  \key c \major
}

% All Chords for one theme (with intro, etc)
ThemeChords = \chordmode {
  \key c \major
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