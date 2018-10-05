\version "2.19.82"
\include "header.ily"


title = #"Blue Trane"
composer = #"-John Coltrane"
meter = #" (Med. Swing)"
thetempo = #100
transposition = #"$transposition"
tonality = #"$tonality"


\include "main.ily"

theNotes_first_voice = \relative c' {
  \set Staff.midiInstrument = "Tenor Sax"
  \key c \major
  r4 r8 bes'8 des f des ees~ \bar "||"
  ees1~ |
  ees4 r8 bes8 des f des ees~ |
  ees1~ |
  ees4 r8 ees, ges bes ges aes~ |
  aes1~ |
  aes4 r8 bes8 des f des ees~  |
  ees1~ |
  ees4 r8 bes8 des ges ees des~ |
  des1~ |
  des4 r8 bes8 des f des ees~ |
  ees1~  |
  % Deuxième thème
  ees4 r8 bes8 des f des ees~ \bar "||" \break
  ees1~ |
  ees4 r8 bes8 des f des ees~ |
  ees1~ |
  ees4 r8 ees, ges bes ges aes~ |
  aes1~ |
  aes4 r8 bes8 des f des ees~ |
  ees1~ |
  ees4 r8 bes8 des ges ees des~ |
  des1~ |
  des4 r8 bes8 des f des ees~ |
  ees1~ |
  ees4 r4 r2 \bar "||"
}

TheNotes_second_voice = \relative c {
  \set Staff.midiInstrument = "Tenor Sax"
  \key c \major
  r1  \bar "||"
  r1 |
  r1 |
  r1 |
  r1 |
  r1 |
  r1 |
  r1 |
  r1 |
  r1 |
  r1 |
  r1 |
  r4 r8  f'8 aes c aes bes~ \bar "||"
  % Deuxième thème
  bes1~ |
  bes4 r8 f8 aes c aes bes~ |
  bes1~ |
  bes4 r8 bes8 c  des c c~ |
  c1~ |
  c4 r8 f, aes c aes bes~    |
  bes1~ |
  bes4 r8 f8 bes des bes aes~ |
  aes1~ |
  aes4 r8 f8 aes c aes bes~     |
  bes1~ |
  bes4 r4 r2 \bar "||"
}

TheNotes_third_voice = \relative c {
  \set Staff.midiInstrument = "Tenor Sax"
  \key c \major
  r1  \bar "||"
  r1 |
  r1 |
  r1 |
  r1 |
  r1 |
  r1 |
  r1 |
  r1 |
  r1 |
  r1 |
  r1 |
  r4 r8 ees'8 f aes f ges~ \bar "||"
  ges1~ |
  ges4 r8 ees8 f aes f ges~ |
  ges1~ |
  ges4 r8 des8 ees f ees ees~ |
  ees1~ |
  ees4 r8 ees8 f aes f ges~ |
  ges1~ |
  ges4 r8 ees8 ges bes ges d~ |
  d1~ |
  d4 r8 ees8 f aes f ges~ |
  ges1~ |
  ges4 r4 r2 \bar "||"
}

Background = \relative c' {
  \key c \major
  \partial 4
  ees4\staccato
  \repeat volta 2 {
    aes2.~^(aes8 ges\staccato)
    r4 r8 bes,8^(des8.[ bes16 d8 ees8])
    r1
    r2 r4 ees\staccato \break
  }
}

% Une grille du morceau (qui servira pour l'improvisation)
grille = \chordmode {
  \key c \major
  ees1:7 aes:7 ees:7 ees:7
  aes:7  aes:7 ees:7 ees:7
  f:m    bes:7 ees:7 f2:m bes:7
}

% L'harmonie du morceau
harmonie = \chordmode {
  \key c \major
  r1
  \grille
  \grille
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
%      \rotate #8
      \fontsize #4
      $tonality
    }
  }
  \score {
    <<
      \context ChordNames {
        \transpose c $transposition \harmonie
      }
      \new StaffGroup
      <<
        \new Staff { \transpose c $transposition \theNotes_first_voice }
        \new Staff { \transpose c $transposition \TheNotes_second_voice }
        \new Staff { \transpose c $transposition \TheNotes_third_voice }
      >>
    >>
    \midi {}
    \layout {}
  }
}


\bookpart {
    \header {
      subtitle = \markup {
        \override #'(font-name . "LilyJazz Text")
        \fontsize #5
        Improvisation
      }
      poet = \markup {
        \override #'(font-name . "lilyjazz-chord")
        \fontsize #4
        $tonality
      }
      piece = \markup {
        \override #'(font-name . "LilyJazz Text")
        \fontsize #1
        Solo
      }
    }

    \score {
      <<
        \context ChordNames {
          \transpose c $transposition \grille
        }
        \new Staff {
          \repeat unfold 16 { \rs } \break
          \repeat unfold 16 { \rs } \break
          \repeat unfold 16 { \rs } \break
        }
      >>
      \layout {
        \context {
          \Staff
          \remove "Time_signature_engraver"
          \remove "Clef_engraver"
        }
      }
    }
    \score {
      \header {
        piece = \markup {
          \override #'(font-name . "LilyJazz Text")
          \fontsize #1
          Background
        }
      }
      <<
        \new Staff {
          \transpose c $transposition \Background
        }
     >>
    }
}