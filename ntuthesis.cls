% NOTE: This class file is based on the original MIT Ph.D. Thesis Latex
% template, and extend and modify on top of the source code(credit
% and license below).
%
% $Log: ntuthesis.cls,v $
% Revision 2.0  2019/03/20 15:48:16  AlexXiong97
% change to comply with NTU Singapore thesis style
% retrieved 20-Mar-2019
%
%%%%%%%%
% Original version
%	 Copyright (c) 1987 by Stephen Gildea
% Permission to copy all or part of this work is granted, provided
% that the copies are not made or distributed for resale, and that
% the copyright notice and this notice are retained.
%
% THIS WORK IS PROVIDED ON AN "AS IS" BASIS.  THE AUTHOR PROVIDES NO
% WARRANTY WHATSOEVER, EITHER EXPRESS OR IMPLIED, REGARDING THE WORK,
% INCLUDING WARRANTIES WITH RESPECT TO ITS MERCHANTABILITY OR FITNESS
% FOR ANY PARTICULAR PURPOSE.
%%%%%%%%

% To use this style - say something like:
%  for dull, boring thesis format:
%	\documentclass[12pt]{ntuthesis}
%       \pagestyle{plain}
% OR for fast drafts:
%	\documentclass[11pt,singlespace,draft]{ntuthesis}
%	\pagestyle{drafthead}
% OR for Tech Reports:
%	\documentclass[12pt,twoside]{ntuthesis}
%	\pagestyle{headings}

%%%% New options:
%
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
% 	Note that 1.5 spacing is for NTU undergraduate thesis (i.e. FYP).
%   the requirement may vary for Master thesis and Ph.D. thesis
%
% Option `draft':
%   Puts `overfull' boxes at the end of lines that are too long.
%
% Pagestyle `drafthead':
%   Puts the date and the label ``*DRAFT*'' in the footer.
%
%%%%%%%%%%
% TODO: parameter rewrite.
%%%% Parameters to initialize for boilerplate page:
%
%	\title{Mixed Circular Cylindrical Shells}
% 	\author{J. Casey Salas}
% 	\prevdegrees{B.S., University of California (1978) \\
%		     S.M., Massachusetts Institute of Technology (1981)}
% 	\department{Department of Electrical Engineering and Computer Science}
% 	\degree{Doctor of Philosophy}
%% If the thesis is for two degrees simultaneously, list them both
%% separated by \and like this:
% 	\degree{Doctor of Philosophy \and Master of Science}
% 	\degreemonth{February}
% 	\degreeyear{1987}
% 	\thesisdate{December 10, 1986}
%% If the thesis is copyright by the Institute, leave this line out and
%% the standard copyright line will be used instead.
% 	\copyrightnotice{J. Casey Salas, 1986}
%% If there is more than one supervisor, use the \supervisor command
%% once for each.
% 	\supervisor{John D. Galli}{Director, Sound Instrument Laboratory}
%% This is the department committee chairman, not the thesis committee chairman
% 	\chairman{Arthur C. Smith}
%		 {Chairman, Departmental Committee on Graduate Students}
%% Make the titlepage based on the above information.  If you need
%% something special and can't use the standard form, you can specify
%% the exact text of the titlepage yourself.  Put it in a titlepage
%% environment and leave blank lines where you want vertical space.
%% The spaces will be adjusted to fill the entire page.  The dotted
%% lines for the signatures are made with the \signature command.
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ntuthesis}[2019/03/20 NTU Thesis Template]

\def\mystretch{1.5}		% one-and-a-half spacing
\LoadClass{article}

\DeclareOption{doublespace}{}	% This is default
\DeclareOption{singlespace}{% If he explicitly wants single spacing
  \typeout{Single spaced}
  \def\mystretch{1}}
\DeclareOption{upcase}{\typeout{Uppercase cover page.}
	\gdef\choosecase#1{\uppercase\expandafter{#1}}}
%% leftblank option by Kevin Fu
\newif\if@leftblank \@leftblankfalse
\DeclareOption{leftblank}{\typeout{Intentionally Leaving Pages Blank}
\@leftblanktrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

% If the user wants single spacing, set baselinestretch=1.

\usepackage{setspace}

\def\baselinestretch{\mystretch}
\def\choosecase#1{#1}

\RequirePackage[left=3.5cm, right=3cm, top=3cm, bottom=3cm]{geometry}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\newcommand*\Let[2]{\State #1 $\gets$ #2}
\algrenewcommand\alglinenumber[1]{
    {\sf\footnotesize\addfontfeatures{Colour=888888,Numbers=Monospaced}#1}}
\algrenewcommand\algorithmicrequire{\textbf{Precondition:}}
\algrenewcommand\algorithmicensure{\textbf{Postcondition:}}
\RequirePackage{lgrind}
\RequirePackage{cmap}
\RequirePackage[T1]{fontenc}
\RequirePackage{mathptmx}
\RequirePackage{amsmath}
\RequirePackage{pifont}
\newcommand{\cmark}{\ding{51}}
\newcommand{\xmark}{\ding{55}}
\RequirePackage{appendix}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{bm}
\RequirePackage{dcolumn}
\RequirePackage[english]{babel}
\RequirePackage{enumitem}
\RequirePackage{epstopdf}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage[normalem]{ulem}
\RequirePackage{hyperref}
\hypersetup{
  colorlinks,
  urlcolor=blue,
  linkcolor=blue,
  citecolor=blue
}
\RequirePackage{inconsolata}
\RequirePackage{listings}
\RequirePackage{xcolor}
\RequirePackage{footmisc}
\RequirePackage{titlesec}
\RequirePackage{tikz}
\RequirePackage{pgf-umlsd}
\RequirePackage{tabularx}
\RequirePackage{tcolorbox}
\RequirePackage{tablefootnote}
\RequirePackage{lmodern}
\RequirePackage{float}
\RequirePackage{svg}
\RequirePackage{url}
\RequirePackage{babel}
\addto{\captionsenglish}{\renewcommand{\bibname}{References}}
\setlength\extrarowheight{5pt}
%%%%%%%  Set up margins and formatting params %%%

% Margins.
%  Note we want 1in top margin assuming no header line, so push header
%	into 1in margin.
%  Draft mode brings the header back down.
% NOTE: use geometry package instead of setlength
\setlength{\oddsidemargin}{0.38in}	% 1.38in/35mm left margin
\setlength{\evensidemargin}{0.38in}	% 1.38in/35mm left margin (even pages)
\setlength{\topmargin}{0.18in}		% 1.18in/30mm top margin
\setlength{\textwidth}{6.0in}		% 6.0in text - 1.25in rt margin
\setlength{\textheight}{9in}		% Body ht for 1in margins
\addtolength{\topmargin}{-\headheight}	% No header, so compensate
\addtolength{\topmargin}{-\headsep}	% for header height and separation

% The next two macros compensate page style for headers and footers
% We only need them in page styles that USE headers and footers.
    % If we have a header, it must be 1in from top of page.
\def\pulldownheader{			% Shift header down 1in from top
    \addtolength{\topmargin}{\headheight}
    \addtolength{\topmargin}{\headsep}
    \addtolength{\textheight}{-\headheight}
    \addtolength{\textheight}{-\headsep}
}
    % If we have a footer, put it 1in up from bottom
\def\pullupfooter{				% Shift footer up
    \addtolength{\textheight}{-\footskip}
%    \addtolength{\textheight}{-\footheight}  %footheight doesn't
%    						exist in 2e
}

%%%%%%%  End of margins and formatting params %%%
%%%%%%%  Fix various header and footer problems %%%

% Draft mark on the right side of left pages (outside)
% this mark is also the only one visible on single sided.
\newcommand{\draftrmark}{**DRAFT**}
% Draft mark on the left side of right pages (outside)
\newcommand{\draftlmark}{**DRAFT**} %

% Macros to make changing the Draft easier
\newcommand{\drmark}[1]{\renewcommand{\draftrmark}{#1}}
\newcommand{\dlmark}[1]{\renewcommand{\draftlmark}{#1}}
\newcommand{\dmark}[1]{\drmark{#1}\dlmark{#1}}

% Format for draft of thesis.  Define our own PageStyle -
% Just like headings, but has foot lines with the date and warning

\if@twoside         % If two-sided printing.
\def\ps@drafthead{
    \let\@mkboth\markboth
    \def\@oddfoot{\rm \today \hfil \sc \draftrmark}
    \def\@evenfoot{\sc \draftlmark \hfil \rm \today }
    \def\@evenhead{\rm \thepage\hfil \sl \leftmark}
    \def\@oddhead{\hbox{}\sl \rightmark \hfil \rm\thepage}
    \def\chaptermark##1{\markboth {\uppercase{\ifnum \c@secnumdepth >\m@ne
	\@chapapp\ \thechapter. \ \fi ##1}}{}}
    \def\sectionmark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\z@
	\thesection. \ \fi ##1}}}
    \pulldownheader				% Bring header down from edge
    \pullupfooter				% Bring footer up
}
\else               % If one-sided printing.
\def\ps@drafthead{
    \let\@mkboth\markboth
    \def\@oddfoot{\rm \today \hfil \sc \draftrmark}
    \def\@oddhead{\hbox{}\sl \rightmark \hfil \rm\thepage}
    \def\chaptermark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\m@ne
	\@chapapp\ \thechapter. \ \fi ##1}}}
    \pulldownheader				% Bring header down from edge
    \pullupfooter				% Bring footer up
}
\fi

% I redefine these formats that were defined in report.sty
% Definition of 'headings' page style
%  Note the use of ##1 for parameter of \def\chaptermark inside the
%  \def\ps@headings.
%

\if@twoside					% If two-sided printing.
\def\ps@headings{\let\@mkboth\markboth
    \def\@oddfoot{}
    \def\@evenfoot{}		% No feet.
    \def\@evenhead{\rm \thepage\hfil \sl \leftmark}	% Left heading.
    \def\@oddhead{\hbox{}\sl \rightmark \hfil \rm\thepage}	% Right heading.
    \def\chaptermark##1{\markboth {\uppercase{\ifnum \c@secnumdepth >\m@ne
	\@chapapp\ \thechapter. \ \fi ##1}}{}}
    \def\sectionmark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\z@
	\thesection. \ \fi ##1}}}
    \pulldownheader				% Bring header down from edge
}
\else						% If one-sided printing.
\def\ps@headings{\let\@mkboth\markboth
    \def\@oddfoot{}
    \def\@evenfoot{}		%     No feet.
    \def\@oddhead{\hbox {}\sl \rightmark \hfil \rm\thepage}	% Heading.
    \def\chaptermark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\m@ne
	\@chapapp\ \thechapter. \ \fi ##1}}}
    \pulldownheader				% Bring header down from edge
}
\fi

% Redefinition of 'myheadings' page style.
%
\def\ps@myheadings{\let\@mkboth\@gobbletwo
    \def\@oddfoot{}
    \def\@evenfoot{}
    \def\sectionmark##1{}
    \def\subsectionmark##1{}
    \def\@evenhead{\rm \thepage\hfil\sl\leftmark\hbox {}}	%
    \def\@oddhead{\hbox{}\sl\rightmark \hfil \rm\thepage}	%
    \pulldownheader				% Bring header down from edge
}

% Redefine '/chapter' to always start on an odd page.
% Should make no difference in singleside mode.
%
\if@leftblank
% Prints "THIS PAGE INTENTIONALLY LEFT BLANK" on blank pages.
\def\chapter{\clearpage\ifodd\c@page\else
   \hbox{}\par\vfill\centerline%
   {THIS PAGE INTENTIONALLY LEFT BLANK}%
   \vfill\newpage\fi
   \thispagestyle{plain}	% Page style of chapter page is 'plain'
   \global\@topnum\z@		% Prevents figures from going at top of page.
   \@afterindentfalse		% Suppresses indent in first paragraph.  Change
   \secdef\@chapter\@schapter}	% to \@afterindenttrue to have indent.
\else
\def\chapter{\cleardoublepage	% Starts new page.
   \thispagestyle{plain}	% Page style of chapter page is 'plain'
   \global\@topnum\z@		% Prevents figures from going at top of page.
   \@afterindentfalse		% Suppresses indent in first paragraph.  Change
   \secdef\@chapter\@schapter}	% to \@afterindenttrue to have indent.
\fi
% If using the report style, use - instead of . in the figure number.
\@ifundefined{thechapter}{}{\def\thefigure{\thechapter-\arabic{figure}}}


%%%%%%%%%  End of Style parameters %%%%

% Here's Gildea's Boilerplate Stuff.
% Copyright (c) 1987 by Stephen Gildea
% Permission to copy all or part of this work is granted, provided
% that the copies are not made or distributed for resale, and that
% the copyright notice and this notice are retained.

%% Define all the pieces that go on the title page and the abstract.

% \title and \author already exist
\def\department#1{\gdef\@department{#1}}

% If you are getting two degrees, use \and between the names.
\def\degree#1{\setbox0\hbox{#1}	 %for side effect of setting \@degreeword
  \gdef\@degree{#1}}

% \and is used inside the \degree argument to separate two degrees
\def\and{\gdef\@degreeword{degrees} \par and \par}
\def\@degreeword{degree}

% typically just a month and year
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\thesisdate#1{\gdef\@thesisdate{#1}}

% since there can be more than one supervisor,
% we build the appropriate boxes for the titlepage and
% the abstractpage as the user makes multiple calls
% to \supervisor
\newbox\@titlesupervisor 	\newbox\@abstractsupervisor

\def\supervisor#1#2{\setbox\@abstractsupervisor\vbox
  {\unvbox\@abstractsupervisor
  \vskip\baselineskip \def\baselinestretch{1}\@normalsize
  \par\noindent Thesis Supervisor: #1 \\ Title: #2}}

% NOTE: no requirement on putting supervisor's name on cover page.

\def\maketitle{\begin{titlepage}
\begin{figure}[H]
  \centering
  \includegraphics{figures/logo.png}
  \label{fig:logo}
\end{figure}
\large
\vskip 4\baselineskip
{\def\baselinestretch{1.2}\Large\bf \choosecase{\@title} \par}
by\par
{\Large  \choosecase{\@author}}

\vskip 10\baselineskip
\par
\choosecase{Submitted to the} \choosecase{\@department} \\
\choosecase{in partial fulfillment of the requirements for the}
\choosecase{\@degreeword}
\choosecase{of} \\
\choosecase{\@degree}
\\
at the
\par
\NTU\par
\@degreemonth\ \@degreeyear
\par
\newpage
\end{titlepage}}

% this environment should probably be called abstract,
% but we want people to also be able to get at the more
% basic abstract environment
\def\abstractpage{\cleardoublepage
\begin{center}{\large{\bf \@title}}
\par
\end{center}
\par
\begin{abstract}}

%% Changed from \unvbox to \unvcopy for use with multiple copies of abstract
%% page.
%% Krishna Sethuraman (1990)
\def\endabstractpage{\end{abstract}\noindent
 \unvcopy\@abstractsupervisor \newpage}

%% This counter is used to save the page number for the second copy of
%% the abstract.
\newcounter{savepage}

% You can use the titlepage environment to do it all yourself if you
% don't want to use \maketitle.  If the titlepage environment, the
% paragraph skip is infinitely stretchable, so if you leave a blank line
% between lines that you want space between, the space will stretch so
% that the title page fills up the entire page.
\def\titlepage{\cleardoublepage\centering
  \thispagestyle{empty}
  \parindent 0pt \parskip 10pt plus 1fil minus 1fil
  \def\baselinestretch{1}\@normalsize\vbox to \vsize\bgroup\vbox to 9in\bgroup}
% The \kern0pt pushes any depth into the height.  Thanks to Richard Stone.
\def\endtitlepage{\par\kern 0pt\egroup\vss\egroup\newpage}

\def\NTU{NANYANG TECHNOLOGICAL UNIVERSITY}
\def\ntu{Nanyang Technological University}

\def\abstract{\subsection*{Abstract}\small\def\baselinestretch{1}\@normalsize}
\def\endabstract{\par}
