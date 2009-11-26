#!/bin/sh


# catalyst.pod
/usr/bin/pod2html --infile catalyst.pod -css http://st.pimg.net/tucs/style.css --outfile catalyst.html --title "Catalyst: Iniciando" 

/usr/bin/pod2text catalyst.pod  > catalyst.txt
/bin/sed -i "s/charset=utf-8/charset=iso-8859-1/" catalyst.html

# catalyst_formfu.pod
/usr/bin/pod2html --infile catalyst_formfu.pod -css http://st.pimg.net/tucs/style.css --outfile catalyst_formfu.html --title "Catalyst: HTML::FormFu" 

/usr/bin/pod2text catalyst_formfu.pod  > catalyst_formfu.txt
/bin/sed -i "s/charset=utf-8/charset=iso-8859-1/" catalyst_formfu.html


# remove *tmp
rm *tmp

