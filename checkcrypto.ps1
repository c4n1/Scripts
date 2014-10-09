$Drive = "C:\Test"

#Clean paths from get child item as it adds crap
function cleanpath ($path) {
	$path2 = $path -replace ".$"
	$path3 = $path2.substring(11)
	return $path3
}

#Return true or false if the folder contains .encrypted files
function checkencfiles ($folder){
	$hasencrypted = @()
	$hasencrypted += @(get-childitem $folder -filter “*.encrypted” | %{$_.Name})
	if ($hasencrypted -like "*encrypted*"){
        $answer = "false"}
	else {
		$answer = "true" }
return $answer
}


#return true or false if all subfolders contain .encrypted files
function checkifall ($folder){
    #Create arrays and get list of clean subfolders
	$subfoldersdirty = @()
	$subfolders = @()
	$subfoldersdirty  = Get-ChildItem $folder -recurse | ?{$_.PSIsContainer} | Select-Object FullName
	foreach ($sub in $subfoldersdirty){
		$sub2 = cleanpath $sub
		$subfolders += $sub2
	}
    #Set counts var so we can enumerate how many folders return true
	$counts = 0
    #If no subfolders check current folder for files
	if ($subfolders.length -eq 0 ) {
        $folder
        $answer = checkencfiles $folder
        if ($answer = "true") {
            return "triangles"
            break;
         }
    }
    #If subfolders check each of them for files and incriment counts by 1 if return true
	else {
		foreach ($sub in $subfolders) {
			$hasenc = checkencfiles $sub
			if ($hasenc = "true") {
				$counts = $counts + 1
            }
	    }
	 }
    #if count of trues and number of subfolders are the same return true
    if ($counts -eq $subfolders.length){
        return "true"
    }
    #else return false
    else {
        return "false"
    }
}

#enumerate drive and clean
$wholedrivedirty = Get-ChildItem $drive -recurse | ?{$_.PSIsContainer} | Select-Object FullName
$wholedrive = @()
foreach ($drive in $wholedrivedirty){
	$drive = cleanpath $drive
	$wholedrive += $drive
}

#function to move up one folder
function folderup ($folder){
	$folder = $folder -replace "\\[^\\]*$"
	return $folder
}

$result = @()
foreach ($drive in $wholedrive) {
	"checking $drive"
	$check = checkifall $drive
	$check
	if ($check = "true") {
		$upfolder = folderup $drive
		if ($result -notcontains $upfolder) { 
			$result += $drive
		}
	}
}

"result"
$result
		
		

