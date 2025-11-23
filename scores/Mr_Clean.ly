\version "2.24.0"
\include "header.ily"


title = #"Mr Clean"
composer = #"-Freddy Hubbard"
meter = #" (Med. Funk)"
thetempo = #140
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
% #(define (get-solo-chord transposition)
%   (let ((target-root 0))
%    (cond
%     ((equal? transposition "c")
%      (set! target-root 5))
%     ((equal? transposition "bes")
%      (set! target-root 7))
%     ((equal? transposition "ees")
%      (set! target-root 10))
%     (else
%      (set! target-root 5)))
%
%    (let* ((root-names '("c" "des" "d" "ees" "e" "f" "ges" "g" "aes" "a" "bes" "b"))
%            (root-index (modulo target-root 12))
%            (chord-string (string-append (list-ref root-names root-index) "m7"))
%            (first-char (string-ref chord-string 0)))
%
%      ; Construction de la chaîne avec la première lettre en majuscule
%     (string-append
%      (string (char-upcase first-char))
%      (substring chord-string 1 (string-length chord-string))))))
% -----------------------------------------------------

theNotes = \relative c' {
   \set Staff.midiInstrument = "Tenor Sax"
  \key ees \major
  \partial 8 c'8 |
  \bar "||"
  f f ees f r2 |
  r2 c8 bes aes f |
  bes aes f ees~ ees2~ |
  ees2 r4. c'8 | \break

  f f ees f r4 aes4~ |
  aes4 ges8 e8 aes4 e8 des |
  ees des b aes~ aes2 |
  bes8 ces bes aes f aes bes c |  \break
  f f ees f r2  |
  r2 c8 bes aes f |
  bes8 aes f ees~ ees2~ |
  ees1 | \break

  f8 bes c ees f aes f ees |
  bes c ees aes,~ aes2 |
  << \new Voice \relative c' {
       \voiceOne
       ees8 ees4 ees8~ ees8 aes f4 |
     } \\
     \new Voice \relative c'' {
       \voiceTwo
       \override NoteHead.style = #'cross
       \override NoteHead.duration-log = #2
       \override NoteHead.Y-offset = #-4.5
       c8 c4 c8~ c8 c c4 |
     }
   >>
\once \override Score.RehearsalMark.extra-offset = #'(10 . -25)
   \mark \markup {
     \override #'(font-name . "LilyJazz Text")
     #(string-append "Solo on " (get-solo-chord "$instrument_key_name"))
   }
   r2 r4. \parenthesize c8 | \bar "||"

}




% Just one chords charts
chordsChart = \chordmode {
  \key f \major
}

% All Chords for one theme (with intro, etc)
ThemeChords = \chordmode {
  \key c \major
  \chordsChart
  \partial 8 s8 |
  f1:m7 f1:m7 f1:m7 f1:m7
  f2.:m7 des4:m7 \skip 1 des1:m7 f1:m7
  f1:m7 f1:m7 f1:m7 f1:m7
  r1 r1 c1:7 c1:7
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
