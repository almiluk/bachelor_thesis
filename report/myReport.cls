\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myReport}[2023/02/17]

\LoadClass[12pt]{extreport} % set parent class


\newcommand{\bibliographytitle}{СПИСОК ИСПОЛЬЗОВАННЫХ ИСТОЧНИКОВ}	% set the name of chapter with a table of contents
\newcommand{\toctitle}{СОДЕРЖАНИЕ}	% set the title of the table of contents


\usepackage{cmap}
\usepackage[utf8]{inputenc}
\usepackage[T2A]{fontenc}
\usepackage[english, russian]{babel}

% \usepackage{mathptmx}

% paper settings
\usepackage{geometry}
\geometry{
	a4paper,	% size of paper
	left=30mm,	%
	right=15mm,	% margins
	top=20mm,	%
	bottom=20mm,%
}


\usepackage{ragged2e}
\hyphenchar\font=-1
\sloppy


% pragraph settings
\usepackage{setspace}
\onehalfspacing % line spacing

\usepackage[
	skip=0pt, 		% specify \parskip, the vertical space between paragraphs;
	indent=12.5mm	% indent of the first line of a paragraph
]{parskip}
\usepackage{indentfirst} % add indent to the first paragraph of each document part


% headers settings
\usepackage[explicit, toctitles]{titlesec} % "explicit" to be able to use #1 in format declarations
% chapter headers settings
\titleformat
	{\chapter}
	[hang]				% shape, to write chapter marker and title in one line and text in the next one.
	{\bfseries\large}	% style
	{\thechapter}	% chapter marker
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
	{\thesection}
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
	{\thesubsection}
	{1ex}
	{#1}
\titlespacing*
	{\subsection}
	{\parindent}	% indent before chapter marker
	{2ex}			% top margin from the chapter title
	{1.5ex}			% bottom margin from the chapter title


% table of contents settings
\addto\captionsrussian{\def\contentsname{\toctitle}} % manuals add ToC chapter to ToC


\bibliographystyle{gost-numeric.bbx}
% bibliography list settings
\usepackage[
	parentracker=true,
	defernumbers=true,
	style=gost-numeric, % стиль цитирования и библиографии
	language=auto, % получение языка из babel
	autolang=other, % многоязычная библиография
	sorting=none,
	movenames=false, % не перемещать имена авторов, если их больше 3-х
]{biblatex}
\renewcommand*{\mkgostheading}[1]{#1} % убирать курсив с авторов


% figures settings
\usepackage{graphicx}
\usepackage{svg}


% the wrapper around \includegraphics command to format a figure
% 1st param - the optional params for \includegraphics, optional
% 2nd param - the name of the image file
% 3rd param - the caption of the figure
% 4th param - the label of the figure
\newcommand{\myfigure}[4][ ]{
	\begin{figure}[h]
		\centering
		\includegraphics[#1]{#2}
		\caption{\centering #3}
		\label{#4}
	\end{figure}
}

% the wrapper around \includesvg command to format an SVG figure
% 1st param - the optional params for \includesvg, optional
% 2nd param - the name of the image file
% 3rd param - the caption of the figure
% 4th param - the label of the figure
\newcommand{\mysvg}[4][ ]{
	\begin{figure}[h]
		\centering
		\includesvg[#1]{#2}
		\caption{\centering #3}
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
	itemindent = 0ex,
	labelindent = \parindent,
	labelwidth = 3ex,
	label*=\arabic*.,
	leftmargin=*,
}
\setlist[enumerate,2]{labelindent = 0pt}
\setlist[enumerate,2]{labelindent = 0pt}

\setlist[itemize]{
	wide,
	align=left,
	topsep = 0pt,
	parsep = 0pt,
	partopsep = 0pt,
	itemsep = 0pt,
	labelsep = 2ex,
	itemindent = 0ex,
	labelindent = \parindent,
	labelwidth = 3ex,
	leftmargin=*,
}
\setlist[itemize,1]{label = $\bullet$}
\setlist[itemize,2]{label = $\circ$}


\usepackage{hyperref}

\usepackage{longtable}
\newcommand*\subcaption[1]{ % Заголовок без "Таблица..." -- для заголовков на других стр.
    \multicolumn{\LT@cols}{p{1\textwidth}}{#1}
}


% настройка форматирования листингов кода
\usepackage{courier}

\usepackage{listings}
\lstset
{ %Formatting for code
	language={[ISO]C++},
    numbers=left,
	numberstyle=\fontsize{12pt}{14pt}\selectfont\color{gray},
	basicstyle=\fontsize{12pt}{14pt}\selectfont\ttfamily,
    stepnumber=1,
	frame=leftline,
    showstringspaces=false,
	rulecolor=\color{black},
	stringstyle=\color{orange},
    tabsize=4,
    breaklines=true,
    breakatwhitespace=false,
	xleftmargin=25pt,
	texcl=true,
}

\setcounter{page}{2}


\newcounter{oldtocdepth}

\newcommand{\hidefromtoc}{
  \setcounter{oldtocdepth}{\value{tocdepth}}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{-10}}
}

\newcommand{\unhidefromtoc}{
  \addtocontents{toc}{\protect\setcounter{tocdepth}{\value{oldtocdepth}}}
}


% костыль для правильного форматирования заголовков приложений
\usepackage{titletoc}
\newcommand{\myappendix}{
	\appendix
	\renewcommand\thechapter{\Asbuk{chapter}} % нумеровать арабскими цифрами
	\renewcommand{\thefigure}{\Asbuk{chapter}.\arabic{figure}}

	% форамт заголовков приложений
	\titleformat
		{\chapter}
		[display]						% shape, to write chapter marker and title in one line and text in the next one.
		{\bfseries\large\centering}		% style
		{ПРИЛОЖЕНИЕ \thechapter}	% chapter marker
		{1ex}							% space between a chapter marker and its title
		{##1}							% code before inserting a chapter title, inserts chapter title from \chapter command parameter

	% отступ после заголовка приложения
	\titlespacing*
		{\chapter}
		{\parindent}	% indent before chapter marker
		{0pt}			% top margin from the chapter title
		{2.5ex}			% bottom margin from the chapter title


	% добавить "ПРИЛОЖЕНИЕ" в оглавление
	\titlecontents{chapter}% <section-type>
		[0pt]% <left>
		{\bfseries}% <above-code>
		{ПРИЛОЖЕНИЕ \thecontentslabel.\quad}% <numbered-entry-format>
		{}% <numberless-entry-format>
		{\hfill\contentspage}% <filler-page-format>
}


%\usepackage{appendixnumberbeamer} % не считать номера страниц после команды \appendix

\newcommand*{\thead}[1]{\multicolumn{1}{|c|}{\bfseries #1}}
