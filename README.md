# Option_Pricing
Options Pricing using S&amp;P 500 option data from Option Metrics.

\documentclass{article}
\usepackage[utf8]{inputenc}
\usepackage{minted}
\usepackage{graphics}

\title{FIN42110: Homework 1}
\author{Matthew Torretta}
\date{Due: February 18th 2022}


\begin{document}

\maketitle

\section{Yahoo Finance}

\begin{figure}[!h]
\centering
      \scalebox{.7}{\includegraphics{FDS_HW1graph1.png}}
      \caption{Tesla 2021-2022}
\end{figure}

\newpage

\section{PDF Scraping}
\scriptsize	
\begin{tabular}{llrll}
\toprule
{} &    0 &   1 &                     2 &           3 \\
\midrule
0  &  USA &   1 &         United States &  20,936,600 \\
1  &  CHN &   2 &                 China &  14,722,731 \\
2  &  JPN &   3 &                 Japan &   5,064,873 \\
3  &  DEU &   4 &               Germany &   3,806,060 \\
4  &  GBR &   5 &        United Kingdom &   2,707,744 \\
5  &  IND &   6 &                 India &   2,622,984 \\
6  &  FRA &   7 &                France &   2,603,004 \\
7  &  ITA &   8 &                 Italy &   1,886,445 \\
8  &  CAN &   9 &                Canada &   1,643,408 \\
9  &  KOR &  10 &           Korea, Rep. &   1,630,525 \\
10 &  RUS &  11 &    Russian Federation &   1,483,498 \\
11 &  BRA &  12 &                Brazil &   1,444,733 \\
12 &  AUS &  13 &             Australia &   1,330,901 \\
13 &  ESP &  14 &                 Spain &   1,281,199 \\
14 &  MEX &  15 &                Mexico &   1,076,163 \\
15 &  IDN &  16 &             Indonesia &   1,058,424 \\
16 &  NLD &  17 &           Netherlands &     912,242 \\
17 &  CHE &  18 &           Switzerland &     747,969 \\
18 &  TUR &  19 &                Turkey &     720,101 \\
19 &  SAU &  20 &          Saudi Arabia &     700,118 \\
20 &  POL &  21 &                Poland &     594,165 \\
21 &  SWE &  22 &                Sweden &     537,610 \\
22 &  BEL &  23 &               Belgium &     515,332 \\
23 &  THA &  24 &              Thailand &     501,795 \\
24 &  NGA &  25 &               Nigeria &     432,294 \\
25 &  AUT &  26 &               Austria &     428,965 \\
26 &  ARE &  27 &  United Arab Emirates &     421,142 \\
27 &  IRL &  28 &               Ireland &     418,622 \\
28 &  ISR &  29 &                Israel &     401,954 \\
29 &  ARG &  30 &             Argentina &     383,067 \\
30 &  EGY &  31 &      Egypt, Arab Rep. &     363,069 \\
31 &  NOR &  32 &                Norway &     362,009 \\
32 &  PHL &  33 &           Philippines &     361,489 \\
33 &  DNK &  34 &               Denmark &     355,184 \\
34 &  HKG &  35 &  Hong Kong SAR, China &     346,586 \\
35 &  SGP &  36 &             Singapore &     339,998 \\
36 &  MYS &  37 &              Malaysia &     336,664 \\
37 &  BGD &  38 &            Bangladesh &     324,239 \\
38 &  ZAF &  39 &          South Africa &     301,924 \\
39 &  COL &  40 &              Colombia &     271,347 \\
40 &  FIN &  41 &               Finland &     271,234 \\
41 &  VNM &  42 &               Vietnam &     271,158 \\
42 &  PAK &  43 &              Pakistan &     263,687 \\
43 &  CHL &  44 &                 Chile &     252,940 \\
44 &  ROU &  45 &               Romania &     248,716 \\
45 &  CZE &  46 &        Czech Republic &     243,530 \\
46 &  PRT &  47 &              Portugal &     231,256 \\
47 &  NZL &  48 &           New Zealand &     212,482 \\
48 &  PER &  49 &                  Peru &     202,014 \\
49 &  IRN &  50 &    Iran, Islamic Rep. &     191,718 \\
50 &  GRC &  51 &                Greece &     189,410 \\
51 &  KAZ &  52 &            Kazakhstan &     169,835 \\
52 &  IRQ &  53 &                  Iraq &     167,224 \\
53 &  UKR &  54 &               Ukraine &     155,582 \\
54 &  HUN &  55 &               Hungary &     155,013 \\
55 &  QAT &  56 &                 Qatar &     146,374 \\
56 &  DZA &  57 &               Algeria &     145,164 \\
57 &  KWT &  58 &                Kuwait &     136,197 \\
58 &  MAR &  59 &               Morocco &     112,871 \\
59 &  ETH &  60 &              Ethiopia &     107,645 \\
60 &  SVK &  61 &       Slovak Republic &     104,574 \\
61 &  PRI &  62 &           Puerto Rico &     103,138 \\
62 &  CUB &  63 &                  Cuba &     103,131 \\
63 &  KEN &  64 &                 Kenya &      98,843 \\
64 &  ECU &  65 &               Ecuador &      98,808 \\
\bottomrule
\end{tabular}





\section{Crypto Punk Web Scraping}
\rule{\textwidth}{1pt}
\footnotesize

\begin{minted}{python}

In[1]: 

import requests
from dateutil.parser import parse
from bs4 import BeautifulSoup

# Crypto Punk
#~~~~~~~~~~~~
BaseStr = "https://www.larvalabs.com/cryptopunks/details/"
PunkNo = '24'
page = requests.get(BaseStr + PunkNo)
soup = BeautifulSoup(page.content, 'html.parser')
for headlines in soup.find_all("div", {'class' : 'col-md-4'}):
    print(headlines.text.strip())

Out[1]: 

CryptoPunks Overview

Smile
238 punks have this.

Mohawk Dark
429 punks have this.

\end{minted}
\rule{\textwidth}{1pt}


\newpage


\textbf{\huge Code for part 1}
\\*
\rule{\textwidth}{1pt}
\begin{minted}{python}

import yfinance as yf
import mplfinance as mpf
import numpy as np
import pandas as pd
import matplotlib

ticker_name = 'TLSA'
yticker = yf.Ticker(ticker_name)
TLSA = yticker.history(period="1y")


mpf.plot(
            TLSA,
            type='candle',
            style='yahoo',
            title='TSLA',
            ylabel='Price ($USD)',
            show_nontrading=True,
            datetime_format='%b %d',
        )

\end{minted}
\rule{\textwidth}{1pt}

\vspace{3cm}

\textbf{\huge Code for part 2}
\\*
\rule{\textwidth}{1pt}
\begin{minted}{python}

import tabula as tb
import pandas as pd
from IPython.display import display
from tabula.io import read_pdf

df = tb.io.read_pdf("GDP1.pdf", pages='1',pandas_options={'header': None})[0]
tb.io.convert_into("GDP1.pdf", "GDP1.csv", output_format="csv", pages='1')
df.drop(columns=df.columns[-1], axis= 1, inplace= True)
print(df.to_latex())

\end{minted}
\rule{\textwidth}{1pt}


\end{document}
