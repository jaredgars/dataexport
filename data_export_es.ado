cap program drop data_export_es
program define data_export_es
syntax anything, Name(string) 


loc anything = "`anything'%"
tempname `name'
file open `name' using "$stats/`name'.tex", write text replace
file write `name' "`anything'"
file close `name'

end
