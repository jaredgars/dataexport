cap program drop es_continuous
program define es_continuous
	syntax varlist,  Name(string) 

	foreach var of varlist `varlist' {
		qui local beta = _b[`var']
		qui sum `var' if e(sample)
		qui local sd = r(sd)
		qui local sd = r(sd)
		qui local t = _b[`var']/_se[`var']
		qui local pv =2*ttail(e(df_r),abs(`t'))


		qui local effect = abs(`sd'*`beta')
		qui local out = round( `effect', 0.01)*100
		qui local out =  "`out'"

		qui local sd = round( `sd', 0.1)
		qui local sd = "`sd'"
		qui local pv = round( `pv', 0.0001)
		qui local pv = "`pv'"

		data_export_es `out', name(`name'_`var'_es)
		data_export_es `sd', name(`name'_`var'_sd)
		data_export_es `pv', name(`name'_`var'_pv)
	}
end
