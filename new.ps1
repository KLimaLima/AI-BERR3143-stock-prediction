param ([Parameter(Mandatory)]$branch_name)

Write-Host "=========================================================="

Write-Host ">> Creating a new branch named $branch_name"
git branch $branch_name

Write-Host "
{\__/}
(o_o)
( >You want branch?
"
Write-Host "=========================================================="
Start-Sleep -Seconds 1.5

Write-Host ">> Moving to branch $branch_name"
# git checkout $branch_name #old way
# git switch -c $branch_name #this creates AND brings current work to new branch
git switch $branch_name #removed -c flag; now only switches to branch
# the reason for removing -c is to split responsibility for clearer code

Write-Host "
   _____________________________
  |                             |
  | Moving to the new branch!!! |
  |_____________________________|
        /
(^o^)/
"
Write-Host "=========================================================="
Start-Sleep -Seconds 1.5

Write-Host ">> Uploading $branch_name to github"
git push -u origin $branch_name

Write-Host "
   _________________________
  |                         |
  | Uploading to GitHub!!!  |
  |_________________________|
            /
(^.^)/~~~
"
Write-Host "=========================================================="
Start-Sleep -Seconds 1.5

Write-Host "
   _____________________________________________________________________
  |                                                                     |
  | okay finished! Here are the current branches in your local machine. |
  | You are at * and green branch, the red branch are in GitHub and     |
  | others are locally in your machine aka laptop.                      |
  |_____________________________________________________________________|
        /
(~^-^)~
"

git branch
Write-Host "=========================================================="
Start-Sleep -Seconds 1.5