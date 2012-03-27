% if title != "no title":
	<br><h2>{{title}}</h2>	
% end
{{! content_html}}
<a href="{{key}}/raw">raw data</a>
<hr>
            <p>Paste the data you want to share:</p>
            <form method="post" action="/">
            	Title:<br>
            	<input type="text" size=50 name="title" value="{{title}}"></input><br>
            	Data:<br>
            	<textarea name="content" cols=100 rows=20 autofocus>{{content}}</textarea><br>
            	Format:
            	<select name="format" size="1">
%for format in formats_long:
%    format_short = formats_long_to_short[format]
%    if format_used == format_short:
            	        <option value="{{format_short}}" selected>{{format}}</option>
%    else:
            	        <option value="{{format_short}}">{{format}}</option>
%    end
%end
            	        </select>
            	<br>
            	<input type="submit" value="paste"></input>
            </form>
            <p>Back to <a href="/">Index</a></p>
%if title != "no title":
%rebase base title = title
%else:
%rebase base
%end
