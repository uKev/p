<!DOCTYPE html>
    <html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            % if defined('title'):
            <title>{{title}} - on p - the paste-Service</title>
            % else:
            <title>p - the paste-Service</title>
            % end
            % bg_color = "#eee"
            % border_color = "#ddd"
            % border = "1px solid #ddd"
            <style type="text/css">
              html {background-color: #eee; font-family: sans;}
              body {background-color: #fff; border: 1px solid #ddd; padding: 15px; margin: 15px; }
              pre {background-color: #eee; border: 1px solid #ddd; padding: 5px; line-height: 1.3em;}

            .source .hll { background-color: #ffffcc }
            .source .c { color: #408080; font-style: italic } /* Comment */
            .source .err { border: 1px solid #FF0000 } /* Error */
            .source .k { color: #008000; font-weight: bold } /* Keyword */
            .source .o { color: #666666 } /* Operator */
            .source .cm { color: #408080; font-style: italic } /* Comment.Multiline */
            .source .cp { color: #BC7A00 } /* Comment.Preproc */
            .source .c1 { color: #408080; font-style: italic } /* Comment.Single */
            .source .cs { color: #408080; font-style: italic } /* Comment.Special */
            .source .gd { color: #A00000 } /* Generic.Deleted */
            .source .ge { font-style: italic } /* Generic.Emph */
            .source .gr { color: #FF0000 } /* Generic.Error */
            .source .gh { color: #000080; font-weight: bold } /* Generic.Heading */
            .source .gi { color: #00A000 } /* Generic.Inserted */
            .source .go { color: #808080 } /* Generic.Output */
            .source .gp { color: #000080; font-weight: bold } /* Generic.Prompt */
            .source .gs { font-weight: bold } /* Generic.Strong */
            .source .gu { color: #800080; font-weight: bold } /* Generic.Subheading */
            .source .gt { color: #0040D0 } /* Generic.Traceback */
            .source .kc { color: #008000; font-weight: bold } /* Keyword.Constant */
            .source .kd { color: #008000; font-weight: bold } /* Keyword.Declaration */
            .source .kn { color: #008000; font-weight: bold } /* Keyword.Namespace */
            .source .kp { color: #008000 } /* Keyword.Pseudo */
            .source .kr { color: #008000; font-weight: bold } /* Keyword.Reserved */
            .source .kt { color: #B00040 } /* Keyword.Type */
            .source .m { color: #666666 } /* Literal.Number */
            .source .s { color: #BA2121 } /* Literal.String */
            .source .na { color: #7D9029 } /* Name.Attribute */
            .source .nb { color: #008000 } /* Name.Builtin */
            .source .nc { color: #0000FF; font-weight: bold } /* Name.Class */
            .source .no { color: #880000 } /* Name.Constant */
            .source .nd { color: #AA22FF } /* Name.Decorator */
            .source .ni { color: #999999; font-weight: bold } /* Name.Entity */
            .source .ne { color: #D2413A; font-weight: bold } /* Name.Exception */
            .source .nf { color: #0000FF } /* Name.Function */
            .source .nl { color: #A0A000 } /* Name.Label */
            .source .nn { color: #0000FF; font-weight: bold } /* Name.Namespace */
            .source .nt { color: #008000; font-weight: bold } /* Name.Tag */
            .source .nv { color: #19177C } /* Name.Variable */
            .source .ow { color: #AA22FF; font-weight: bold } /* Operator.Word */
            .source .w { color: #bbbbbb } /* Text.Whitespace */
            .source .mf { color: #666666 } /* Literal.Number.Float */
            .source .mh { color: #666666 } /* Literal.Number.Hex */
            .source .mi { color: #666666 } /* Literal.Number.Integer */
            .source .mo { color: #666666 } /* Literal.Number.Oct */
            .source .sb { color: #BA2121 } /* Literal.String.Backtick */
            .source .sc { color: #BA2121 } /* Literal.String.Char */
            .source .sd { color: #BA2121; font-style: italic } /* Literal.String.Doc */
            .source .s2 { color: #BA2121 } /* Literal.String.Double */
            .source .se { color: #BB6622; font-weight: bold } /* Literal.String.Escape */
            .source .sh { color: #BA2121 } /* Literal.String.Heredoc */
            .source .si { color: #BB6688; font-weight: bold } /* Literal.String.Interpol */
            .source .sx { color: #008000 } /* Literal.String.Other */
            .source .sr { color: #BB6688 } /* Literal.String.Regex */
            .source .s1 { color: #BA2121 } /* Literal.String.Single */
            .source .ss { color: #19177C } /* Literal.String.Symbol */
            .source .bp { color: #008000 } /* Name.Builtin.Pseudo */
            .source .vc { color: #19177C } /* Name.Variable.Class */
            .source .vg { color: #19177C } /* Name.Variable.Global */
            .source .vi { color: #19177C } /* Name.Variable.Instance */
            .source .il { color: #666666 } /* Literal.Number.Integer.Long */
           
	        table.diff {font-family:monospace; border-style:none;font-size: smaller; border-collapse: separate; border-spacing: 0.3em 0em}
	        
	        td.diff_header {text-align:right}
	        
	        table.diff tr { border: none;}
	        table.diff th { border: none;}
	        table.diff th.diff_next { border: none;}
	        table.diff thead { border: none;}
	        
	        table.diff tbody { border: none;}
	        table.diff colgroup { border: none;}
	        table.diff td {vertical-align: top; padding: 0.2em; background-color: {{bg_color}}; border-right: {{border}}; border-left: {{border}};}
	        table.diff tr:first-child td {border-top: {{border}};}
	        table.diff tr:last-child td {border-bottom: {{border}};}
	        
	        
	        table.diff tr:first-child td.diff_next {border-top: none;}
	        table.diff tr:last-child td.diff_next {border-bottom: none;}
	        
	        table.diff td.diff_next {background-color:#ffffff; border: none}
	        table.diff td.diff_header {padding-right: 1em;}
	        .diff_add {background-color:#aaffaa}
	        .diff_chg {background-color:#ffff77}
	        .diff_sub {background-color:#ffaaaa}

            </style>
            <link rel="shortcut icon" href="/static/favicon.ico">
        </head>
        <body>
            <h1>Hello, Welcome to the great, small and fast paste-Service <i>p</i></h1>
            <p><strong>Warning:</strong> <i>p</i> is highly experimental. Use it only for non important stuff. It might eat your pets and children.</p>
            <p>
            %include
        </body>
    </html>
