\version "2.19.82"

\include "lib/LilyJAZZ.ily"
\include "lib/custom.ily"

title = "Yes I Can, No You Can't"
composer = "Lee Morgan"

% Une grille du morceau (qui servira pour l'improvisation)
grille = \chordmode {
  f1:7 bes:7 f:7 f:7
  f:7 bes:7 f:7 f:7
  bes:7 bes:7 bes:7 bes:7
  f g:m7 f/a aes:m7
  g:7 g:7 ges:7 ges:7
  f:7 bes:7 f:7 c:7
}
%
% L'harmonie du morceau
harmonie = \chordmode {
  f1:7 f1:7 f1:7 f1:7
  \grille
}

theme = \relative c' {
  \key f \major

  \mark "Introduction"
  \bar ".|:" \repeat volta 2 { \repeat percent 4 { R1 } } \break

  \mark "Theme"
  f4\staccato r8 f\staccato c'16-> bes8. gis16( a) r8
  r8 c~ \tuplet 3/2 {c8 ees f} bes16 a aes8~ aes ees16 f
  <d, gis>8 <ees a>~ <ees a>2 r4
  c'8 f\staccato f ees\staccato \scoop f8. ees16 \tuplet 3/2 {d16 bes aes} f8
  \break
  f4\staccato r8 f16 f ees'-> d8. c16-> d r8
  r8 g~-> g8 f16 ees c8\staccato d\staccato f,\staccato bes\staccato
  \grace gis \tuplet 3/2 {a4 d8->} \tuplet 3/2 {r4 c8->} \tuplet 3/2 {r4 a8->} \tuplet 3/2 {r4 ees8~}
  ees2. r8 f
  \break
  bes4\staccato r8 bes16 bes ees-> ees8. c16-> d8.\staccato
  r8 bes\staccato \grace e f[ aes] bes aes g ees
  f g bes, <e, cis'>-> r8 <f d'>~ <f d'>4
  r8 f'\staccato f ees16 f aes-> f ees8 b16-> bes aes8
  \break
  f4\staccato r8 a16 c f f8\staccato ees16 f8 d
  r4 d8 bes r d e[ f]
  r g-> r e-> r c-> r a16 f
  aes8 f aes bes~ bes4. aes16 bes
  \break
  g4\staccato b8 g \scoop c4. g8
  r4 g-> r8 c \tuplet 3/2 {b16 c bes} g8
  ges4\scoop bes8 g ces ees~ ees4
  bes\staccato r8 ges16 bes \tuplet 3/2 {des8 ees des} \tuplet 3/2 {bes aes g}
  \break
  f4\staccato r8 f\staccato c'16-> bes8. gis16( a) r8
  r8 c~ \tuplet 3/2 {c8 ees f} bes16 a aes8~ aes ees16 f
  <d, gis>8 <ees a>~ <ees a>2 r4
  c'8 f\staccato f ees\staccato \scoop f8. ees16 \tuplet 3/2 {d16 bes aes} f8
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tonality = $tonality

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

    \score {
      <<
        \context ChordNames {
            \transpose c $transposition \internal_harmonie
        }

            \new Staff { \jazzOn \transpose c $transposition \theme }
      >>

        %\layout {}
        %\midi {
          % \tempo \temps = \bpm
        %}
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

    \score {
      <<
        \context ChordNames {
          \override ChordNames . ChordName #'font-name = #"LilyJazz Text, LilyJAZZ"
          \override ChordNames . ChordName #'font-size = #4
          \key c \major \transpose c $transposition \grille
        }
        \new Staff {
          \jazzOn
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
          \rs \rs \rs \rs | \break
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
}
% https://github.com/veltzer/openbook
% http://leighverlag.blogspot.com/2015/12/mimicking-real-book-look.html
