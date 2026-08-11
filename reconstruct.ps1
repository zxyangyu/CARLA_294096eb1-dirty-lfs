$ErrorActionPreference = "Stop"

$fileName = "CARLA_294096eb1-dirty.tar.gz"
$expectedHash = "739688863a43993334877f28d5be8af90197cbb13c50df3c4e5356dc657b7c35"
$outputPath = Join-Path $PSScriptRoot $fileName
$parts = Get-ChildItem -LiteralPath $PSScriptRoot -Filter "$fileName.part-*" | Sort-Object Name

if ($parts.Count -ne 297) {
    throw "Expected 297 parts, found $($parts.Count). Run 'git lfs pull' and try again."
}

$output = [System.IO.File]::Create($outputPath)
try {
    foreach ($part in $parts) {
        $input = [System.IO.File]::OpenRead($part.FullName)
        try {
            $input.CopyTo($output)
        }
        finally {
            $input.Dispose()
        }
    }
}
finally {
    $output.Dispose()
}

$actualHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $outputPath).Hash.ToLowerInvariant()
if ($actualHash -ne $expectedHash) {
    throw "SHA-256 mismatch: expected $expectedHash, got $actualHash"
}

Write-Host "SHA-256 verified: $outputPath"
