\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myReport}[2023/02/17]

\LoadClass[12pt]{report} % set parent class


\newcommand{\bibliographytitle}{СПИСОК ИСПОЛЬЗОВАННЫХ ИСТОЧНИКОВ}	% set the name of chapter with a table of contents
\newcommand{\toctitle}{СОДЕРЖАНИЕ}	% set the name of chapter with a table of contents



\usepackage[T2A,T1]{fontenc}
\usepackage[english, russian]{babel}


% paper settings
\usepackage{geometry}
\geometry{
	a4paper,	% size of paper
	left=30mm,	%
	right=15mm,	% margins
	top=20mm,	%
	bottom=20mm,%
}


% pragraph settings
\usepackage{setspace}
\onehalfspacing % line spacing

\usepackage[
	skip=0pt, 		% specify \parskip, the vertical space between paragraphs;
	indent=12.5mm	% indent of the first line of a paragraph
]{parskip}
\usepackage{indentfirst} % add indent to the first paragraph of each document part


% headers settings
\usepackage[explicit]{titlesec} % "explicit" to be able to use #1 in format declarations
% chapter headers settings
\titleformat
	{\chapter}
	[hang]				% shape, to write chapter marker and title in one line and text in the next one.
	{\bfseries\large}	% style
	{\ \thechapter}	% chapter marker
	{1ex}				% space between a chapter marker and its title
	{#1}				% code before inserting a chapter title, inserts chapter title from \chapter command parameter
\titlespacing*
	{\chapter}
	{\parindent}	% indent before chapter marker
	{0pt}			% top margin from the chapter title
	{1.5ex}			% bottom margin from the chapter title

\titleformat
	{name=\chapter, numberless}
	[display]
  	{\large\bfseries\filcenter}
	{}
	{1ex}
	{
		#1
		\addcontentsline{toc}{chapter}{#1}
	}
\titlespacing*{name=\chapter, numberless}{0pt}{0pt}{1.5ex}

% section headers settings
\titleformat
	{\section}
	[hang]
	{\bfseries\normalsize}
	{\ \thesection}
	{1ex}
	{#1}
\titlespacing*
	{\section}
	{\parindent}	% indent before chapter marker
	{2ex}			% top margin from the chapter title
	{1.5ex}			% bottom margin from the chapter title

% subsection headers settings
\titleformat
	{\subsection}
	[hang]
	{\bfseries\normalsize}
	{\ \thesubsection}
	{1ex}
	{#1}
\titlespacing*
	{\subsection}
	{\parindent}	% indent before chapter marker
	{2ex}			% top margin from the chapter title
	{1.5ex}			% bottom margin from the chapter title


% table of contents settings
\addto\captionsrussian{\def\contentsname{\toctitle}} % manuals add ToC chapter to ToC


% bibliography list settings
\usepackage[
	style=gost-numeric, % стиль цитирования и библиографии
	language=auto, % получение языка из babel
	autolang=other, % многоязычная библиография
]{biblatex}


% figures settings
\usepackage{graphicx}
\graphicspath{ {./images/} } % the path to the directory with images

% the wrapper around \includegraphics command to format a figure
% 1st param - the optional params for \includegraphics, optional
% 2nd param - the name of the image file
% 3rd param - the caption of the figure
% 4th param - the label of the figure
\newcommand{\myfigure}[4][ ]{
	\begin{figure}[h]
		\centering
		\includegraphics[#1]{#2}
		\caption{#3}
		\label{#4}
	\end{figure}
}

% set figure numbers format
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
% configure figure captions format
\usepackage[figurename=Рисунок, labelsep=endash]{caption}


% customize the environments for listings
\usepackage{enumitem}
\setlist[enumerate]{
	wide,
	align=left,
	topsep = 0pt,
	parsep = 0pt,
	partopsep = 0pt,
	itemsep = 0pt,
	labelsep = 2ex,
	itemindent = \parindent,
	labelindent = \parindent,
	labelwidth = 3ex,
	label*=\arabic*.,
	leftmargin=*,
}

\setlist[itemize]{
	wide,
	align=left,
	topsep = 0pt,
	parsep = 0pt,
	partopsep = 0pt,
	itemsep = 0pt,
	labelsep = 2ex,
	itemindent = \parindent,
	labelindent = \parindent,
	labelwidth = 3ex,
	leftmargin=*,
}
\setlist[itemize,1]{label = $\bullet$}
\setlist[itemize,2]{label = $\circ$}
