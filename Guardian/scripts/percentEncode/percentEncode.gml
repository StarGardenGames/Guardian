/// @desc This returns a percent encdoed version of a string, useful for sending get requests
/// @param str string to percent encode
// More Info: https://en.wikipedia.org/wiki/Percent-encoding
// Useful tool: https://cryptii.com/pipes/urlencode

var str = argument0;

/*
!	#	$	%	&	'	(	)	*	+	,	/	:	;	=	?	@	[	]
%21	%23	%24	%25	%26	%27	%28	%29	%2A	%2B	%2C	%2F	%3A	%3B	%3D	%3F	%40	%5B	%5D
*/
str = string_replace(str, "!", "%21")
str = string_replace(str, "#", "%23")
str = string_replace(str, "$", "%24")
str = string_replace(str, "%", "%25")
str = string_replace(str, "&", "%26")
str = string_replace(str, "'", "%27")
str = string_replace(str, "(", "%28")
str = string_replace(str, ")", "%29")
str = string_replace(str, "*", "%2A")
str = string_replace(str, "+", "%2B")
str = string_replace(str, ",", "%2C")
str = string_replace(str, "/", "%2F")
str = string_replace(str, ":", "%3A")
str = string_replace(str, ";", "%3B")
str = string_replace(str, "=", "%3D")
str = string_replace(str, "?", "%3F")
str = string_replace(str, "@", "%40")
str = string_replace(str, "[", "%5B")
str = string_replace(str, "]", "%5D")

/*
newline	space	"	%	-	.	<	>	\	^	_	`	{	|	}	~	£	円
%0A or %0D or %0D%0A	%20	%22	%25	%2D	%2E	%3C	%3E	%5C	%5E	%5F	%60	%7B	%7C	%7D	%7E	%C2%A3	%E5%86%86
*/
/*
newline	space	"	%	-	.	<	>	\	^	_	`	{	|	}	~	£	円
         %20	%22	%25	%2D	%2E	%3C	%3E	%5C	%5E	%5F	%60	%7B	%7C	%7D	%7E	%C2%A3	%E5%86%86
*/
str = string_replace(str, "\n", "%0A")
str = string_replace(str, " ", "%20")
str = string_replace(str, "\"", "%22")
str = string_replace(str, "%", "%25")
str = string_replace(str, "-", "%2D")
str = string_replace(str, ".", "%2E")
str = string_replace(str, "<", "%3C")
str = string_replace(str, ">", "%3E")
str = string_replace(str, "\\", "%5C")
str = string_replace(str, "^", "%5E")
str = string_replace(str, "_", "%5F")
str = string_replace(str, "`", "%60")
str = string_replace(str, "{", "%7B")
str = string_replace(str, "|", "%7C")
str = string_replace(str, "}", "%7D")
str = string_replace(str, "~", "%7E")

return str