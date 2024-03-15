return {
    s({ trig = "REALS", snippetType = "autosnippet" }, { t("\\mathbb{R}") }),
    s({ trig = "NATS", snippetType = "autosnippet" }, { t("\\mathbb{N}") }),
    s({ trig = "INTS", snippetType = "autosnippet" }, { t("\\mathbb{Z}") }),
    s({ trig = "COMPS", snippetType = "autosnippet" }, { t("\\mathbb{C}") }),
    s({ trig = ";a", snippetType = "autosnippet" }, { t("\\alpha") }),
    s({ trig = ";b", snippetType = "autosnippet" }, { t("\\beta") }),
    s({ trig = ";g", snippetType = "autosnippet" }, { t("\\gamma") }),
    s({ trig = ";d", snippetType = "autosnippet" }, { t("\\delta") }),
    s({ trig = ";r", snippetType = "autosnippet" }, { t("\\rho") }),
    s({ trig = ";s", snippetType = "autosnippet" }, { t("\\sigma") }),
    s({ trig = ";p", snippetType = "autosnippet" }, { t("\\varphi") }),
    s({ trig = ";e", snippetType = "autosnippet" }, { t("\\epsilon") }),
    s({ trig = ";v", snippetType = "autosnippet" }, { t("\\varepsilon") }),
    s({ trig = ";i", snippetType = "autosnippet" }, { t("\\eta") }),
    s({ trig = ";l", snippetType = "autosnippet" }, { t("\\lambda") }),
    s({ trig = "*", snippetType = "autosnippet" }, { t("^{\\ast}") }), -- somehow, having it not expanding in the middle of a 'word' is okay. V* is inconvenient but \set* is perfect.
    s({ trig = "$", snippetType="autosnippet" }, fmta([[\(<>\)]], { i(1)})),
    s({ trig = "2x2m", snippetType="autosnippet"},
        fmta(
            [[
            \begin{pmatrix}
                <> && <>\\
                <> && <>
            \end{pmatrix}
            ]],
            { i(1), i(2), i(3), i(4) }
        )
    ),
    s({ trig = "def", },
        fmta(
            [[
            \begin{definition}{<>}{<>}
                <>
            \end{definition}
            ]],
            { i(1), i(2), i(3) }
        )
    ),
    s({ trig = "thm", },
        fmta(
            [[
            \begin{theorem}{<>}{<>}
                <>
            \end{theorem}
            ]],
            { i(1), i(2), i(3) }
        )
    ),
    s({ trig = "lemma", },
        fmta(
            [[
            \begin{lemma}{<>}{<>}
                <>
            \end{lemma}
            ]],
            { i(1), i(2), i(3) }
        )
    ),
    s({ trig = "prop", },
        fmta(
            [[
            \begin{proposition}{<>}{<>}
                <>
            \end{proposition}
            ]],
            { i(1), i(2), i(3) }
        )
    ),
    s({ trig = "enum"},
        fmta(
            [[

            \begin{enumerate}[label=(\alph*)]
                \item <>
            \end{enumerate}
            ]],
            { i(1) }
        )
    ),
    s({ trig = "eqn", snippetType = "autosnippet", dscr = "A LaTeX equation environment" },
        fmta(
            [[

            \begin{equation*}
                <>
            \end{equation*}
            ]],
            { i(1) }
        )
    ),
    s({ trig = "env", snippetType = "autosnippet" },
        fmta(
            [[
            \begin{<>}
                <>
            \end{<>}
            ]],
            {
                i(1),
                i(2),
                rep(1),
            },
            { condition = line_begin }
        )
    ),
    s({ trig = "tikzcd", snippetType = "autosnippet" },
        fmta([[
        \begin{equation*}
            \begin{tikzcd}[column sep = normal, row sep = large]
                <>
            \end{tikzcd}
        \end{equation*}
        ]],
            {
                i(1),
            }
        )
    ),
    s({ trig = "examples" },
        fmta([[
        \begin{example}
            \begin{enumerate}[label=(\alph*)]
                \item <>
            \end{enumerate}
        \end{example}
        ]],
            {
                i(1),
            }
        )
    ),

}
