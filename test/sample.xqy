xquery version "1.0-ml";

module namespace sample = "sample";

declare function s1() as xs:string
{
	xdmp:value("eval and value are nasty")
};

declare function s2() (: as xs:string :)
{
	"no return type"	
};

declare function s3($foo, $bar as xs:string)
{
	"missing param type"
};

declare function s4($foo as element())
{
	$foo//some/path	
};
