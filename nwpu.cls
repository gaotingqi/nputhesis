\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nwpu}[2014/07/03 v0.01 NWPU]

\newif\iftw@side \tw@sidefalse
\DeclareOption{twoside}{%
    \global\tw@sidetrue{}%
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions \relax
\LoadClass{book}

\RequirePackage{amsmath,amssymb}
\RequirePackage{graphicx}
\RequirePackage{footmisc,bm}
\RequirePackage{geometry}  % �����޸�
\RequirePackage{ctexcap}  % ���ı��� ���� CTEX
\RequirePackage{CJKulem} % �����»��� ֧�����Ķ��е��»���
\RequirePackage{fancyhdr} % ҳ��ҳü
\RequirePackage{caption}   % ʹ�øú���������� ����
\RequirePackage{ifthen}
\RequirePackage{calc}
\RequirePackage{titletoc}
\RequirePackage{times}
\RequirePackage{mathptmx}
%\RequirePackage{color}

% ҳ�߾�����
\geometry{paperwidth=210mm,paperheight=297mm,left=2.5cm,right=2.5cm,top=2.54cm,bottom=2.54cm}%
%\paperwidth=210mm
%\paperheight=297mm
%\textwidth=160mm
%\textheight=246.2mm
\topmargin=-10.4mm%
\headheight=17pt%
\footskip=8mm%
\headsep=5mm%
\iftw@side %
    \setlength{\oddsidemargin}{\oddsidemargin + 20pt} %
    \setlength{\evensidemargin}{\evensidemargin - 20pt} %
\fi

% ����ȫ��Ĭ���ֺ�  TODO
\renewcommand{\normalsize}{\zihao{-4}}
\linespread{1.5}  % �ο�����˵����1.25��ʾ1.5���о�

% ��������
\CTEXsetup[name={,}, number={\arabic{chapter}},beforeskip={20pt}, afterskip={20pt}]{chapter}
\CTEXsetup[nameformat={\heiti\zihao{3}\bf}]{chapter}
\CTEXsetup[titleformat={\heiti\zihao{3}}]{chapter}
\CTEXsetup[format={\heiti\zihao{4}}]{section}
\CTEXsetup[format={\heiti\zihao{-4}}]{subsection}

\def\confont{\songti\zihao{-4}}
% Ŀ¼����
\titlecontents{chapter}[0pt]{\confont}
    {\thecontentslabel\hspace{.5em}}{}{\hspace{.5em}\titlerule*{.}\contentspage}
%\titlecontents{chapter}[3em]{\vspace{3mm}\confont}{\thecontentslabel}%
%                {\thecontentslabel}{\titlerule*[0.5pc]{$\cdot$}\confont\contentspage}
\titlecontents{section}[15pt]{\confont}
    {\thecontentslabel\quad}{}{\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{subsection}[30pt]{\confont}
    {\thecontentslabel\quad}{}{\hspace{.5em}\titlerule*{.}\contentspage}
% ҳü ҳ��
\pagestyle{fancy}

% �þ�ֻ�ܷ��� \pagestyle{fancy} ֮�����������
% �ο��� http://bbs.ctex.org/forum.php?mod=viewthread&tid=59087
\renewcommand{\chaptermark}[1]{\markboth{%
    \if@mainmatter %
        \ifnum\arabic{chapter}>0 %
            \arabic{chapter}\quad %
        \fi%
    \fi#1}{}}
\fancyhf{}
\fancyhead[EC]{\songti\zihao{-5}������ҵ��ѧ��ʿѧλ����}
\fancyhead[OC]{\songti\zihao{-5}\leftmark}
\fancyfoot[C]{\songti\zihao{5}\thepage}
\renewcommand{\headrule}{%
    \hrule width\headwidth height2.8pt \vspace{1pt}%
    \hrule width\headwidth height0.8pt}
\fancypagestyle{plain}{\thispagestyle{fancy}} % Ϊ�½���ҳ����ҳü
% ����½ں�հ�ҳ��ҳü
\newcommand{\clearpagestyle}{\clearpage{\pagestyle{empty}\cleardoublepage}}

% ���ķ���
\def\titleC#1#2{\def\@titleC{#1}\def\@titleCN{#2}}
\def\@titleC{}
\def\@titleCN{}
\def\authorC#1{\def\@authorC{#1}}\def\@authorC{}
\def\majorC#1{\def\@majorC{#1}}\def\@majorC{}
\def\supervisorC#1{\def\@supervisorC{#1}}\def\@supervisorC{}
\def\dateC#1{\def\@dateC{#1}}\def\@dateC{}

\def\classno#1{\def\@classno{#1}}\def\@classno{}
\def\secretlevel#1{\def\@secretlevel{#1}}\def\@secretlevel{}
\def\authorno#1{\def\@authorno{#1}}\def\@authorno{}

\def\makecoverO{
    \begin{titlepage}
        \linespread{1.25}
        \begin{center}
            \bf
            \hfill
            \newlength{\Mycode} \settowidth{\Mycode}{ѧУ���룺2000000000}
            \newlength{\Name} \settowidth{\Name}{ѧУ����}
            \begin{minipage}{\Mycode}
                \makebox[\Name][s]{ѧУ����}��10699 \\
                \makebox[\Name][s]{�����}��\@classno \\
                \makebox[\Name][s]{�ܼ�}��\@secretlevel \\
                \makebox[\Name][s]{ѧ��}��\@authorno \\
            \end{minipage}
            \par\vspace{7cm}
            \zihao{1}
            \begin{minipage}[t]{2.5cm}
                ~��~Ŀ:
            \end{minipage}
            \begin{minipage}[t]{12cm}
                \begin{center}
                    \uline{\hfill\@titleC\hfill} \\
                    \ifthenelse{\isundefined{\@titleCN}}{%
                        \uline{\hfill\quad\hfill}}
                        {\uline{\hfill\@titleCN\hfill}}
                \end{center}
            \end{minipage}
            \par\vspace{4cm}
            \zihao{3}
            \begin{minipage}{7cm}
                ��\qquad �ߣ�\uline{\hfill\@authorC\hfill}
            \end{minipage}
            \par\vspace{3\baselineskip}
            \newlength{\Lname} \settowidth{\Lname}{����ѧλ����}
            \begin{minipage}{10cm}
                \noindent
                \makebox[\Lname][s]{ѧ��רҵ}��\uline{\hfill\@majorC\hfill} \par
                \vspace{0.5\baselineskip}
                \makebox[\Lname][s]{ָ����ʦ}��\uline{\hfill\@supervisorC\hfill} \par
                \vspace{0.5\baselineskip}
                \makebox[\Lname][s]{����ѧλ����}��\uline{\hfill\@dateC\hfill} \par
            \end{minipage}
            \vspace{2\baselineskip}
        \end{center}
    \end{titlepage}
    \clearpagestyle
}

\def\makecoverC{
    \begin{titlepage}
    \linespread{1.25}
        \vspace*{2cm}
        \begin{center}

                \centerline{\zihao{3} ��~��~��~ҵ~��~ѧ}
            \vspace{5mm}
                \centerline{\zihao{1} ��~ʿ~ѧ~λ~��~��}
            \vspace{3cm}
            \zihao{2}
            \begin{minipage}[t]{2cm}
                ��~Ŀ:
            \end{minipage}
            \begin{minipage}[t]{10cm}
                \begin{center}
                    \uline{\hfill\@titleC\hfill} \\
                    \ifthenelse{\isundefined{\@titleCN}}{%
                        \uline{\hfill   \hfill}}
                        {\uline{\hfill\@titleCN\hfill}}
                \end{center}
            \end{minipage}
            \par\vspace{6cm}
            \zihao{3}
            \begin{minipage}{8cm}
                \noindent
                ��\qquad �ߣ�\uline{\hfill\@authorC\hfill}\par
                \vspace{1\baselineskip}
                ѧ��רҵ��\uline{\hfill\@majorC\hfill}\par
                \vspace{1\baselineskip}
                ָ����ʦ��\uline{\hfill\@supervisorC\hfill}\par
            \end{minipage}
            \vspace{2\baselineskip}
            \par\makebox[30mm]{\@dateC}\hfill
        \end{center}
    \end{titlepage}
    \clearpagestyle
}

% Ӣ�ķ���
\def\titleE#1{\def\@titleE{#1}}\def\@titleE{}
\def\authorE#1{\def\@authorE{#1}}\def\@authorE{}
\def\majorE#1{\def\@majorE{#1}}\def\@majorE{}
\def\supervisorE#1{\def\@supervisorE{#1}}\def\@supervisorE{}
\def\dateE#1{\def\@dateE{#1}}\def\@dateE{}

\def\makecoverE{
    \begin{titlepage}
    \linespread{1.25}
        \vspace*{1.5cm}
        \begin{center}
            {\bf\Large
            %\vspace{2\baselineskip}
            \@titleE \\
            \vspace{3\baselineskip}
            By \\
            \@authorE \\
            \vspace{1\baselineskip}
            Under the Supervision of Professor \\
            \@supervisorE }\\
            \Large
            \vspace{3\baselineskip}
            A Dissertation Submitted to \\
            Northwestern Polytechnical University \\
            \vspace{3\baselineskip}
            In partial fulfillment of the requirement\\
            For the degree of \\
            Doctor of \@majorE \\
            \vspace{3\baselineskip}
            Xi��an P. R. China \\
            \@dateE
        \end{center}
    \end{titlepage}
    \clearpagestyle
}

\def\makecover{\makecoverO\makecoverC\makecoverE}

% ����ժҪ
\newenvironment{abstract}{%
  \chapter{ժ \quad Ҫ}%\addcontentsline{toc}{chapter}{ժҪ}
    \newenvironment{keyword}{%
    \vspace{2\baselineskip}\par\textbf{�ؼ���: }}{}}
  {\par}

% Ӣ��ժҪ
\newenvironment{abstractE}{%
  \chapter{Abstract}%\addcontentsline{toc}{chapter}{Abstract}
    \newenvironment{keywordE}{%
    \vspace{2\baselineskip}\par\textbf{Keywords: }}{}}
  {\par}

% ����
%\DeclareCaptionLabelFormat{bf-parens}{(\textbf{#2})}
\DeclareCaptionFont{song}{\songti\zihao{5}}
\captionsetup{labelsep=quad, font=song}
\renewcommand\thetable{\arabic{chapter}--\arabic{table}}
\setlength{\abovecaptionskip}{10pt}
\setlength{\belowcaptionskip}{10pt}

\renewcommand\thefigure{\arabic{chapter}--\arabic{figure}}
\renewcommand\theequation{\arabic{chapter}--\arabic{equation}}

% �����߿�
\makeatletter
\def\hlinewd#1{%
  \noalign{\ifnum0=`}\fi\hrule \@height #1 \futurelet
  \reserved@a\@xhline}
\makeatother
% �������߸�ʽ���������߿���
\def\topline{\hlinewd{1pt}}
\def\bottomline{\hlinewd{1pt}}



\def\statement{
    \begin{titlepage}
        \linespread{1.5}
        \parskip=7pt
        \vspace*{0pt}
        \songti\zihao{4}
        \centerline{\bf ������ҵ��ѧ}
        \centerline{\bf ѧλ����֪ʶ��Ȩ������}
        \songti\zihao{5}
        ������ȫ�˽�ѧУ�йر���֪ʶ��Ȩ�Ĺ涨�������о�����У����ѧλ�ڼ���
        �Ĺ�����֪ʶ��Ȩ��λ����������ҵ��ѧ��ѧУ��Ȩ������������йز��Ż�����ͽ����ĵĸ�ӡ���͵�
        �Ӱ档�����������ı����ĺͽ��ġ�ѧУ���Խ���ѧλ���ĵ�ȫ���򲿷����ݱ����й�����
        ����м��������Բ���Ӱӡ����ӡ��ɨ��ȸ����ֶα���ͻ�౾ѧλ���ġ�ͬʱ���˱�֤��
        ��ҵ����ѧλ�����о�������׫д������һ��ע�����ߵ�λΪ������ҵ��ѧ��

        �������Ĵ����ܺ����ñ�������

        ѧλ��������ǩ��: \underline{\qquad\qquad\qquad} \qquad
        ָ����ʦǩ��: \underline{\qquad\qquad\qquad}

        \hskip 3cm �� \qquad �� \qquad �� \hskip 3cm �� \qquad  �� \qquad  ��

        \vspace*{30pt}
        \hrule
        \vspace*{50pt}
        \songti\zihao{4}
        \centerline{\bf ������ҵ��ѧ}
        \centerline{\bf ѧλ����ԭ��������}
        \songti\zihao{5}
        ����ѧУ�Ͻ���ѧ��������Ŀ�ѧ���£�����֣�����������ʽ���ѧλ���ģ�
        �Ǳ����ڵ�ʦ��ָ���½����о�������ȡ�õĳɹ���������֪���������Ѿ�
        ע�����õ����ݺ���л�ĵط��⣬�����Ĳ������κ��������˻����Ѿ���
        ��������׫д�����о��ɹ������������˻�����������ѧλ��������;ʹ��
        ���ĳɹ����Ա��ĵ��о�������Ҫ���׵ĸ��˺ͼ��壬��������������ȷ��ʽ������

        ����ѧλ�������������в�ʵ��Ը��е�һ����صķ������Ρ�

        \hskip 5cm ѧλ��������ǩ����\underline{\qquad\qquad\qquad}

        \hskip 8cm �� \qquad  �� \qquad  ��
    \end{titlepage}
    %\clearpagestyle
}