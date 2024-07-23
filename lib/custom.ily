\version "2.24.0"

% Instead of \bendBefore (not implemented)
% Thanks to http://lilypond.1069038.n5.nabble.com/bendBefore-td158553.html
#(define (scoop-stencil grob)
  (ly:stencil-add
    (ly:note-head::print grob)
    (grob-interpret-markup grob
      (markup #:with-dimensions '(0 . 0) '(0 . 0)
              #:translate '(-0.2 . -0.5)
              #:path 0.25 '((moveto 0 0)
                            (curveto 0 -1 -1 -1.5 -1.5 -1.5))))))

scoop = \once \override NoteHead.stencil = #scoop-stencil

% Usage
% \new Staff { \scoop c''4 }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% one / per beat in improvisation structure
rs = {
  \once \override Rest.stencil = #ly:percent-repeat-interface::beat-slash
  \once \override Rest.thickness = #0.48
  \once \override Rest.slope = #1.7
  r4
}

% Usage
%        \new Staff { \jazzOn
%            \bar "||"
%            \rs \rs \rs \rs |
%            \rs \rs \rs \rs |
%            \rs \rs \rs \rs |
%            \rs \rs \rs \rs | \break
%            \rs \rs \rs \rs |
%            \rs \rs \rs \rs |
%            \rs \rs \rs \rs |
%            \rs \rs \rs \rs | \break
%            \rs \rs \rs \rs |
%            \rs \rs \rs \rs |
%            \rs \rs \rs \rs |
%            \rs \rs \rs \rs
%            \bar "||"
%        }