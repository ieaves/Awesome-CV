% Awesome CV Ian Class
% A customized version of Awesome CV
% Based on awesome-cv.cls
% Author: Ian Eaves
% Date: 2025/01/21

\ProvidesClass{awesome-cv-ian}[2025/01/21 Ian's Awesome CV Class]


%-------------------------------------------------------------------------------
%                Load Base Class
%-------------------------------------------------------------------------------
\LoadClass{\CurrentFilePath /../awesome-cv}


%-------------------------------------------------------------------------------
%                Bibliography
%-------------------------------------------------------------------------------
%\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}

\RequirePackage[ % BibLaTeX
	sorting=ydnt, % Sorts entries by year (descending order), name, title
	style=verbose,
	doi=false,
	isbn=true,
	url=false,
	eprint=false,
	backref = false, % include back references in bibliography
	maxcitenames=3, % affects only the citations in the document body
	maxbibnames=99, % affects only the bibliography, pass 99 to print all
	hyperref=true,
	block=none,
	backend=biber % {Options: bibtex, biber}
	]{biblatex}

% Avoid splitting entries across page break (only for 3 or fewer lines)
% Tip: http://tex.stackexchange.com/a/51261
\AtBeginEnvironment{thebibliography}{%
   \clubpenalty10000
   \@clubpenalty \clubpenalty
   \widowpenalty10000
   \interlinepenalty5000}

% Customized format, based on Fancy CV template created by Adrien Friggeri
\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}
\DeclareFieldFormat[incollection]{title}{#1\par}

\DeclareBibliographyDriver{article}{%
  \fontsize{9pt}{1em}\bodyfont%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \fontsize{8pt}{1em}\bodyfontlight\color{graytext}%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{inproceedings}{%
  \fontsize{9pt}{1em}\bodyfont%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \fontsize{8pt}{1em}\bodyfontlight\color{graytext}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{incollection}{%
  \fontsize{9pt}{1em}\bodyfont%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \fontsize{8pt}{1em}\bodyfontlight\color{graytext}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \fontsize{9pt}{1em}\bodyfont%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \fontsize{8pt}{1em}\bodyfontlight\color{graytext}%
    \printfield{booktitle}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \fontsize{9pt}{1em}\bodyfont%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \fontsize{8pt}{1em}\bodyfontlight\color{graytext}%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

% New syntax for flexible backend (BibLaTeX > v3.3)
\DeclareNameFormat{author}{%
  \fontsize{9pt}{1em}\bodyfont%
  \renewcommand*{\multinamedelim}{\addcomma\addspace}%
  \nameparts{#1}%
  \ifthenelse{\value{listcount}=1}
    {\ifblank{\namepartgiven}{}{\namepartgiven\space}%
    \namepartfamily}%
    {\ifblank{\namepartgiven}{}{\namepartgiven\space}%
    \namepartfamily}%
  \ifthenelse{\value{listcount}<\value{liststop}}
  {\addcomma\space}
  {}
}