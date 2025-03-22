# ntu-thesis-latex

Undergraduate thesis template in Latex for NTU Singapore.

Last updated for CCDS FYP guidelines in 2025 March. Fully compatible in Overleaf with XeLaTeX compiler.

## Motivation

Nanyang Technological University (NTU) has some special requirements about Final Year Project report submission:

- Font size 12pt, Font family: Times New Roman (Ouch for latexer..)
- Left margin: 35mm, top, right, bottom margin: 30mm
- Sections contains (in order): Cover page, Abstract, Acknowledgement, Table of Contents, List of Figures, List of Tables, Actual content, Reference and Appendix

_Nobody likes wasting time on formatting_, so hopefully this template save you from the trouble and help you focus on the actual content.

## Installation

1. [Texlive](https://tug.org/texlive/) full package
2. Times New Roman font installation
   For Linux 18.04 user (if it doesn't work, [see here](https://askubuntu.com/questions/210680/installing-times-new-roman-font) for more info):

```shell
sudo apt install ttf-mscorefonts-installer
```

## Build

```shell
make
```

To see the result, either directly open the `main.pdf` or if you're using Linux, type:

```shell
make pdf
```

## How to use

1. start your `main.tex` with:

    ```tex
    % To use this style - say something like:
    %  for dull, boring thesis format:
    \documentclass[12pt]{ntuthesis}
        \pagestyle{plain}
    % OR for fast drafts:
    \documentclass[11pt,singlespace,draft]{ntuthesis}
        \pagestyle{drafthead}
    % OR for Tech Reports(2 sided, great for print-out hardcopy):
    \documentclass[12pt,twoside]{ntuthesis}
        \pagestyle{headings}
    ```

2. modify global varibles specific to your paper in `cover.tex`:

    ```tex
    \title{A Fully Homomorphic Encryption Scheme}
    \author{Craig Gentry}
    \project{CCDSXX-1234}{Final Year Project:\\This is an example}
    \department{Department of Electrical Engineering and Computer Science}
    \degree{Bachelor of Science in Computer Science and Engineering}
    \degreemonth{September}
    \degreeyear{2009}
    \thesisdate{May 18, 2009}
    \supervisor{Dan Boneh}{Associate Professor}
    ```

## Clean Up

After further modification, before git commit, please:

```shell
make clean
```

## FAQ

**How to use single spacing?**

```tex
\documentclass[singlespace, [otheroptions]]{ntuthesis}
% Option `twoside':
%   Good for producing Tech Reports.
%   The default is single-sided printing, which is what NTU wants on the
%   thesis document itself.
%
% Option `singlespace':
%   Good for drafts.
%   One-and-half-spaced theses are the default.
%   That is what NTU asks for in the formal specifications.
%
%  Note that 1.5 spacing is for NTU undergraduate thesis (i.e. FYP).
%   the requirement may vary for Master thesis and Ph.D. thesis
%
% Option `draft':
%   Puts `overfull' boxes at the end of lines that are too long.
%
% Pagestyle `drafthead':
%   Puts the date and the label ``*DRAFT*'' in the footer.
%
```

**What if I need a different citation format**
Change in your `main.tex`, e.g.:

```tex
\bibliographystyle{plain}
```

## Lisence

This `ntuthesis.cls` class file is built on top of MIT's Ph.D. thesis template, thus any code in this repo would also be
released under the license(please read the comment at the beginning of the class file).
