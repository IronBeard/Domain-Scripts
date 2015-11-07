<#
.SYNOPSIS
    Copies all of the items in the supplied directory list to the target location.
.DESCRIPTION
    .
.NOTES
    File Name      : CopyAll.ps1
    Author         : Gareth Philpott
    Date           : 26/10/2015
    Prerequisite   : PowerShell V2 over Vista and upper.
    Copyright 2015 - Gareth Philpott
.EXAMPLE
    CopyAll
.LINK
 
#>

# Using the Copy-Item Cmdlet 
# https://technet.microsoft.com/en-us/library/ee156818.aspx?f=255&MSPPError=-2147217396
# Use PowerShell to Copy Files and Folders to a New Location
# http://blogs.technet.com/b/heyscriptingguy/archive/2013/04/19/use-powershell-to-copy-files-and-folders-to-a-new-location.aspx

$destination = "F:\"

# Need to add a parameter so that the directory list can be sent as a parameter instead of hard coded.
$myArray =  "\\Dionysus\video\TV\- To Watch -\Anime\Hyper Police\",
            "\\Dionysus\video\TV\- To Watch -\Anime\Sorcerous Stabber Orphen\",
            "\\Dionysus\video\TV\- To Watch -\Cartoons\Eek\",
            "\\Dionysus\video\TV\- To Watch -\Cartoons\Robot Chicken\",
            "\\Dionysus\video\TV\- To Watch -\TV Series\Automan\",
            "\\Dionysus\video\TV\- To Watch -\TV Series\Brimstone\",
            "\\Dionysus\video\TV\- To Watch -\TV Series\Jonathan Creek\",
            "\\Dionysus\video\TV\- To Watch -\TV Series\Lewis\",
            "\\Dionysus\video\TV\- To Watch -\TV Series\Odyssey 5\",
            "\\Dionysus\video\TV\- To Watch -\TV Series\Parker Lewis - Cant Lose\",
            "\\Dionysus\video\TV\- To Watch -\TV Series\Profit\",
            "\\Dionysus\video\TV\- To Watch -\TV Series\Sabrina The Teenage Witch\",
            "\\Dionysus\video\TV\- To Watch -\TV Series\Seven Days\",
            "\\Dionysus\video\TV\- To Watch -\TV Series\The Highwayman\",
            "\\Dionysus\video\TV\Anime\Golgo 13",
            "\\Dionysus\video\TV\Anime\Panty & Stocking with Garterbelt\",
            "\\Dionysus\video\TV\Cartoons\Futurama\Season 6\",
            "\\Dionysus\video\TV\Cartoons\Futurama\Season 7\",
            "\\Dionysus\video\TV\Cartoons\Rick and Morty\",
            "\\Dionysus\video\TV\Cartoons\The Simpsons\Season 07\",
            "\\Dionysus\video\TV\Cartoons\The Simpsons\Season 08\",
            "\\Dionysus\video\TV\Cartoons\The Simpsons\Season 12\",
            "\\Dionysus\video\TV\Cartoons\The Simpsons\Season 13\",
            "\\Dionysus\video\TV\Cartoons\The Simpsons\Season 14\",
            "\\Dionysus\video\TV\Cartoons\The Simpsons\Season 15\",
            "\\Dionysus\video\TV\Cartoons\The Simpsons\Season 16\",
            "\\Dionysus\video\TV\Cartoons\The Simpsons\Season 17\",
            "\\Dionysus\video\TV\Cartoons\The Simpsons\Season 18\",
            "\\Dionysus\video\TV\Cartoons\The Simpsons\Season 19\",
            "\\Dionysus\video\TV\Cartoons\The Simpsons\Season 20\",
            "\\Dionysus\video\TV\Cartoons\The Simpsons\Season 21\",
            "\\Dionysus\video\TV\Cartoons\The Simpsons\Season 22\",
            "\\Dionysus\video\TV\Cartoons\The Simpsons\Season 23\",
            "\\Dionysus\video\TV\Cartoons\The Simpsons\Season 24\",
            "\\Dionysus\video\TV\Cartoons\The Simpsons\Season 25\",
            "\\Dionysus\video\TV\TV Series\Whose Line is it Anyway\"

Copy-Item $myArray $destination -recurse