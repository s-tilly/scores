\version "2.19.82"

#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"
\include "custom.ily"

\paper {
  #(set-paper-size "a4")
%  paper-height = 11\in
%  paper-width = 8.5\in
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%ragged-last_bottom
  %%set to ##t if your score is less than one page:
  %%set to ##f if your score is more than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  %markup-system-spacing = #'((basic-distance . 23)
  %                           (minimum-distance . 8)
  %                           (padding . 1))
}