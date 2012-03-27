            <p>Paste the data you want to share:</p>
            <form method="post" action="/">
            	Title:<br>
            	<input type="text" size=50 name="title" value="no title"></input><br>
            	Data:<br>
            	<textarea name="content" cols=100 rows=20 autofocus></textarea><br>
            	Format:
            	<select name="format" size="1">
              	 <optgroup label="Top 10">
%selected = False
%for format in top_formats:
%	format = format["format"]
%   format_long = formats_short_to_long[format]
%    if format_default == format and not selected:
            	        <option value="{{format}}" selected>{{format_long}}</option>
% selected = True   
% else:
            	        <option value="{{format}}">{{format_long}}</option>
%    end
%end
</optgroup>
<optgroup label="Top 10">
%for format in formats_long:
%    format_short = formats_long_to_short[format]
%    if format_default == format_short and not selected:
            	        <option value="{{format_short}}" selected>{{format}}</option>
%    else:
            	        <option value="{{format_short}}">{{format}}</option>
%    end
%end
</optgroup>
            	        </select>
            	<br>
            	<input type="submit" value="paste"></input>
            </form>
%rebase base
