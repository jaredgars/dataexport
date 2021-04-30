********************************************************************

cap program drop data_export
program define data_export
syntax anything, Name(string) 


cap if `anything' >= 1000 & `anything' < 1000000 {
	*loc valnew = `anything'/1000
	dis regexm("`anything'", "(.*)([0-9][0-9][0-9])$")
	loc anything = regexs(1) + "," + regexs(2) 
	
}

cap else if `anything' > 1000000 {
	*loc valnew = `anything'/1000
	dis regexm("`anything'", "(.*)([0-9][0-9][0-9])$")
	loc anything = regexs(1) + "," + regexs(2) 
	dis regexm("`anything'", "(.*)([0-9][0-9][0-9],[0-9][0-9][0-9])$")
	loc anything = regexs(1) + "," + regexs(2) 
}	




loc anything = "`anything'%"
tempname `name'
file open `name' using "$stats/`name'.tex", write text replace
file write `name' "`anything'"
file close `name'

end

********************************************************************
