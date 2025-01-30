\version "2.24.0"
\include "header.ily"


title = #"Mister M"
composer = #"-Sylvain de Tilly"
meter = #" (Med. Swing)"
thetempo = #100
transposition = #"$transposition"
tonality = #"$tonality"


\include "main.ily"

theNotes = \relative c' {
  \set Staff.midiInstrument = "Tenor Sax Soft"
  \key ees \major
  %%\partial 2 r8 r16 c16 ees8 c\staccato | % Ut & Bb
  \partial 2 r8 r16 c'16 ees8 c\staccato | % Eb

  %% A
  \bar "||"
  aes'4 f16 ees r f r c r4 r16 c |
  f8\staccato f\staccato aes16 f r ees r16 c r c ees8 c\staccato |
  aes'4 f16 ees r f r c r4 r16 c |
  f8\staccato f\staccato ees16 c r ees r16 c r c ees8 c\staccato | \break

  aes'4 f16 ees r f r d r8 r4 |
  f8\staccato f\staccato aes16 f r d r16 c r c ees8 c\staccato |
  aes'4 f16 ees r f r c r8 r4 |
  f8 r f16 fis16 r16 g r8 r16 c, ees8 c  | \break

  %% A'
  <c' aes>4 <bes f>16 <aes ees> r <bes f> r <f c> r4 r16 c |
  f8\staccato f\staccato aes16 f r ees r c r c ees8 c\staccato |
  <c' aes>4 <bes f>16 <aes ees> r <bes f> r <f c> r4 r16 c |
  f8\staccato f\staccato ees16 c r ees r16 c r c ees8 c\staccato | \break

  <c' aes>4 <bes f>16 <aes ees> r <bes f> r <g d> r8 r4 |
  f8\staccato f\staccato aes16 f r d r16 c r c ees8 c\staccato |
  <c' aes>4 <bes f>16 <aes ees> r <bes f> r <f c> r8 r4 |
  <c' f,>8 r <c f,>16 <b fis> r <bes g> r16 c, r16 c ees c e r16 | \break

  %% B
  << { \override Voice.NoteHead.color = #red
       \override Stem.color = #red
       \override Rest.color = #red
       \override Accidental.color = #red
       \override Beam.color = #red
       r4 aes4 bes8 c~ c ees~ |
       %%r4 aes' bes8 c~ c ees~ |
       ees1~ |
       ees8 f8~ f8 ees8~ ees8 des8~ des8 c8~ |
       c2~ c4~ c8 cis8\staccato | \break

       d4~ d8 ees8 d8 bes4 aes8 |
       bes8 d8~ d2~ d8~ d16 r |
       ees8 c8~ c bes8~ bes b c r |
       c8 r8 c16 b r bes8 r16 r8 r4 | \break

     } \\
     {
       %%f1~ |
       f1~ |
       f4 c' bes8 aes f aes~ |
       aes1~ |
       %%aes2 f8 r16 f16 aes8 a8 | \break
       aes4. f8 r8 f16 aes16~ aes8 a8\staccato | \break

       bes1~ |
       bes4~ bes8 bes4 bes8 aes8~ aes16 r16 |
       f2~ f4~ f8 r8 |
       f8 r8 f16 fis r g8 c,16 r c ees8 c16 r16 | \break
     }
   >>

  %% A'
  <c' aes>4 <bes f>16 <aes ees> r <bes f> r <f c> r4 r16 c |
  f8\staccato f\staccato aes16 f r ees r c r c ees8 c\staccato |
  <c' aes>4 <bes f>16 <aes ees> r <bes f> r <f c> r4 r16 c |
  f8\staccato f\staccato ees16 c r ees r16 r8 c16 ees8 c\staccato | \break

  <c' aes>4 <bes f>16 <aes ees> r <bes f> r <g d> r8 r4 |
  f8\staccato f\staccato aes16 f r d r16 c r c ees8 c\staccato |
  <c' aes>4 <bes f>16 <aes ees> r <bes f> r <f c> r8 r4 |
  <c' f,>8 r <c f,>16 <b fis>16 r16 <bes g> r2 |

  \bar "||"


}
%% Just one chords charts
chordsChart = \chordmode {
  \key c \major
  \set noChordSymbol = ""
  \partial 2 s2 |
  \mark "A"
  f1:m7 f1:m7 aes1 aes1 bes1:7 bes1:7 f1:m7 c1:7
  \mark "A"
  f1:m7 f1:m7 aes1 aes1 bes1:7 bes1:7 f1:m7 c1:7
  \mark "B"
  f1:m7 f1:m7 aes1 aes1 bes1:7 bes1:7 f1:m7 c1:7
  \mark "A"
  f1:m7 f1:m7 aes1 aes1 bes1:7 bes1:7 f1:m7 c1:7
}

%% All Chords for one theme (with intro, etc)
ThemeChords = \chordmode {
  \key c \major
  \chordsChart
}

%% The Theme part
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

%% % The Solo part (chords charts, backs if needed)
%% \bookpart {
%%     \header {
%%       subtitle = \markup {
%%         \override #'(font-name . "LilyJazz Text")
%%         \fontsize #5
%%         Improvisation
%%       }
%%       poet = \markup {
%%         \override #'(font-name . "lilyjazz-chord")
%%         \fontsize #4
%%         $tonality
%%       }
%%       piece = \markup {
%%         \override #'(font-name . "LilyJazz Text")
%%         \fontsize #1
%%         Solo
%%       }
%%     }
%% 
%%     \score {
%%       <<
%%         \context ChordNames {
%%           \transpose c $transposition \ChordsChart
%%         }
%%         \new Staff {
%%           % \repeat unfold 16 { \rs } \break => One line of four bars
%%           % \repeat unfold 3 {\repeat unfold 16 { \rs } \break} => Twelve bars blues
%%           \repeat unfold 3 {\repeat unfold 16 { \rs } \break}
%%         }
%%       >>
%%       \layout {
%%         \context {
%%           \Staff
%%           \remove "Time_signature_engraver"
%%           \remove "Clef_engraver"
%%         }
%%       }
%%     }
%% }