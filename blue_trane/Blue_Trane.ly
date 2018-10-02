\version "2.19.82"

title = "Blue Trane"
composer = "John Coltrane"

% Une grille du morceau (qui servira pour l'improvisation)
grille = \chordmode {
  ees1:7 aes:7 ees:7 ees:7
  aes:7  aes:7 ees:7 ees:7
  f:m    bes:7 ees:7 f2:m bes:7
}

% L'harmonie du morceau
harmonie = \chordmode {
  r1
  \grille
  \grille
}

head = \relative {
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


middlepart = \relative {
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

basspart = \relative {
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


temps = 4 % 4/4
bpm = 72

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tonality = $tonality

\include "LilyJAZZ.ily"

#(set-default-paper-size "a4")
\paper {
  #(set-paper-size "a4")
  #(define dump-extents #t)

  %ragged-right = ##t
  indent = 0\mm
  line-width = 200\mm %- 2.0 * 0.4\in
  print-page-number = false
  %horizontal-shift = ##t
}

rs = {
  \once \override Rest.stencil = #ly:percent-repeat-item-interface::beat-slash
  \once \override Rest.thickness = #0.48
  \once \override Rest.slope = #1.7
  r4
}

internal_harmonie = \relative \chordmode {
  \override ChordNames . ChordName #'font-name = #"LilyJazz Text, LilyJAZZ"
  \override ChordNames . ChordName #'font-size = #4
  \harmonie
}

\bookpart {
    \header {
        title = \markup {
            \override #'(font-name . "LilyJazz Text")
            \fontsize #7
            #title
        }
        subtitle = \markup {
            \override #'(font-name . "LilyJazz Text")
            \fontsize #6
            Thème
        }
        poet = \markup {
            %\override #'(font-name . "LilyJazz Text")
            \rotate #8
            \fontsize #4
            #tonality
        }
        composer = \markup {
            \override #'(font-name . "LilyJazz Text")
            \fontsize #4
            #composer
        }
        tagline = ##t % removed
    }

    \score { <<
        \context ChordNames {
            \key c \major \transpose c $transposition \internal_harmonie
        }
        \new StaffGroup <<
            \new Staff { \jazzOn \transpose c $transposition \head }
            \new Staff { \jazzOn \transpose c $transposition \middlepart }
            \new Staff { \jazzOn \transpose c $transposition \basspart }
        >>
        >>

        \layout {}
        \midi {
          % \tempo \temps = \bpm
        }
    }
}
\bookpart {
    \header {

      title = \markup {
          \override #'(font-name . "LilyJazz Text")
          \fontsize #7
          #title
      }

      subtitle = \markup {
          \override #'(font-name . "LilyJazz Text")
          \fontsize #6
          Improvisation
      }
      poet = \markup {
          %\override #'(font-name . "LilyJazz Text")
          \rotate #8
          \fontsize #4
          #tonality
      }
      composer = \markup {
          \override #'(font-name . "LilyJazz Text")
          \fontsize #4
          #composer
      }
      piece = \markup {
          \override #'(font-name . "LilyJazz Text")
          \fontsize #1
          grille
      }
      tagline = ##t % removed
    }

    \score
    {
     <<
        \context ChordNames {
            \override ChordNames . ChordName #'font-name = #"LilyJazz Text, LilyJAZZ"
            \override ChordNames . ChordName #'font-size = #4
            \key c \major \transpose c $transposition \grille
        }
        \new Staff { \jazzOn
            \bar "||"
            \rs \rs \rs \rs |
            \rs \rs \rs \rs |
            \rs \rs \rs \rs |
            \rs \rs \rs \rs | \break
            \rs \rs \rs \rs |
            \rs \rs \rs \rs |
            \rs \rs \rs \rs |
            \rs \rs \rs \rs | \break
            \rs \rs \rs \rs |
            \rs \rs \rs \rs |
            \rs \rs \rs \rs |
            \rs \rs \rs \rs
            \bar "||"
        }
       >>
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
              \jazzOn
              \key c \major \transpose c $transposition \relative c' {
                  \partial 4
                  ees4\staccato
                  \repeat volta 2 {
                      aes2.~^(aes8 ges\staccato)
                      r4 r8 bes,8^(des8.[ bes16 d8 ees8])
                      r1
                      r2 r4 ees\staccato \break
                  }
              }
          }
     >>
    }
}
% https://github.com/veltzer/openbook
% http://leighverlag.blogspot.com/2015/12/mimicking-real-book-look.html
