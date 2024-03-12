declare variable $value external;

for $k in doc("weathIconsDB.xml")/*//entry
where $k/keys[text()=normalize-space($value)]
return $k/values/text()

