# 📊 Monitoring Script - Usage Guide
## Portal Rekapitulasi TWA GS Vercel & Supabase Monitor

---

## 🚀 QUICK START

### **Run Script:**

```powershell
# Standard monitoring (recommended)
.\Monitor-Vercel-Supabase.ps1

# Quick test only
.\Monitor-Vercel-Supabase.ps1 quick

# Full detailed report
.\Monitor-Vercel-Supabase.ps1 detailed

# Continuous monitoring (checks every 5 min)
.\Monitor-Vercel-Supabase.ps1 continuous
```

---

## 🔍 MONITORING MODES

### **1. STANDARD** (Default)
```powershell
.\Monitor-Vercel-Supabase.ps1
```

**Checks:**
- ✅ Vercel deployment status
- ✅ Supabase database connection
- ✅ GitHub repository status
- ✅ Local git status
- ✅ File integrity

**Output:** Console + Summary

---

### **2. QUICK**
```powershell
.\Monitor-Vercel-Supabase.ps1 quick
```

**Checks:**
- ✅ Vercel deployment (fast)
- ✅ Supabase connection (fast)

**Output:** Console only
**Time:** ~10 seconds

---

### **3. DETAILED**
```powershell
.\Monitor-Vercel-Supabase.ps1 detailed
```

**Checks:**
- ✅ All standard checks
- ✅ System diagnostics
- ✅ Performance metrics (5 requests)
- ✅ Generate detailed report file

**Output:** Console + Report file on Desktop
**Time:** ~30-60 seconds

---

### **4. CONTINUOUS**
```powershell
.\Monitor-Vercel-Supabase.ps1 continuous
```

**Behavior:**
- Checks Vercel every 5 minutes
- Runs continuously until stopped (Ctrl+C)
- Shows timestamp for each check

**Output:** Console (rolling)
**Best for:** Watching deployment progress

---

## 📋 WHAT EACH CHECK DOES

### **Vercel Deployment Status**
```
✅ Connects to: https://pnbptwags.vercel.app/app.html
✅ Verifies: HTTP 200 status + page content
✅ Tests: Custom domain firesky.my.id (if propagated)
```

### **Supabase Connection**
```
✅ Connects to: https://ydngshcjcrkjerwztibjo.supabase.co
✅ Verifies: Server is online
✅ Tests: REST API endpoint with authentication
```

### **GitHub Repository**
```
✅ Connects to: https://api.github.com/repos/iqbalpas45/PNBPTWAGS
✅ Shows: Branch, last commit, updated timestamp
```

### **Local Git Status**
```
✅ Current branch (should be: main)
✅ Last commit message
✅ Uncommitted changes (if any)
✅ Remote URL
```

### **File Integrity**
```
✅ Checks: app.html, vercel.json
✅ Checks: PANDUAN_PENGGUNAAN.md, SCRIPT_VIDEO.md, QUICK_REFERENCE.txt
✅ Shows: File size
```

### **System Diagnostics**
```
✅ PowerShell version
✅ OS version
✅ Internet connectivity (ping 8.8.8.8)
✅ DNS resolution (pnbptwags.vercel.app)
```

### **Performance Metrics**
```
✅ Makes 5 requests to Vercel
✅ Measures: Response time per request
✅ Calculates: Average, Min, Max response time
✅ Rating: EXCELLENT (<500ms), GOOD (500-1000ms), SLOW (>1000ms)
```

---

## 📊 OUTPUT EXAMPLES

### **✅ SUCCESS RESPONSE**

```
═══════════════════════════════════════════════════════════════
  VERCEL DEPLOYMENT STATUS
═══════════════════════════════════════════════════════════════

ℹ️  Testing Vercel deployment: https://pnbptwags.vercel.app/app.html
✅ Vercel deployment is ONLINE (Status: 200)
ℹ️  Response Time: ~150ms
✅ Page content verified - Application loaded correctly

ℹ️  Testing custom domain: https://firesky.my.id/app.html
✅ Custom domain is ONLINE and working!
```

### **⚠️ WARNING RESPONSE**

```
═══════════════════════════════════════════════════════════════
  VERCEL DEPLOYMENT STATUS
═══════════════════════════════════════════════════════════════

ℹ️  Testing Vercel deployment: https://pnbptwags.vercel.app/app.html
⚠️  Vercel returned status code: 503

ℹ️  Testing custom domain: https://firesky.my.id/app.html
⚠️  Custom domain not yet propagated or unreachable
```

### **❌ ERROR RESPONSE**

```
═══════════════════════════════════════════════════════════════
  SUPABASE DATABASE STATUS
═══════════════════════════════════════════════════════════════

ℹ️  Testing Supabase connection: https://ydngshcjcrkjerwztibjo.supabase.co
❌ Supabase server connection failed: Connection timeout
```

---

## 📈 PERFORMANCE METRICS EXAMPLE

```
═══════════════════════════════════════════════════════════════
  PERFORMANCE METRICS
═══════════════════════════════════════════════════════════════

ℹ️  Testing response times (5 requests)...
================================================

ℹ️  Request 1 : 145ms [Status: 200]
ℹ️  Request 2 : 152ms [Status: 200]
ℹ️  Request 3 : 148ms [Status: 200]
ℹ️  Request 4 : 150ms [Status: 200]
ℹ️  Request 5 : 155ms [Status: 200]

================================================
✅ Average Response Time: 150ms
ℹ️  Min Response Time: 145ms
ℹ️  Max Response Time: 155ms
✅ Performance: EXCELLENT (< 500ms)
```

---

## 📄 DETAILED REPORT

Ketika running dengan mode `detailed`, script akan generate file:

**Location:** `C:\Users\{Username}\Desktop\PNBPTWAGS_Monitor_Report_YYYYMMDD_HHmmss.txt`

**Contents:**
- Generated timestamp
- All URLs (Vercel, Supabase, GitHub)
- System information
- Check results summary

---

## ⚙️ REQUIREMENTS

### **PowerShell Version**
```powershell
# Check version
$PSVersionTable.PSVersion

# Required: PowerShell 5.0 or higher (Windows 10+)
# Recommended: PowerShell 7+ (pwsh)
```

### **Execution Policy**
```powershell
# If script won't run, allow execution:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### **Internet Connection**
✅ Required for all checks

### **External Dependencies**
❌ None (uses built-in PowerShell cmdlets only)

---

## 🔧 TROUBLESHOOTING

### **Script won't run**
```
Error: File cannot be loaded because running scripts is disabled...

Solution:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### **DNS check fails**
```
⚠️  DNS Resolution failed

Possible causes:
- Internet connection down
- DNS issue (try: ipconfig /flushdns)
- firewall blocking DNS
```

### **Supabase REST API test fails**
```
⚠️  Supabase REST API test failed

Normal if:
- Table is empty (expected)
- API key expired (need update)

Not critical for deployment check
```

### **Performance is slow**
```
⚠️  Average Response Time: 2000ms

Possible causes:
- Vercel rebuild in progress
- Slow internet connection
- Supabase cold start

Action: Wait 5-10 minutes and retry
```

---

## 📅 SCHEDULING SCRIPT

### **Option 1: Task Scheduler (Windows)**

```powershell
# Create scheduled task to run every 30 minutes
$trigger = New-ScheduledTaskTrigger -RepetitionInterval (New-TimeSpan -Minutes 30) -RepetitionDuration (New-TimeSpan -Days 1000)
$action = New-ScheduledTaskAction -Execute 'powershell' -Argument '-File C:\Users\Asus\PNBPTWAGS-Deploy\Monitor-Vercel-Supabase.ps1 quick'
Register-ScheduledTask -TaskName "PNBPTWAGS Monitor" -Trigger $trigger -Action $action -RunLevel Highest
```

### **Option 2: Continuous Monitoring**

```powershell
# Run in infinite loop
.\Monitor-Vercel-Supabase.ps1 continuous
```

---

## 📞 SUPPORT

**If monitoring shows issues:**

1. **Vercel Down** → Check Vercel dashboard / Twitter (@vercelstatus)
2. **Supabase Down** → Check Supabase status page
3. **DNS Not Propagated** → Wait 24 hours (typical TTL)
4. **Build in Progress** → Wait 5-10 minutes for rebuild
5. **Performance Slow** → Check internet speed / Vercel metrics

---

## 🎯 MONITORING CHECKLIST

**Daily:**
- [ ] Run `quick` check in morning
- [ ] Monitor performance metrics

**Weekly:**
- [ ] Run `detailed` check with full report
- [ ] Review file integrity

**Monthly:**
- [ ] Archive detailed reports
- [ ] Review performance trends

---

## 📊 MONITORING DASHBOARD

**Create automated dashboard:**
```powershell
# Run continuous monitoring in dedicated PowerShell window
.\Monitor-Vercel-Supabase.ps1 continuous
```

Leave running in background during development/deployment.

---

**Version:** 1.0
**Last Updated:** September 2026
**Built for:** Portal Rekapitulasi TWA GS v1.0
