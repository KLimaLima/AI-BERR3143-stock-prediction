$my_data = git branch -v

$my_result = $my_data -match '([\w\W]).+\[gone\]'

$my_result.count

$my_result[0]

$final_data = $my_result[0] -match '([\w-_]+) [\w\d]*'

$Matches[1]