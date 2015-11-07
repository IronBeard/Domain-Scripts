<#
.SYNOPSIS
    .
.DESCRIPTION
    Renames MP3 file using the attributes.
.NOTES
    File Name      : RenameMP3.ps1
    Author         : Gareth Philpott
    Date           : 06/11/2015
    Prerequisite   : PowerShell V2 over Vista and upper.
    Copyright 2015 - Gareth Philpott
.EXAMPLE
    RenameMP3
.LINK
 
#>

#Import-Module Y:\Utilities\MPTag

$media = Get-MediaInfo "W:\Bad Boys\01 - Bad Boys - Diana King - Shy Guy.mp3";

Write-Output $media.Tag.Track;
Write-Output $media.Tag.Artists;
Write-Output $media.Tag.Album;
Write-Output $media.Tag.Title;

$NewAlbum = $media.Tag.Album
$Artists = $media.Tag.Artists
$DiscNumber = $media.Tag.Disc
$Title = $media.Tag.Title;
$TrackNumber = $media.Tag.Track;

if ($DiscNumber.Length -eq 1) {$DiscNumber="0"+$DiscNumber}
if ($TrackNumber.Length -eq 1) {$TrackNumber="0"+$TrackNumber}


Write-Output "Track $TrackNumber";
Write-Output "$TrackNumber - $NewAlbum - $Artists - $Title";
