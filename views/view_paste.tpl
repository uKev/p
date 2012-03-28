% if title != "no title":
	<br><h2>{{title}}</h2>	
% end
{{! content_html}}
 <form method="post" action="/{{key}}/d"><a href="{{key}}/raw">raw data</a> | 
	<input type="text" size=2 name="diffkey" placeholder="id"></input> <input type="submit" value="diff"></input></form>
</form>
<hr>
            <p>Paste the data you want to share:</p>
            <form method="post" action="/">
            	Title:<br>
            	<input type="text" size=50 name="title" value="{{title}}"></input><br>
            	Data:<br>
            	<textarea name="content" cols=100 rows=20 autofocus>{{content}}</textarea><br>
            	Format:
            	<select name="format" size="1">

            	 <optgroup label="Top 10">
%selected = False
%for format in top_formats:
%	format = format["format"]
%   format_long = formats_short_to_long[format]
%    if format_used == format and not selected:
            	        <option value="{{format}}" selected>{{format_long}}</option>
            	        % selected = True
%    else:
            	        <option value="{{format}}">{{format_long}}</option>
%    end
%end
</optgroup>
<optgroup label="Alle">

%for format in formats_long:
%    format_short = formats_long_to_short[format]
%    if format_used == format_short and not selected:
            	        <option value="{{format_short}}" selected>{{format}}</option>
            	        % selected = True
%    else:
            	        <option value="{{format_short}}">{{format}}</option>
%    end
%end
</optgroup>
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
