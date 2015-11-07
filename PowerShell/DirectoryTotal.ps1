<#
.SYNOPSIS
    Returns the total size in MB of the entered directories.
.DESCRIPTION
    Totals the supplied directories and returns the result, handy when there are multiple paths to be totaled.
.NOTES
    File Name      : DirectoryTotal.ps1
    Author         : Gareth Philpott
    Date           : 26/10/2015
    Prerequisite   : PowerShell V2 over Vista and upper.
    Copyright 2015 - Gareth Philpott
.EXAMPLE
    DirectoryTotal
.LINK
 
#>

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

$colItems = (Get-ChildItem $myArray -recurse | Measure-Object -property length -sum)
"{0:N2}" -f ($colItems.sum / 1MB) + " MB"
"{0:N2}" -f ($colItems.sum / 1GB) + " GB"