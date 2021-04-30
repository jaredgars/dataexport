
cap program drop es_discrete_levels
program define es_discrete_levels
	syntax varlist, Name(string) 

	foreach var of varlist `varlist' {
		qui local beta = _b[`var']
		qui local out = round( `beta', 0.01)
		qui local out =  "`out'"

		qui local t = _b[`var']/_se[`var']
		qui local pv =2*ttail(e(df_r),abs(`t'))

		qui local pv = round( `pv', 0.001)
		qui local pv = "`pv'"
		
		qui local dep e(depvar) 
		qui sum `dep'  if `var'==0 & e(sample)
		qui local meandep r(mean)
		qui local pc = `beta'/`meandep'
		

		data_export_es `out', name(`name'_`var'_es)
		data_export_es `pv', name(`name'_`var'_pv)
		data_export_es `pc', name(`name'_`var'_pc)


    }
	
end
