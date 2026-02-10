#!/bin/bash

# ================= HCO-CEH-VERSE v13 — NEXUS MODE =================
# Ethical Hacking Learning OS (Termux Edition)
# 100% Legal | Educational | YouTube + GitHub Safe

# ---------------- COLORS ----------------
R='\033[1;31m'; G='\033[1;32m'; Y='\033[1;33m'
B='\033[1;34m'; P='\033[1;35m'; C='\033[1;36m'; W='\033[0m'

YT_URL="https://youtube.com/@hackers_colony_tech?si=nrmAMrxxffy_AxFI"
BASE="$HOME/.hco_ceh_nexus"
DATA="$BASE/profile"
LEADER="$BASE/leaderboard"
LOG="$BASE/activity.log"

mkdir -p "$BASE"

# ---------------- DEPENDENCIES ----------------
deps=(figlet git curl wget python nmap php nodejs net-tools)
for d in "${deps[@]}"; do
  command -v $d >/dev/null || pkg install $d -y
done

# ---------------- USER PROFILE ----------------
if [ ! -f "$DATA" ]; then
  clear
  figlet NEXUS
  read -p "Create your hacker handle: " HANDLE
  echo "HANDLE=$HANDLE;LEVEL=1;XP=0;RANK=ROOKIE;MISSIONS=0" > "$DATA"
fi
source "$DATA"

# ---------------- SAVE + RANK ----------------
save(){ echo "HANDLE=$HANDLE;LEVEL=$LEVEL;XP=$XP;RANK=$RANK;MISSIONS=$MISSIONS" > "$DATA"; }

rank_check(){
  if   [ $LEVEL -ge 100 ]; then RANK="NEXUS"
  elif [ $LEVEL -ge 80 ]; then RANK="OMEGA"
  elif [ $LEVEL -ge 60 ]; then RANK="TITAN"
  elif [ $LEVEL -ge 45 ]; then RANK="MYTHIC"
  elif [ $LEVEL -ge 35 ]; then RANK="LEGEND"
  elif [ $LEVEL -ge 25 ]; then RANK="MASTER"
  elif [ $LEVEL -ge 15 ]; then RANK="PRO"
  elif [ $LEVEL -ge 5  ]; then RANK="INTERMEDIATE"
  else RANK="ROOKIE"; fi
}

xp_gain(){
  XP=$((XP+20))
  if [ $XP -ge 100 ]; then XP=0; LEVEL=$((LEVEL+1)); fi
  rank_check; save
  echo "$(date '+%F %T') | $HANDLE | +XP | L:$LEVEL R:$RANK" >> "$LOG"
}

# ---------------- YOUTUBE LOCK ----------------
clear
echo -e "$R"; figlet LOCKED
echo -e "$Y Follow Hackers Colony Tech To Unlock"
for i in 5 4 3 2 1; do echo -e "$G Opening YouTube in $i..."; sleep 1; done
am start -a android.intent.action.VIEW -d "$YT_URL" >/dev/null 2>&1

# ---------------- BANNER ----------------
banner(){
  clear
  echo -e "$C"; figlet HCO
  echo -e "$P CEH VERSE v13 — NEXUS MODE"
  echo -e "$Y User:$HANDLE  Level:$LEVEL  XP:$XP/100  Rank:$RANK  Missions:$MISSIONS"
  echo -e "$B -------------------------------------------------------------$W"
}

# ---------------- AI MENTOR ----------------
ai_mentor(){
  clear; figlet AI
  echo -e "$Y Learning Guidance"
  echo -e "$C Roadmap:"
  echo -e "$G Linux → Networking → Recon → Scanning → Web → CTF → Bug Bounty"
  echo -e "$Y Tip: Build labs, document findings, practice daily (legal)."
  xp_gain
  read -p "Press Enter..."
}

# ---------------- OFFLINE KNOWLEDGE BASE ----------------
kb(){
  clear; figlet KB
  echo -e "$Y Offline Knowledge Base"
  echo -e "$C 1) Linux  2) Networking  3) Nmap  4) Web  5) Bug Bounty"
  read -p "Select ➜ " k
  case $k in
    1) echo -e "$G Linux: ls cd pwd chmod chown grep awk sed";;
    2) echo -e "$G Net: TCP/IP DNS HTTP Ports OSI";;
    3) echo -e "$G Nmap: -sS -sV -A -O -p --script";;
    4) echo -e "$G Web: SQLi XSS CSRF IDOR SSRF Auth";;
    5) echo -e "$G Recon → Subdomains → Params → Web Vulns → Report";;
  esac
  xp_gain
  read -p "Press Enter..."
}

# ---------------- SMART ROADMAP ----------------
roadmap(){
  clear; figlet ROADMAP
  echo -e "$Y Personalized Plan:"
  echo -e "$C Beginner → Linux + Networking"
  echo -e "$C Mid → Recon + Nmap + Web Basics"
  echo -e "$C Pro → CTF + Bug Bounty + Automation (Legal)"
  xp_gain
  read -p "Press Enter..."
}

# ---------------- PRACTICE LABS ----------------
linux_lab(){ clear; figlet LINUX; xp_gain; bash; }

network_lab(){
  clear; figlet NETWORK
  echo -e "$Y Try:"
  echo -e "$C ifconfig | netstat -tunlp | ping google.com"
  xp_gain
  read -p "Press Enter..."
}

nmap_lab(){
  clear; figlet NMAP
  echo -e "$Y Legal Target: scanme.nmap.org"
  nmap -A scanme.nmap.org
  xp_gain
  read -p "Press Enter..."
}

web_lab(){
  clear; figlet WEB
  echo -e "$Y Legal Labs:"
  echo -e "$C https://testphp.vulnweb.com"
  echo -e "$C https://juice-shop.herokuapp.com"
  xp_gain
  read -p "Press Enter..."
}

# ---------------- SKILL CHALLENGES ----------------
challenge(){
  clear; figlet CHALLENGE
  echo -e "$Y Choose:"
  echo -e "$C 1) Linux Basics Quiz"
  echo -e "$C 2) Nmap Mini-Challenge"
  read -p "Select ➜ " c
  case $c in
    1) echo -e "$G Q: Command to list hidden files?"; read -p "Ans: " a;;
    2) echo -e "$G Task: Find open ports on scanme.nmap.org";;
  esac
  xp_gain; xp_gain
  read -p "Press Enter..."
}

# ---------------- DAILY MISSIONS ----------------
mission(){
  clear; figlet MISSION
  echo -e "$Y Tasks:"
  echo -e "$C Linux + Network + Nmap + Web"
  MISSIONS=$((MISSIONS+1))
  xp_gain; xp_gain; xp_gain
  save
  read -p "Done? Press Enter..."
}

# ---------------- ANALYTICS ----------------
analytics(){
  clear; figlet ANALYTICS
  echo -e "$Y Weekly Activity (last 20 logs):"
  tail -n 20 "$LOG" 2>/dev/null || echo "No logs yet."
  echo
  echo -e "$C Level:$LEVEL  XP:$XP  Rank:$RANK  Missions:$MISSIONS"
  read -p "Press Enter..."
}

# ---------------- LEADERBOARD ----------------
leaderboard(){
  clear; figlet LEADER
  echo "$HANDLE:$LEVEL:$RANK" >> "$LEADER"
  sort -t: -k2 -nr "$LEADER" | uniq | head -n 10 | nl
  read -p "Press Enter..."
}

# ---------------- WEB DASHBOARD ----------------
web_dashboard(){
  mkdir -p "$BASE/web"
  cat > "$BASE/web/index.html" <<EOF
<html><body style="background:black;color:lime;font-family:monospace">
<h1>HCO CEH VERSE — NEXUS MODE</h1>
<h2>User: $HANDLE</h2>
<h2>Level: $LEVEL</h2>
<h2>XP: $XP</h2>
<h2>Rank: $RANK</h2>
<h2>Missions: $MISSIONS</h2>
</body></html>
EOF
  cd "$BASE/web"
  php -S 127.0.0.1:6066 >/dev/null 2>&1 &
  echo -e "$G Open → http://127.0.0.1:6066"
  read -p "Press Enter..."
}

# ---------------- MAIN MENU ----------------
while true; do
  banner
  echo -e "$R [1]$C AI Mentor"
  echo -e "$R [2]$G Offline Knowledge Base"
  echo -e "$R [3]$Y Smart Roadmap"
  echo -e "$R [4]$P Linux Practice Lab"
  echo -e "$R [5]$B Network Learning Lab"
  echo -e "$R [6]$C Nmap Live Lab (Legal)"
  echo -e "$R [7]$G Web Security Lab"
  echo -e "$R [8]$Y Skill Challenges"
  echo -e "$R [9]$P Daily Missions"
  echo -e "$R [10]$C Analytics"
  echo -e "$R [11]$G Leaderboard"
  echo -e "$R [12]$Y Web Dashboard"
  echo -e "$R [0]$R Exit"
  read -p "Select ➜ " ch

  case $ch in
    1) ai_mentor ;;
    2) kb ;;
    3) roadmap ;;
    4) linux_lab ;;
    5) network_lab ;;
    6) nmap_lab ;;
    7) web_lab ;;
    8) challenge ;;
    9) mission ;;
    10) analytics ;;
    11) leaderboard ;;
    12) web_dashboard ;;
    0) exit ;;
    *) echo -e "$R Invalid Option"; sleep 1 ;;
  esac
done
