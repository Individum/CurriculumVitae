%%by Igor Frangez
%%Identification
%%The class identifies itself and the LaTeX version needed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{IgorFrangezCV}[2021/04/16 Based on PS CV]

\LoadClass[a4paper]{article}

\RequirePackage{titlesec}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage{tabularx}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{xparse}
%\usepackage{boxedminipage} %for troubleshooting minipages begin{boxedminipage}

\renewcommand{\headrulewidth}{0pt} %pagestyle{fancy} executes headrulewidth with 0.4pt which is just not good looking

%\setlength\footskip{2cm}
\pagestyle{fancy} 
\fancyhf{} %clear all header and footer
\fancyfootoffset{0.001\textwidth} %bruteforce offset of the pagenumbers
\rfoot{\thepage \hspace{1pt} $\mid$ \pageref{LastPage}}



\newgeometry{vmargin={10mm}, hmargin={25mm,25mm}, footskip={12pt}}   % edges of the document


%create Name
\newcommand{\name}[1]{%
  \leftline{\Huge\bfseries{#1}}

}

\newcommand{\contact}[5]{
    \leftline{#1}
    \leftline{#2}
    \leftline{#3}
    \leftline{#4}
    \leftline{#5}
}

%customize '\section{}'
\titleformat{\section}         % Customise the \section command 
  {\Large\scshape\raggedright\bfseries} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  [\titlerule]                 % Inserts a horizontal line after the heading

%customize '\subsection{}'
\titleformat{\subsection}
  {\large\scshape\raggedright}
  {}{0em}
  {}

%new command '\datedsubsection' for subsections
\newcommand{\datedsubsec}[5]{%
    \parbox{\textwidth}{
    	\begin{minipage}[t]{0.3\textwidth} 
            \raggedright \textbf{#1} \\
            #2
    	\end{minipage}
    	\hspace{0.05\textwidth}
    	\begin{minipage}[t]{0.64\textwidth}
            \textbf{#3} 
            \begin{enumerate}[nosep, leftmargin = *, label = {$\succ$}]
                \item #4 
                \item #5 

            \end{enumerate}
    	\end{minipage}
    }
    \vspace{0.2cm}
    \rule{0pt}{0.2cm}

}
\ExplSyntaxOn
\NewDocumentCommand \datedsubsection {m m m O{} O{}}{
    \parbox{\textwidth}{
    	\begin{minipage}[t]{0.3\textwidth} 
            \raggedright \textbf{#1} \\
            #2
    	\end{minipage}
    	\hspace{0.05\textwidth}
    	\begin{minipage}[t]{0.64\textwidth}
            \textbf{#3} 
            \begin{enumerate}[nosep, leftmargin = *, label = {$\succ$}]
                \tl_if_blank:nTF{#4}{}{\item #4 }
                \tl_if_blank:nTF{#5}{}{\item #5 }
\\
            \end{enumerate}
    	\end{minipage}
    }
    \vspace{0.2cm}
    \rule{0pt}{0.2cm}

}
\ExplSyntaxOff



  
\newcommand{\linesection}[2]{%
    \parbox{\columnwidth}{
    	\begin{minipage}[t]{0.3\textwidth} 
            \raggedright \textbf{#1}
    	\end{minipage}
    	\hspace{0.05\textwidth}
    	\begin{minipage}[t]{0.64\columnwidth}
    	    \raggedright
            #2
    	\end{minipage}
    }
    \vspace{0.05cm}
    \rule{0pt}{0.05cm}
        
}



\ExplSyntaxOn
\NewDocumentCommand \referenz {m m m m O{}}{
#1\\
#2\\
#3\\
#4\\
\tl_if_blank:nTF{#5}{}{#5 }
}
\ExplSyntaxOff

