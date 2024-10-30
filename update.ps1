Write-Host "=========================================================="
Write-Host ">> Getting updates from GitHub"
git fetch --all --prune
git pull

Write-Host "
   _________________________________
  |                                 |
  | Getting updates from GitHub!!!  |
  |_________________________________|
            /
(^.^)/~~~
"

Write-Host "=========================================================="
Start-Sleep -Seconds 1.5

Write-Host ">> Finished updating"

Write-Host "
   _________________________________
  |                                 |
  | Here you go. Now suffer.        |
  |_________________________________|
            /
{\__/}
(o_o)
( >(That shit code you made)
"

Write-Host "=========================================================="
Start-Sleep -Seconds 1.5

$my_data = git branch -v

$my_result = $my_data -match '([\w\W]).+\[gone\]'

# $my_result.count

# $my_result[0]

# $my_result[0] -match '([\w-_]+) [\w\d]*'

# $Matches[1]

foreach ($final_result in $my_result) {
   <# $my_result is the current item #>
   $final_result -match '([\w-_]+) [\w\d]*'
   Write-Host "Deleting this"
   $Matches[1]
   git branch -d $Matches[1]
}