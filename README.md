# utf8-escape

Command line program to escape utf8-characters. Default format is `html`;
available is also `latex`.

	$ echo "äöüß" | utf8-escape 
	&auml&oumlu&szlig

	
	$ echo "%&" | utf8-escape  -t latex
	\%\&
