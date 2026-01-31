\version "2.24.0"
\include "header.ily"

title = #"There Will Never Be Another You"
composer = #"-Harry Warren"
meter = #" (Swing)"
thetempo = #210
transposition = #"$transposition"
instrument_key_name = #"$instrument_key_name"
tonality = #"$tonality"


\include "main.ily"

#(define (get-solo-chord transposition)
  (let ((target-root 0))
   (cond
    ((equal? transposition "c")
     (set! target-root 5)) ; Ut -> F
    ((equal? transposition "bes")
     (set! target-root 7)) ; Bb -> G
    ((equal? transposition "ees")
     (set! target-root 10)) ; Eb -> A
    (else
     (set! target-root 5)))

   (let* ((root-names '("C" "Db" "D" "Eb" "E" "F" "Gb" "G" "Ab" "A" "Bb" "B"))
           (root-index (modulo target-root 12)))
    ; On renvoie directement la racine (ex: "Bb") + "m7"
    (string-append (list-ref root-names root-index) "m7"))))

myJazzChordsMusic = {
  <c e g b>-\markup { \super "△" }
  <c es ges bes>-\markup { \super "ø" }
}

theNotes = \relative c' {
  \set Staff.midiInstrument = "Tenor Sax"
  \key ees \major
  \partial 4 bes |

  %% Part A
  \bar "||"
  c4 d ees f |
  g bes f ees8 f~ |
  f1~ |
  f2.  g4 | \break

  ees4 f g bes |
  c ees c bes8 c~ |
  c1~ |
  c2. bes4 | \break

  ees4 c bes aes8 g~ |
  g4 f g aes |
  bes g f ees |
  f ees8 f~ f4 ees | \break

  d'4 c bes a |
  g f g f |
  aes1 ~ |
  aes2. bes,4 | \break

  %% Part B
  c4 d ees f |
  g bes f ees8 f~ |
  f1 ~ |
  f2. g4 | \break

  ees4 f g bes |
  c ees c bes8 c~ |
  c1~ |
  c2. bes4 | \break

  ees4 c bes aes8 g~ |
  g4 f g aes |
  bes g f ees8 d'8~  |
  d2. c4 | \break

  bes4 ees d c |
  bes ees, bes' aes |
  f2 g |
  ees1 \bar "||"
}




% Just one chords charts
chordsChart = \chordmode {
  \key ees \major
}

% All Chords for one theme (with intro, etc)
ThemeChords = \chordmode {
  \chordsChart
  \partial 4 s4 |
  \mark "A"
  ees1:maj7 ees:maj7 d:m7.5- g:7.9-
  c:m7 c:m7 bes:m7 ees:7
  aes:maj7 des:7.11+ ees:maj7 c:m7
  f:7 f:7 f:m7 bes:7
  \mark "B"
  bes:maj7 ees:maj7 d:m7.5- g:7.9-
  c:m7 c:m7 bes:m7 ees:7
  aes:maj7 des:7.11+ ees:maj7 a2:m7.5- d:7
  ees:maj7 aes:7 g:m7 c:7 f:m7 bes:7 ees:maj7 bes:7
  % f2.:m7 des4:m7 \skip 1 des1:m7 f1:m7
  % f1:m7 f1:m7 f1:m7 f1:m7
  % r1 r1 c1:7 c1:7
}

\bookpart {
  \header {
    % subtitle = \markup {
    %   \override #'(font-name . "LilyJazz Text")
    %   \fontsize #5
    %   Theme
    % }
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
