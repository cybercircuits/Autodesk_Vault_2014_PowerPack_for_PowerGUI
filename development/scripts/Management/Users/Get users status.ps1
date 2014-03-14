$regex = @'
(.+) лицен(.+) (.+)? для имени пользователя (.+?) код пользователя (.+)? узел (.+)?
'@

select-string -path c:\ProgramData\Autodesk\VaultServer\FileStore\AVFS*.txt -pattern "лиценз" -allmatches –simplematch | foreach-object{if ($_ -match $regex)
  {
  $getStr=$Matches[1]
  if($getStr -like '*олучена*'){$get="Check in"}
  elseif($getStr -like '*ыпуск*'){$get="Check out"}
   $License = $matches[3]
   $Username = $matches[4]
   $UserId = $matches[5]
   $Node = $matches[6]
   $out=$get+"`t"+$License+"`t"+$Username+"`t"+$UserId+"`t"+$Node
   $out
  }}
  
