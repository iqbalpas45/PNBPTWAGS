# ============================================================================
# Portal Rekapitulasi TWA GS - Monitoring Script
# Monitor Vercel Deployment & Supabase Database Status
# ============================================================================

# Set console encoding
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Color functions
function Write-Success {
    param([string]$message)
    Write-Host "✅ $message" -ForegroundColor Green
}

function Write-Error {
    param([string]$message)
    Write-Host "❌ $message" -ForegroundColor Red
}

function Write-Warning {
    param([string]$message)
    Write-Host "⚠️  $message" -ForegroundColor Yellow
}

function Write-Info {
    param([string]$message)
    Write-Host "ℹ️  $message" -ForegroundColor Cyan
}

function Write-Header {
    param([string]$message)
    Write-Host "`n═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host "  $message" -ForegroundColor Cyan
    Write-Host "═══════════════════════════════════════════════════════════════`n" -ForegroundColor Cyan
}

# ============================================================================
# 1. CHECK VERCEL DEPLOYMENT STATUS
# ============================================================================

function Test-VercelDeployment {
    Write-Header "VERCEL DEPLOYMENT STATUS"

    $vercelUrl = "https://pnbptwags.vercel.app/app.html"
    $customDomainUrl = "https://firesky.my.id/app.html"

    Write-Info "Testing Vercel deployment: $vercelUrl"

    try {
        $response = Invoke-WebRequest -Uri $vercelUrl -TimeoutSec 10 -UseBasicParsing -ErrorAction Stop
        $statusCode = $response.StatusCode
        $responseTime = $response.BaseResponse.Headers.Date

        if ($statusCode -eq 200) {
            Write-Success "Vercel deployment is ONLINE (Status: $statusCode)"
            Write-Info "Response Time: ~${responseTime}ms"
        } else {
            Write-Warning "Vercel returned status code: $statusCode"
        }

        # Check if page contains expected content
        if ($response.Content -match "Portal Rekapitulasi") {
            Write-Success "Page content verified - Application loaded correctly"
        } else {
            Write-Warning "Page content may not be fully loaded"
        }

    } catch {
        Write-Error "Failed to connect to Vercel: $_"
        return $false
    }

    # Test custom domain
    Write-Info "`nTesting custom domain: $customDomainUrl"
    try {
        $response = Invoke-WebRequest -Uri $customDomainUrl -TimeoutSec 10 -UseBasicParsing -ErrorAction Stop
        if ($response.StatusCode -eq 200) {
            Write-Success "Custom domain is ONLINE and working!"
        }
    } catch {
        Write-Warning "Custom domain not yet propagated or unreachable"
    }

    return $true
}

# ============================================================================
# 2. CHECK SUPABASE CONNECTION
# ============================================================================

function Test-SupabaseConnection {
    Write-Header "SUPABASE DATABASE STATUS"

    $supabaseUrl = "https://ydngshcjcrkjerwztibjo.supabase.co"
    $supabaseApiUrl = "$supabaseUrl/rest/v1/"

    Write-Info "Testing Supabase connection: $supabaseUrl"

    try {
        $response = Invoke-WebRequest -Uri $supabaseUrl -TimeoutSec 10 -UseBasicParsing -ErrorAction Stop
        Write-Success "Supabase server is ONLINE"

    } catch {
        Write-Error "Supabase server connection failed: $_"
        return $false
    }

    # Try to ping the REST API
    Write-Info "Testing Supabase REST API endpoint..."
    try {
        $headers = @{
            "apikey" = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlkbmdzaGpjcmprZXJ3enRpYmpvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODkyNDgxNjMsImV4cCI6MjEwNDgyNDE2M30.nCkqru3ktp4_OkQBXh59iWDFS8SYL79tjoZsIl23v1o"
        }

        $response = Invoke-WebRequest -Uri "${supabaseApiUrl}transaksiHarian?limit=1" `
            -Headers $headers `
            -TimeoutSec 10 `
            -UseBasicParsing `
            -ErrorAction Stop

        Write-Success "Supabase REST API is responding correctly"
        Write-Info "Response: $($response.StatusCode)"

    } catch {
        Write-Warning "Supabase REST API test failed (this may be normal if table is empty): $_"
    }

    return $true
}

# ============================================================================
# 3. CHECK GITHUB REPOSITORY STATUS
# ============================================================================

function Test-GitHubStatus {
    Write-Header "GITHUB REPOSITORY STATUS"

    $repoUrl = "https://github.com/iqbalpas45/PNBPTWAGS"
    $apiUrl = "https://api.github.com/repos/iqbalpas45/PNBPTWAGS"

    Write-Info "Checking repository: $repoUrl"

    try {
        $response = Invoke-RestMethod -Uri $apiUrl -TimeoutSec 10

        Write-Success "Repository is accessible"
        Write-Info "Repo Name: $($response.name)"
        Write-Info "Default Branch: $($response.default_branch)"
        Write-Info "Last Updated: $($response.updated_at)"
        Write-Info "Commits: $($response.forks_count)"

    } catch {
        Write-Error "Failed to access GitHub API: $_"
        return $false
    }

    return $true
}

# ============================================================================
# 4. LOCAL GIT STATUS
# ============================================================================

function Test-LocalGitStatus {
    Write-Header "LOCAL GIT REPOSITORY STATUS"

    $gitPath = "C:\Users\Asus\PNBPTWAGS-Deploy"

    if (-not (Test-Path $gitPath)) {
        Write-Error "Repository path not found: $gitPath"
        return $false
    }

    Set-Location $gitPath

    Write-Info "Checking repository at: $gitPath"

    try {
        # Get current branch
        $branch = git rev-parse --abbrev-ref HEAD
        Write-Success "Current Branch: $branch"

        # Get last commit
        $lastCommit = git log -1 --pretty=format:"%h - %s (%ar)"
        Write-Info "Last Commit: $lastCommit"

        # Check status
        $status = git status --porcelain
        if ([string]::IsNullOrWhiteSpace($status)) {
            Write-Success "Working tree is clean (all changes committed)"
        } else {
            Write-Warning "Uncommitted changes detected:"
            Write-Host $status -ForegroundColor Yellow
        }

        # Get remote info
        $remote = git remote get-url origin
        Write-Info "Remote URL: $remote"

    } catch {
        Write-Error "Git command failed: $_"
        return $false
    }

    return $true
}

# ============================================================================
# 5. CHECK FILE INTEGRITY
# ============================================================================

function Test-FileIntegrity {
    Write-Header "FILE INTEGRITY CHECK"

    $baseDir = "C:\Users\Asus\PNBPTWAGS-Deploy"

    $filesToCheck = @(
        "app.html",
        "vercel.json",
        "PANDUAN_PENGGUNAAN.md",
        "SCRIPT_VIDEO.md",
        "QUICK_REFERENCE.txt"
    )

    Write-Info "Checking critical files..."

    foreach ($file in $filesToCheck) {
        $filePath = Join-Path $baseDir $file

        if (Test-Path $filePath) {
            $fileInfo = Get-Item $filePath
            $sizeKB = [math]::Round($fileInfo.Length / 1KB, 2)
            Write-Success "$file exists (Size: ${sizeKB} KB)"
        } else {
            Write-Error "$file NOT FOUND"
        }
    }

    return $true
}

# ============================================================================
# 6. SYSTEM DIAGNOSTICS
# ============================================================================

function Test-SystemDiagnostics {
    Write-Header "SYSTEM DIAGNOSTICS"

    Write-Info "PowerShell Version: $($PSVersionTable.PSVersion)"
    Write-Info "OS: $([System.Environment]::OSVersion)"
    Write-Info "Current User: $([System.Environment]::UserName)"

    # Check internet connectivity
    Write-Info "`nTesting internet connectivity..."
    try {
        $ping = Test-Connection -ComputerName 8.8.8.8 -Count 1 -ErrorAction Stop
        Write-Success "Internet connection: OK (Ping: $($ping.ResponseTime)ms)"
    } catch {
        Write-Error "Internet connection: FAILED"
    }

    # Check DNS
    Write-Info "`nTesting DNS resolution..."
    try {
        $dns = Resolve-DnsName -Name "pnbptwags.vercel.app" -ErrorAction Stop
        Write-Success "DNS Resolution: OK (IP: $($dns.IPAddress))"
    } catch {
        Write-Warning "DNS Resolution failed: $_"
    }
}

# ============================================================================
# 7. PERFORMANCE MONITORING
# ============================================================================

function Monitor-PerformanceMetrics {
    Write-Header "PERFORMANCE METRICS"

    $vercelUrl = "https://pnbptwags.vercel.app/app.html"

    Write-Info "Testing response times (5 requests)..."
    Write-Info "================================================`n"

    $times = @()

    for ($i = 1; $i -le 5; $i++) {
        try {
            $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
            $response = Invoke-WebRequest -Uri $vercelUrl -TimeoutSec 10 -UseBasicParsing -ErrorAction Stop
            $stopwatch.Stop()

            $responseTime = $stopwatch.ElapsedMilliseconds
            $times += $responseTime

            Write-Info "Request $i : ${responseTime}ms [Status: $($response.StatusCode)]"

        } catch {
            Write-Error "Request $i : FAILED"
        }
    }

    if ($times.Count -gt 0) {
        $avgTime = [math]::Round(($times | Measure-Object -Average).Average, 2)
        $minTime = ($times | Measure-Object -Minimum).Minimum
        $maxTime = ($times | Measure-Object -Maximum).Maximum

        Write-Info "`n================================================"
        Write-Success "Average Response Time: ${avgTime}ms"
        Write-Info "Min Response Time: ${minTime}ms"
        Write-Info "Max Response Time: ${maxTime}ms"

        if ($avgTime -lt 500) {
            Write-Success "Performance: EXCELLENT (< 500ms)"
        } elseif ($avgTime -lt 1000) {
            Write-Info "Performance: GOOD (500-1000ms)"
        } else {
            Write-Warning "Performance: SLOW (> 1000ms)"
        }
    }
}

# ============================================================================
# 8. GENERATE DETAILED REPORT
# ============================================================================

function Generate-DetailedReport {
    Write-Header "GENERATING DETAILED REPORT"

    $reportFile = "$env:USERPROFILE\Desktop\PNBPTWAGS_Monitor_Report_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"

    Write-Info "Saving report to: $reportFile"

    $reportContent = @"
╔═════════════════════════════════════════════════════════════════════════════╗
║     PORTAL REKAPITULASI TWA GS - MONITORING REPORT                         ║
║     Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
╚═════════════════════════════════════════════════════════════════════════════╝

VERCEL DEPLOYMENT
─────────────────────────────────────────────────────────────────────────────
URL: https://pnbptwags.vercel.app/app.html
Custom Domain: https://firesky.my.id/app.html
GitHub: https://github.com/iqbalpas45/PNBPTWAGS

SUPABASE DATABASE
─────────────────────────────────────────────────────────────────────────────
Project URL: https://ydngshcjcrkjerwztibjo.supabase.co
Database: transaksiHarian

LOCAL REPOSITORY
─────────────────────────────────────────────────────────────────────────────
Path: C:\Users\Asus\PNBPTWAGS-Deploy
Branch: main

SYSTEM INFO
─────────────────────────────────────────────────────────────────────────────
PowerShell: $($PSVersionTable.PSVersion)
OS: $([System.Environment]::OSVersion)
User: $([System.Environment]::UserName)

TIMESTAMP: $(Get-Date)
"@

    $reportContent | Out-File -FilePath $reportFile -Encoding UTF8
    Write-Success "Report saved: $reportFile"

    # Open report
    try {
        Invoke-Item $reportFile
    } catch {
        Write-Info "Could not open report automatically"
    }
}

# ============================================================================
# MAIN EXECUTION
# ============================================================================

function Start-FullMonitoring {
    param(
        [switch]$Quick,
        [switch]$Detailed,
        [switch]$ContinuousMonitor
    )

    Clear-Host

    Write-Host "
    ╔════════════════════════════════════════════════════════════════════╗
    ║   PORTAL REKAPITULASI TWA GS - MONITORING DASHBOARD               ║
    ║   Monitoring Vercel Deployment & Supabase Database Status         ║
    ╚════════════════════════════════════════════════════════════════════╝
    " -ForegroundColor Cyan

    if ($Quick) {
        Write-Info "Running QUICK monitoring..."
        Test-VercelDeployment
        Test-SupabaseConnection
    }
    elseif ($Detailed) {
        Write-Info "Running DETAILED monitoring..."
        Test-VercelDeployment
        Test-SupabaseConnection
        Test-GitHubStatus
        Test-LocalGitStatus
        Test-FileIntegrity
        Test-SystemDiagnostics
        Monitor-PerformanceMetrics
        Generate-DetailedReport
    }
    elseif ($ContinuousMonitor) {
        Write-Info "Starting CONTINUOUS monitoring (Press Ctrl+C to stop)..."
        $counter = 1
        while ($true) {
            Write-Host "`n[Check #$counter] $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" -ForegroundColor Magenta
            Test-VercelDeployment | Out-Null
            Write-Info "Next check in 5 minutes..."
            Start-Sleep -Seconds 300
            $counter++
        }
    }
    else {
        # Default: Standard monitoring
        Test-VercelDeployment
        Test-SupabaseConnection
        Test-GitHubStatus
        Test-LocalGitStatus
        Test-FileIntegrity
        Test-SystemDiagnostics
    }

    Write-Header "MONITORING COMPLETE"
    Write-Info "Report generated at: $(Get-Date)"
}

# ============================================================================
# RUN SCRIPT
# ============================================================================

# Check if script is run with parameters
if ($args.Count -eq 0) {
    Start-FullMonitoring
}
else {
    $param = $args[0].ToLower()
    switch ($param) {
        "quick" { Start-FullMonitoring -Quick }
        "detailed" { Start-FullMonitoring -Detailed }
        "continuous" { Start-FullMonitoring -ContinuousMonitor }
        default {
            Write-Warning "Unknown parameter: $param"
            Write-Info "Usage:"
            Write-Info "  .\Monitor-Vercel-Supabase.ps1           (Standard monitoring)"
            Write-Info "  .\Monitor-Vercel-Supabase.ps1 quick     (Quick test)"
            Write-Info "  .\Monitor-Vercel-Supabase.ps1 detailed  (Full report)"
            Write-Info "  .\Monitor-Vercel-Supabase.ps1 continuous (Continuous monitoring)"
        }
    }
}
