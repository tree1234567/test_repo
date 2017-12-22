Start-Process "C:\Program Files (x86)\Windows Application Driver\WinAppDriver.exe" -WindowStyle Hidden

$testDLL = '"C:\Users\aamador\Desktop\projects\basketball_reporter_test_suite\STATSBasketballReporterTests\bin\Debug\STATS_BasketBall_Reporter_Tests.dll"'
$fs = New-Object -ComObject Scripting.FileSystemObject
$f = $fs.GetFile("C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\mstest.exe")
$mstestPath = $f.shortpath   
$arguments = " /testcontainer:" + $testDLL + " /test:GameSetup /resultsfile:'C:\Users\aamador\Desktop\test_results.trx'"

Invoke-Expression "$mstestPath $arguments"

Stop-Process -ProcessName WinAppDriver