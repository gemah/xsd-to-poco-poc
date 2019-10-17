<# Script for generating C# classes from XML. Due to XML parsing not solving issues regarding dependency with 'xmldsig-core-schema_v1.01', each object will be created with its own namespace. #>

$xsdPath = 'C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.6.1 Tools\xsd.exe'
$i = 1

cd .\model
Get-ChildItem * -Include *.cs -Recurse | Remove-Item
cd ..\schema

Write-Host "Generating POC#O (Plain Old C# Objects) from Schema"
Write-Host "WARNING: This Script currently relies on xsd.exe from Win10 .NET 4.6.1"

Get-ChildItem | Foreach-Object{
    & $xsdPath $_.Name xmldsig-core-schema_v1.01.xsd /c /o:..\model /n:CTe.v$i /l:cs /edb
	$i++
}

cd ..